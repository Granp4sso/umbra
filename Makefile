
# Author: Stefano Mercogliano <stefano.mercogliano@unina.it>
# Description:
#	this is umbra main makefile. It works in cooperation with settings.sh, which must be called as the first thing.
#	depending on the target platform and the host, configured by settings.sh,
#	it builds the secure boot ELF, but it does not support host building. Instead it is expecting
#	the host ELF path. You can program the target board, and debug it

CARGO_PATH_OPT = -Z unstable-options -C ${SECBOOT_DIR}
# either release or debug (next build in both release and debug mode)
BIN_MODE = release
BIN_PATH = ${SECBOOT_DIR}/target/${TARGET_ARCH}/${BIN_MODE}
BIN_NAME = boot

#########################################
#    _____                  _      		#
#   |_   _|_ _ _ _ __ _ ___| |_ ___		#
#     | |/ _` | '_/ _` / -_)  _(_-<		#
#     |_|\__,_|_| \__, \___|\__/__/		#
#                 |___/            		#
#########################################

###########################
# Secure Boot bin targets #
###########################

check: 
	@${CARGO} ${CARGO_PATH_OPT} check 

build:
	@${CARGO} ${CARGO_PATH_OPT} build --${BIN_MODE}
 
bin: 
	@$(OBJCOPY) -O binary $(BIN_PATH)/$(BIN_NAME) $(BINPATH)/$(BIN_NAME).bin
	
clean:
	@${CARGO} ${CARGO_PATH_OPT} clean 

#############
# Dump Code #
#############

objdump:
	@$(OBJDUMP) -D $(BIN_PATH)/$(BIN_NAME)

elfdump:
	@readelf -S $(BIN_PATH)/$(BIN_NAME)

hexdump:
	@hexdump -C $(BIN_PATH)/$(BIN_NAME).bin

cargodump:
	@${CARGO} ${CARGO_PATH_OPT} objdump --bin $(BIN_NAME) -- -d --no-show-raw-insn

##########################
# Umbra library creation #
##########################
# TBD: Build umbra library and export the umbralib.a path

##################
# Program Device #
##################

# Configure the target system security features
# Uses the flasher for stm32
enable_security:
	${FLASHER} ${CONNECT} ${SECURE_ENABLE};
	${FLASHER} ${CONNECT} ${OPTION_BYTES}

# Open the backend (openocd)
openocd:
	${OPENOCD} -f ${OPENOCD_CONFIG}


# TBD: 
# program_elf:
#	1 - load the secure boot ELF -> program_boot_elf:
#	2 - load the host ELF (that includes the umbralib.a) -> program_host_elf:

# Program the system using GDB (i.e. the ELF file)
# A backend (such as openocd) must be opened before doing this
program_boot_elf_stay: 
	$(GDB) $(BIN_PATH)/$(BIN_NAME) \
	-ex 'target extended-remote:3333' \
	-ex 'b secure_boot' \
	-ex 'set confirm off' \
	-ex 'r' \
	-ex 'load $(BIN_PATH)/$(BIN_NAME)' \
	-ex 'r' \
	-ex 'set confirm on'

#########
# PHONY #
#########

.PHONY: all clean 