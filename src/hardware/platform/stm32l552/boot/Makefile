
# Author: Stefano Mercogliano <stefano.mercogliano@unina.it>
# ...

#############################################
#   __   __        _      _    _        	#
#   \ \ / /_ _ _ _(_)__ _| |__| |___ ___	#
#    \ V / _` | '_| / _` | '_ \ / -_|_-<	#
#     \_/\__,_|_| |_\__,_|_.__/_\___/__/	#
#                                       	#
#############################################

PROJECT = boot
BINPATH = target/thumbv8m.main-none-eabihf/debug

LD_SCRIPT = ${LD_SCRIPT_DIR}/${MCU}.ld
GDBGUI_START = $(GDBGUI) -g $(GDB)

# Specify here the program entry point (may be the function name or an address)
ENTRY_POINY ?= main

# Instead of using a config.toml file, we pass the configuration 
# and target to the target to the Cargo call.

CARGO_TARGET = thumbv8m.main-none-eabihf
CARGO_LINKER = target.${CARGO_TARGET}.linker=\"${LD}\"
CARGO_LINKER_ARG = target.${CARGO_TARGET}.link-arg=\"-T${LD_SCRIPT}\"

#########################################
#    _____                  _      		#
#   |_   _|_ _ _ _ __ _ ___| |_ ___		#
#     | |/ _` | '_/ _` / -_)  _(_-<		#
#     |_|\__,_|_| \__, \___|\__/__/		#
#                 |___/            		#
#########################################

all: clean build bin program_target

#####################
# Build Application #
#####################

# Create the config.toml file (required for embedded building and linking)
config:
	@mkdir -p .cargo
	@cat /dev/null > .cargo/config.toml
	@echo '[target.${CARGO_TARGET}]' >> .cargo/config.toml
	@echo 'rustflags = [' >> .cargo/config.toml
	@echo '  "-C", "linker=${LD}",' >> .cargo/config.toml
	@echo '  "-C", "link-arg=-T${LD_SCRIPT}"' >> .cargo/config.toml
	@echo ']' >> .cargo/config.toml
	@echo '[build]\ntarget = "${CARGO_TARGET}"' >> .cargo/config.toml

check: config
	@${CARGO} check

build: config
	@${CARGO} build
 
bin: 
	@$(OBJCOPY) -O binary $(BINPATH)/$(PROJECT) $(BINPATH)/$(PROJECT).bin
# @$(OBJCOPY) --set-section-flags .nsc=alloc,load -O binary $(BINPATH)/$(PROJECT) $(BINPATH)/$(PROJECT).bin
	
clean:
	@rm $(BINPATH)/$(PROJECT)

.PHONY: all clean hexdump

#############
# Dump Code #
#############

objdump:
	@$(OBJDUMP) -D $(BINPATH)/$(PROJECT)

elfdump:
	@readelf -S $(BINPATH)/$(PROJECT)

hexdump:
	@hexdump -C $(BINPATH)/$(PROJECT).bin

cargodump:
	@${CARGO} objdump --bin $(PROJECT) -- -d --no-show-raw-insn

###################
# Programm Device #
###################

# Configure the target system security features
enable_security:
	${FLASHER} ${CONNECT} ${SECURE_ENABLE};
	${FLASHER} ${CONNECT} ${OPTION_BYTES}

# Program the system using the flasher (i.e. the flat binary)
program_target: enable_security
	${FLASHER} ${CONNECT} ${LOAD} $(BINPATH)/$(PROJECT).bin ${TARAGET_FLASH_START}

# Program the system using GDB (i.e. the ELF file)
# A backend (such as openocd) must be opened before doing this
program_elf: 
	$(GDB) $(BINPATH)/$(PROJECT) \
	-ex 'target extended-remote:3333' \
	-ex 'b ${ENTRY_POINY}' \
	-ex 'set confirm off' \
	-ex 'r' \
	-ex 'load $(BINPATH)/$(PROJECT)' \
	-ex 'r' \
	-ex 'set confirm on'

#####################
# Debug Application #
#####################

openocd:
	${OPENOCD} -f ${OPENOCD_CONFIG}
debug_gui:
	$(GDBGUI_START) $(BINPATH)/$(PROJECT)
debug:
	$(GDB) $(BINPATH)/$(PROJECT)
