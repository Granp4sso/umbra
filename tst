
/home/stefano/Desktop/Work/Projects/umbra/src/hardware/platform/stm32l552/boot/target/thumbv8m.main-none-eabi/release/boot:     file format elf32-littlearm


Disassembly of section .umbra_api_implementation:

08010000 <umbra_enclave_run_imp>:
 8010000:	e7fe      	b.n	8010000 <umbra_enclave_run_imp>

Disassembly of section .umbra_nsc_api:

0803c000 <umbra_enclave_run>:
 803c000:	e97f e97f 	sg
 803c004:	f7d3 fffc 	bl	8010000 <umbra_enclave_run_imp>

Disassembly of section ._umb_vector_table:

08000000 <._umb_vector_table>:
 8000000:	2003dffc 	strdcs	sp, [r3], -ip
 8000004:	08000040 	stmdaeq	r0, {r6}
 8000008:	08000048 	stmdaeq	r0, {r3, r6}
 800000c:	0800004c 	stmdaeq	r0, {r2, r3, r6}
 8000010:	08000050 	stmdaeq	r0, {r4, r6}
 8000014:	08000054 	stmdaeq	r0, {r2, r4, r6}
 8000018:	08000058 	stmdaeq	r0, {r3, r4, r6}
	...
 800002c:	0800005c 	stmdaeq	r0, {r2, r3, r4, r6}
 8000030:	08000060 	stmdaeq	r0, {r5, r6}
 8000034:	00000000 	andeq	r0, r0, r0
 8000038:	08000064 	stmdaeq	r0, {r2, r5, r6}
 800003c:	08000068 	stmdaeq	r0, {r3, r5, r6}

Disassembly of section ._umb_handlers:

08000040 <_umb_Reset_Handler>:
 8000040:	f000 f814 	bl	800006c <_umb_start>
 8000044:	e7fe      	b.n	8000044 <_umb_Reset_Handler+0x4>

08000046 <_umb_Default_Handler>:
 8000046:	e7fe      	b.n	8000046 <_umb_Default_Handler>

08000048 <_umb_NMI_Handler>:
 8000048:	f7ff bffd 	b.w	8000046 <_umb_Default_Handler>

0800004c <_umb_HardFault_Handler>:
 800004c:	f7ff bffb 	b.w	8000046 <_umb_Default_Handler>

08000050 <_umb_MemManage_Handler>:
 8000050:	f7ff bff9 	b.w	8000046 <_umb_Default_Handler>

08000054 <_umb_BusFault_Handler>:
 8000054:	f7ff bff7 	b.w	8000046 <_umb_Default_Handler>

08000058 <_umb_UsageFault_Handler>:
 8000058:	f7ff bff5 	b.w	8000046 <_umb_Default_Handler>

0800005c <_umb_SVC_Handler>:
 800005c:	f7ff bff3 	b.w	8000046 <_umb_Default_Handler>

08000060 <_umb_DebugMon_Handler>:
 8000060:	f7ff bff1 	b.w	8000046 <_umb_Default_Handler>

08000064 <_umb_PendSV_Handler>:
 8000064:	f7ff bfef 	b.w	8000046 <_umb_Default_Handler>

08000068 <_umb_SysTick_Handler>:
 8000068:	f7ff bfed 	b.w	8000046 <_umb_Default_Handler>

Disassembly of section ._umb_startup:

0800006c <_umb_start>:
 800006c:	f000 f80c 	bl	8000088 <secure_boot>

Disassembly of section .text:

08000070 <trampoline_to_ns>:
 8000070:	f04f 5000 	mov.w	r0, #536870912	; 0x20000000
 8000074:	4902      	ldr	r1, [pc, #8]	; (8000080 <trampoline_to_ns+0x10>)
 8000076:	6001      	str	r1, [r0, #0]
 8000078:	4802      	ldr	r0, [pc, #8]	; (8000084 <trampoline_to_ns+0x14>)
 800007a:	2101      	movs	r1, #1
 800007c:	4388      	bics	r0, r1
 800007e:	4784      	blxns	r0
 8000080:	fffff000 			; <UNDEFINED> instruction: 0xfffff000
 8000084:	08040040 	stmdaeq	r4, {r6}

08000088 <secure_boot>:
 8000088:	b580      	push	{r7, lr}
 800008a:	466f      	mov	r7, sp
 800008c:	f64e 55e0 	movw	r5, #60896	; 0xede0
 8000090:	f2ce 0500 	movt	r5, #57344	; 0xe000
 8000094:	f855 0c0c 	ldr.w	r0, [r5, #-12]
 8000098:	b2c1      	uxtb	r1, r0
 800009a:	2900      	cmp	r1, #0
 800009c:	d03e      	beq.n	800011c <secure_boot+0x94>
 800009e:	f000 0003 	and.w	r0, r0, #3
 80000a2:	2904      	cmp	r1, #4
 80000a4:	d201      	bcs.n	80000aa <secure_boot+0x22>
 80000a6:	2100      	movs	r1, #0
 80000a8:	e01f      	b.n	80000ea <secure_boot+0x62>
 80000aa:	1a0a      	subs	r2, r1, r0
 80000ac:	2100      	movs	r1, #0
 80000ae:	f845 1c08 	str.w	r1, [r5, #-8]
 80000b2:	682b      	ldr	r3, [r5, #0]
 80000b4:	f023 0301 	bic.w	r3, r3, #1
 80000b8:	602b      	str	r3, [r5, #0]
 80000ba:	1c4b      	adds	r3, r1, #1
 80000bc:	f845 3c08 	str.w	r3, [r5, #-8]
 80000c0:	682b      	ldr	r3, [r5, #0]
 80000c2:	f023 0301 	bic.w	r3, r3, #1
 80000c6:	602b      	str	r3, [r5, #0]
 80000c8:	1c8b      	adds	r3, r1, #2
 80000ca:	f845 3c08 	str.w	r3, [r5, #-8]
 80000ce:	682b      	ldr	r3, [r5, #0]
 80000d0:	f023 0301 	bic.w	r3, r3, #1
 80000d4:	602b      	str	r3, [r5, #0]
 80000d6:	1ccb      	adds	r3, r1, #3
 80000d8:	f845 3c08 	str.w	r3, [r5, #-8]
 80000dc:	682b      	ldr	r3, [r5, #0]
 80000de:	3104      	adds	r1, #4
 80000e0:	4291      	cmp	r1, r2
 80000e2:	f023 0301 	bic.w	r3, r3, #1
 80000e6:	602b      	str	r3, [r5, #0]
 80000e8:	d1e1      	bne.n	80000ae <secure_boot+0x26>
 80000ea:	b1b8      	cbz	r0, 800011c <secure_boot+0x94>
 80000ec:	f845 1c08 	str.w	r1, [r5, #-8]
 80000f0:	2801      	cmp	r0, #1
 80000f2:	682a      	ldr	r2, [r5, #0]
 80000f4:	f022 0201 	bic.w	r2, r2, #1
 80000f8:	602a      	str	r2, [r5, #0]
 80000fa:	d00f      	beq.n	800011c <secure_boot+0x94>
 80000fc:	1c4a      	adds	r2, r1, #1
 80000fe:	f845 2c08 	str.w	r2, [r5, #-8]
 8000102:	682a      	ldr	r2, [r5, #0]
 8000104:	2802      	cmp	r0, #2
 8000106:	f022 0201 	bic.w	r2, r2, #1
 800010a:	602a      	str	r2, [r5, #0]
 800010c:	d006      	beq.n	800011c <secure_boot+0x94>
 800010e:	1c88      	adds	r0, r1, #2
 8000110:	f845 0c08 	str.w	r0, [r5, #-8]
 8000114:	6828      	ldr	r0, [r5, #0]
 8000116:	f020 0001 	bic.w	r0, r0, #1
 800011a:	6028      	str	r0, [r5, #0]
 800011c:	2000      	movs	r0, #0
 800011e:	f845 0c08 	str.w	r0, [r5, #-8]
 8000122:	f855 0c10 	ldr.w	r0, [r5, #-16]
 8000126:	f020 0002 	bic.w	r0, r0, #2
 800012a:	f845 0c10 	str.w	r0, [r5, #-16]
 800012e:	f855 0c10 	ldr.w	r0, [r5, #-16]
 8000132:	f040 0001 	orr.w	r0, r0, #1
 8000136:	f845 0c10 	str.w	r0, [r5, #-16]
 800013a:	f855 0c0c 	ldr.w	r0, [r5, #-12]
 800013e:	b2c0      	uxtb	r0, r0
 8000140:	4241      	negs	r1, r0
 8000142:	f04f 30ff 	mov.w	r0, #4294967295	; 0xffffffff
 8000146:	180a      	adds	r2, r1, r0
 8000148:	1c53      	adds	r3, r2, #1
 800014a:	d01e      	beq.n	800018a <secure_boot+0x102>
 800014c:	1c43      	adds	r3, r0, #1
 800014e:	f845 3c08 	str.w	r3, [r5, #-8]
 8000152:	682e      	ldr	r6, [r5, #0]
 8000154:	07f6      	lsls	r6, r6, #31
 8000156:	d01a      	beq.n	800018e <secure_boot+0x106>
 8000158:	1c93      	adds	r3, r2, #2
 800015a:	d016      	beq.n	800018a <secure_boot+0x102>
 800015c:	1c83      	adds	r3, r0, #2
 800015e:	f845 3c08 	str.w	r3, [r5, #-8]
 8000162:	682e      	ldr	r6, [r5, #0]
 8000164:	07f6      	lsls	r6, r6, #31
 8000166:	d012      	beq.n	800018e <secure_boot+0x106>
 8000168:	1cd3      	adds	r3, r2, #3
 800016a:	d00e      	beq.n	800018a <secure_boot+0x102>
 800016c:	1cc3      	adds	r3, r0, #3
 800016e:	f845 3c08 	str.w	r3, [r5, #-8]
 8000172:	682e      	ldr	r6, [r5, #0]
 8000174:	07f6      	lsls	r6, r6, #31
 8000176:	d00a      	beq.n	800018e <secure_boot+0x106>
 8000178:	3204      	adds	r2, #4
 800017a:	d006      	beq.n	800018a <secure_boot+0x102>
 800017c:	3004      	adds	r0, #4
 800017e:	f845 0c08 	str.w	r0, [r5, #-8]
 8000182:	682a      	ldr	r2, [r5, #0]
 8000184:	07d2      	lsls	r2, r2, #31
 8000186:	d1de      	bne.n	8000146 <secure_boot+0xbe>
 8000188:	e002      	b.n	8000190 <secure_boot+0x108>
 800018a:	2000      	movs	r0, #0
 800018c:	e001      	b.n	8000192 <secure_boot+0x10a>
 800018e:	4618      	mov	r0, r3
 8000190:	b2c0      	uxtb	r0, r0
 8000192:	f845 0c08 	str.w	r0, [r5, #-8]
 8000196:	2000      	movs	r0, #0
 8000198:	f6c0 0003 	movt	r0, #2051	; 0x803
 800019c:	f500 3080 	add.w	r0, r0, #65536	; 0x10000
 80001a0:	f845 0c04 	str.w	r0, [r5, #-4]
 80001a4:	2001      	movs	r0, #1
 80001a6:	f6c0 0006 	movt	r0, #2054	; 0x806
 80001aa:	6028      	str	r0, [r5, #0]
 80001ac:	f855 0c0c 	ldr.w	r0, [r5, #-12]
 80001b0:	b2c0      	uxtb	r0, r0
 80001b2:	4241      	negs	r1, r0
 80001b4:	f04f 30ff 	mov.w	r0, #4294967295	; 0xffffffff
 80001b8:	180a      	adds	r2, r1, r0
 80001ba:	1c53      	adds	r3, r2, #1
 80001bc:	d01e      	beq.n	80001fc <secure_boot+0x174>
 80001be:	1c43      	adds	r3, r0, #1
 80001c0:	f845 3c08 	str.w	r3, [r5, #-8]
 80001c4:	682c      	ldr	r4, [r5, #0]
 80001c6:	07e4      	lsls	r4, r4, #31
 80001c8:	d01a      	beq.n	8000200 <secure_boot+0x178>
 80001ca:	1c93      	adds	r3, r2, #2
 80001cc:	d016      	beq.n	80001fc <secure_boot+0x174>
 80001ce:	1c83      	adds	r3, r0, #2
 80001d0:	f845 3c08 	str.w	r3, [r5, #-8]
 80001d4:	682c      	ldr	r4, [r5, #0]
 80001d6:	07e4      	lsls	r4, r4, #31
 80001d8:	d012      	beq.n	8000200 <secure_boot+0x178>
 80001da:	1cd3      	adds	r3, r2, #3
 80001dc:	d00e      	beq.n	80001fc <secure_boot+0x174>
 80001de:	1cc3      	adds	r3, r0, #3
 80001e0:	f845 3c08 	str.w	r3, [r5, #-8]
 80001e4:	682c      	ldr	r4, [r5, #0]
 80001e6:	07e4      	lsls	r4, r4, #31
 80001e8:	d00a      	beq.n	8000200 <secure_boot+0x178>
 80001ea:	3204      	adds	r2, #4
 80001ec:	d006      	beq.n	80001fc <secure_boot+0x174>
 80001ee:	3004      	adds	r0, #4
 80001f0:	f845 0c08 	str.w	r0, [r5, #-8]
 80001f4:	682a      	ldr	r2, [r5, #0]
 80001f6:	07d2      	lsls	r2, r2, #31
 80001f8:	d1de      	bne.n	80001b8 <secure_boot+0x130>
 80001fa:	e002      	b.n	8000202 <secure_boot+0x17a>
 80001fc:	2000      	movs	r0, #0
 80001fe:	e001      	b.n	8000204 <secure_boot+0x17c>
 8000200:	4618      	mov	r0, r3
 8000202:	b2c0      	uxtb	r0, r0
 8000204:	f845 0c08 	str.w	r0, [r5, #-8]
 8000208:	2001      	movs	r0, #1
 800020a:	f242 4100 	movw	r1, #9216	; 0x2400
 800020e:	f04f 5900 	mov.w	r9, #536870912	; 0x20000000
 8000212:	f2c2 0003 	movt	r0, #8195	; 0x2003
 8000216:	f845 9c04 	str.w	r9, [r5, #-4]
 800021a:	6028      	str	r0, [r5, #0]
 800021c:	f04f 0800 	mov.w	r8, #0
 8000220:	f2c4 0103 	movt	r1, #16387	; 0x4003
 8000224:	2001      	movs	r0, #1
 8000226:	f04f 0b02 	mov.w	fp, #2
 800022a:	f04f 0e04 	mov.w	lr, #4
 800022e:	f04f 0a08 	mov.w	sl, #8
 8000232:	e006      	b.n	8000242 <secure_boot+0x1ba>
 8000234:	f108 0801 	add.w	r8, r8, #1
 8000238:	f509 7980 	add.w	r9, r9, #256	; 0x100
 800023c:	f5b8 7f40 	cmp.w	r8, #768	; 0x300
 8000240:	d037      	beq.n	80002b2 <secure_boot+0x22a>
 8000242:	f409 3240 	and.w	r2, r9, #196608	; 0x30000
 8000246:	f501 6310 	add.w	r3, r1, #2304	; 0x900
 800024a:	f5b2 3f40 	cmp.w	r2, #196608	; 0x30000
 800024e:	f04f 021f 	mov.w	r2, #31
 8000252:	bf08      	it	eq
 8000254:	f501 6350 	addeq.w	r3, r1, #3328	; 0xd00
 8000258:	bf08      	it	eq
 800025a:	2207      	moveq	r2, #7
 800025c:	ea02 3259 	and.w	r2, r2, r9, lsr #13
 8000260:	2600      	movs	r6, #0
 8000262:	ea43 0382 	orr.w	r3, r3, r2, lsl #2
 8000266:	f3c9 2204 	ubfx	r2, r9, #8, #5
 800026a:	fa00 f202 	lsl.w	r2, r0, r2
 800026e:	fa00 f406 	lsl.w	r4, r0, r6
 8000272:	4214      	tst	r4, r2
 8000274:	bf1e      	ittt	ne
 8000276:	f853 c001 	ldrne.w	ip, [r3, r1]
 800027a:	ea2c 0404 	bicne.w	r4, ip, r4
 800027e:	505c      	strne	r4, [r3, r1]
 8000280:	fa0b f406 	lsl.w	r4, fp, r6
 8000284:	4214      	tst	r4, r2
 8000286:	bf1e      	ittt	ne
 8000288:	585d      	ldrne	r5, [r3, r1]
 800028a:	43a5      	bicne	r5, r4
 800028c:	505d      	strne	r5, [r3, r1]
 800028e:	fa0e f406 	lsl.w	r4, lr, r6
 8000292:	4214      	tst	r4, r2
 8000294:	bf1e      	ittt	ne
 8000296:	585d      	ldrne	r5, [r3, r1]
 8000298:	43a5      	bicne	r5, r4
 800029a:	505d      	strne	r5, [r3, r1]
 800029c:	2e1c      	cmp	r6, #28
 800029e:	d0c9      	beq.n	8000234 <secure_boot+0x1ac>
 80002a0:	fa0a f406 	lsl.w	r4, sl, r6
 80002a4:	4214      	tst	r4, r2
 80002a6:	bf1e      	ittt	ne
 80002a8:	585d      	ldrne	r5, [r3, r1]
 80002aa:	43a5      	bicne	r5, r4
 80002ac:	505d      	strne	r5, [r3, r1]
 80002ae:	3604      	adds	r6, #4
 80002b0:	e7dd      	b.n	800026e <secure_boot+0x1e6>
 80002b2:	f64e 55e0 	movw	r5, #60896	; 0xede0
 80002b6:	2400      	movs	r4, #0
 80002b8:	f2ce 0500 	movt	r5, #57344	; 0xe000
 80002bc:	f6c0 0403 	movt	r4, #2051	; 0x803
 80002c0:	f855 0c0c 	ldr.w	r0, [r5, #-12]
 80002c4:	b2c0      	uxtb	r0, r0
 80002c6:	4241      	negs	r1, r0
 80002c8:	f04f 30ff 	mov.w	r0, #4294967295	; 0xffffffff
 80002cc:	180a      	adds	r2, r1, r0
 80002ce:	1c53      	adds	r3, r2, #1
 80002d0:	d01e      	beq.n	8000310 <secure_boot+0x288>
 80002d2:	1c43      	adds	r3, r0, #1
 80002d4:	f845 3c08 	str.w	r3, [r5, #-8]
 80002d8:	682e      	ldr	r6, [r5, #0]
 80002da:	07f6      	lsls	r6, r6, #31
 80002dc:	d01a      	beq.n	8000314 <secure_boot+0x28c>
 80002de:	1c93      	adds	r3, r2, #2
 80002e0:	d016      	beq.n	8000310 <secure_boot+0x288>
 80002e2:	1c83      	adds	r3, r0, #2
 80002e4:	f845 3c08 	str.w	r3, [r5, #-8]
 80002e8:	682e      	ldr	r6, [r5, #0]
 80002ea:	07f6      	lsls	r6, r6, #31
 80002ec:	d012      	beq.n	8000314 <secure_boot+0x28c>
 80002ee:	1cd3      	adds	r3, r2, #3
 80002f0:	d00e      	beq.n	8000310 <secure_boot+0x288>
 80002f2:	1cc3      	adds	r3, r0, #3
 80002f4:	f845 3c08 	str.w	r3, [r5, #-8]
 80002f8:	682e      	ldr	r6, [r5, #0]
 80002fa:	07f6      	lsls	r6, r6, #31
 80002fc:	d00a      	beq.n	8000314 <secure_boot+0x28c>
 80002fe:	3204      	adds	r2, #4
 8000300:	d006      	beq.n	8000310 <secure_boot+0x288>
 8000302:	3004      	adds	r0, #4
 8000304:	f845 0c08 	str.w	r0, [r5, #-8]
 8000308:	682a      	ldr	r2, [r5, #0]
 800030a:	07d2      	lsls	r2, r2, #31
 800030c:	d1de      	bne.n	80002cc <secure_boot+0x244>
 800030e:	e002      	b.n	8000316 <secure_boot+0x28e>
 8000310:	2000      	movs	r0, #0
 8000312:	e001      	b.n	8000318 <secure_boot+0x290>
 8000314:	4618      	mov	r0, r3
 8000316:	b2c0      	uxtb	r0, r0
 8000318:	f845 0c08 	str.w	r0, [r5, #-8]
 800031c:	2003      	movs	r0, #3
 800031e:	f6c0 0004 	movt	r0, #2052	; 0x804
 8000322:	f845 4c04 	str.w	r4, [r5, #-4]
 8000326:	6028      	str	r0, [r5, #0]
 8000328:	f7ff fea2 	bl	8000070 <trampoline_to_ns>
 800032c:	e7fe      	b.n	800032c <secure_boot+0x2a4>

Disassembly of section .ARM.exidx.text.secure_boot:

08000330 <.ARM.exidx.text.secure_boot>:
 8000330:	7ffffd58 	svcvc	0x00fffd58
 8000334:	00000001 	andeq	r0, r0, r1

Disassembly of section .debug_loc:

00000000 <.debug_loc>:
       0:	00000010 	andeq	r0, r0, r0, lsl r0
       4:	0000001a 	andeq	r0, r0, sl, lsl r0
       8:	9f300009 	svcls	0x00300009
       c:	00700193 			; <UNDEFINED> instruction: 0x00700193
      10:	1a01939f 	bne	64e94 <_umb_stack_size+0x63e94>
      14:	26000000 	strcs	r0, [r0], -r0
      18:	04000000 	streq	r0, [r0], #-0
      1c:	939f3000 	orrsls	r3, pc, #0
      20:	00002601 	andeq	r2, r0, r1, lsl #12
      24:	00003200 	andeq	r3, r0, r0, lsl #4
      28:	71000700 	tstvc	r0, r0, lsl #14
      2c:	9f213100 	svcls	0x00213100
      30:	00320193 	mlaseq	r2, r3, r1, r0
      34:	00400000 	subeq	r0, r0, r0
      38:	00070000 	andeq	r0, r7, r0
      3c:	21320071 	teqcs	r2, r1, ror r0
      40:	4001939f 	mulmi	r1, pc, r3	; <UNPREDICTABLE>
      44:	58000000 	stmdapl	r0, {}	; <UNPREDICTABLE>
      48:	07000000 	streq	r0, [r0, -r0]
      4c:	33007100 	movwcc	r7, #256	; 0x100
      50:	01939f21 	orrseq	r9, r3, r1, lsr #30
      54:	00000058 	andeq	r0, r0, r8, asr r0
      58:	00000062 	andeq	r0, r0, r2, rrx
      5c:	93510003 	cmpls	r1, #3
      60:	00006401 	andeq	r6, r0, r1, lsl #8
      64:	00007600 	andeq	r7, r0, r0, lsl #12
      68:	71000500 	tstvc	r0, r0, lsl #10
      6c:	01939f01 	orrseq	r9, r3, r1, lsl #30
      70:	00000076 	andeq	r0, r0, r6, ror r0
      74:	00000088 	andeq	r0, r0, r8, lsl #1
      78:	02710005 	rsbseq	r0, r1, #5
      7c:	0001939f 	muleq	r1, pc, r3	; <UNPREDICTABLE>
      80:	00000000 	andeq	r0, r0, r0
      84:	10000000 	andne	r0, r0, r0
      88:	1a000000 	bne	90 <_umb_stack_size-0xf70>
      8c:	03000000 	movweq	r0, #0
      90:	9f007000 	svcls	0x00007000
	...
      9c:	00000040 	andeq	r0, r0, r0, asr #32
      a0:	00000058 	andeq	r0, r0, r8, asr r0
      a4:	00710005 	rsbseq	r0, r1, r5
      a8:	749f2132 	ldrvc	r2, [pc], #306	; b0 <_umb_stack_size-0xf50>
      ac:	76000000 	strvc	r0, [r0], -r0
      b0:	01000000 	mrseq	r0, (UNDEF: 0)
      b4:	00765100 	rsbseq	r5, r6, r0, lsl #2
      b8:	007c0000 	rsbseq	r0, ip, r0
      bc:	00010000 	andeq	r0, r1, r0
      c0:	00000052 	andeq	r0, r0, r2, asr r0
      c4:	00000000 	andeq	r0, r0, r0
      c8:	00004000 	andeq	r4, r0, r0
      cc:	00005800 	andeq	r5, r0, r0, lsl #16
      d0:	71000500 	tstvc	r0, r0, lsl #10
      d4:	9f213200 	svcls	0x00213200
      d8:	00000074 	andeq	r0, r0, r4, ror r0
      dc:	00000076 	andeq	r0, r0, r6, ror r0
      e0:	76510001 	ldrbvc	r0, [r1], -r1
      e4:	7c000000 	stcvc	0, cr0, [r0], {-0}
      e8:	01000000 	mrseq	r0, (UNDEF: 0)
      ec:	00005200 	andeq	r5, r0, r0, lsl #4
      f0:	00000000 	andeq	r0, r0, r0
      f4:	00400000 	subeq	r0, r0, r0
      f8:	00580000 	subseq	r0, r8, r0
      fc:	00050000 	andeq	r0, r5, r0
     100:	21320071 	teqcs	r2, r1, ror r0
     104:	0000749f 	muleq	r0, pc, r4	; <UNPREDICTABLE>
     108:	00007600 	andeq	r7, r0, r0, lsl #12
     10c:	51000100 	mrspl	r0, (UNDEF: 16)
     110:	00000076 	andeq	r0, r0, r6, ror r0
     114:	0000007c 	andeq	r0, r0, ip, ror r0
     118:	00520001 	subseq	r0, r2, r1
     11c:	00000000 	andeq	r0, r0, r0
     120:	26000000 	strcs	r0, [r0], -r0
     124:	32000000 	andcc	r0, r0, #0
     128:	01000000 	mrseq	r0, (UNDEF: 0)
     12c:	00325100 	eorseq	r5, r2, r0, lsl #2
     130:	00400000 	subeq	r0, r0, r0
     134:	00050000 	andeq	r0, r5, r0
     138:	21310071 	teqcs	r1, r1, ror r0
     13c:	0000409f 	muleq	r0, pc, r0	; <UNPREDICTABLE>
     140:	00004e00 	andeq	r4, r0, r0, lsl #28
     144:	71000500 	tstvc	r0, r0, lsl #10
     148:	9f213200 	svcls	0x00213200
     14c:	0000004e 	andeq	r0, r0, lr, asr #32
     150:	00000058 	andeq	r0, r0, r8, asr r0
     154:	00710005 	rsbseq	r0, r1, r5
     158:	649f2133 	ldrvs	r2, [pc], #307	; 160 <_umb_stack_size-0xea0>
     15c:	74000000 	strvc	r0, [r0], #-0
     160:	01000000 	mrseq	r0, (UNDEF: 0)
     164:	00765100 	rsbseq	r5, r6, r0, lsl #2
     168:	007c0000 	rsbseq	r0, ip, r0
     16c:	00010000 	andeq	r0, r1, r0
     170:	00008852 	andeq	r8, r0, r2, asr r8
     174:	00008e00 	andeq	r8, r0, r0, lsl #28
     178:	50000100 	andpl	r0, r0, r0, lsl #2
	...
     184:	00000026 	andeq	r0, r0, r6, lsr #32
     188:	00000062 	andeq	r0, r0, r2, rrx
     18c:	d010000c 	andsle	r0, r0, ip
     190:	fe8083db 	mcr2	3, 4, r8, cr0, cr11, {6}
     194:	ffffffff 			; <UNDEFINED> instruction: 0xffffffff
     198:	00649f01 	rsbeq	r9, r4, r1, lsl #30
     19c:	00940000 	addseq	r0, r4, r0
     1a0:	000c0000 	andeq	r0, ip, r0
     1a4:	83dbd010 	bicshi	sp, fp, #16
     1a8:	fffffe80 			; <UNDEFINED> instruction: 0xfffffe80
     1ac:	9f01ffff 	svcls	0x0001ffff
	...
     1b8:	00000026 	andeq	r0, r0, r6, lsr #32
     1bc:	00000062 	andeq	r0, r0, r2, rrx
     1c0:	9f380002 	svcls	0x00380002
     1c4:	00000064 	andeq	r0, r0, r4, rrx
     1c8:	00000094 	muleq	r0, r4, r0
     1cc:	9f380002 	svcls	0x00380002
	...
     1d8:	00000026 	andeq	r0, r0, r6, lsr #32
     1dc:	00000032 	andeq	r0, r0, r2, lsr r0
     1e0:	32510001 	subscc	r0, r1, #1
     1e4:	40000000 	andmi	r0, r0, r0
     1e8:	05000000 	streq	r0, [r0, #-0]
     1ec:	31007100 	mrscc	r7, (UNDEF: 16)
     1f0:	00409f21 	subeq	r9, r0, r1, lsr #30
     1f4:	004e0000 	subeq	r0, lr, r0
     1f8:	00050000 	andeq	r0, r5, r0
     1fc:	21320071 	teqcs	r2, r1, ror r0
     200:	00004e9f 	muleq	r0, pc, lr	; <UNPREDICTABLE>
     204:	00005800 	andeq	r5, r0, r0, lsl #16
     208:	71000500 	tstvc	r0, r0, lsl #10
     20c:	9f213300 	svcls	0x00213300
     210:	00000064 	andeq	r0, r0, r4, rrx
     214:	00000074 	andeq	r0, r0, r4, ror r0
     218:	76510001 	ldrbvc	r0, [r1], -r1
     21c:	7c000000 	stcvc	0, cr0, [r0], {-0}
     220:	01000000 	mrseq	r0, (UNDEF: 0)
     224:	00885200 	addeq	r5, r8, r0, lsl #4
     228:	008e0000 	addeq	r0, lr, r0
     22c:	00010000 	andeq	r0, r1, r0
     230:	00000050 	andeq	r0, r0, r0, asr r0
     234:	00000000 	andeq	r0, r0, r0
     238:	00002600 	andeq	r2, r0, r0, lsl #12
     23c:	00003200 	andeq	r3, r0, r0, lsl #4
     240:	51000100 	mrspl	r0, (UNDEF: 16)
     244:	00000032 	andeq	r0, r0, r2, lsr r0
     248:	00000040 	andeq	r0, r0, r0, asr #32
     24c:	00710005 	rsbseq	r0, r1, r5
     250:	409f2131 	addsmi	r2, pc, r1, lsr r1	; <UNPREDICTABLE>
     254:	4e000000 	cdpmi	0, 0, cr0, cr0, cr0, {0}
     258:	05000000 	streq	r0, [r0, #-0]
     25c:	32007100 	andcc	r7, r0, #0, 2
     260:	004e9f21 	subeq	r9, lr, r1, lsr #30
     264:	00580000 	subseq	r0, r8, r0
     268:	00050000 	andeq	r0, r5, r0
     26c:	21330071 	teqcs	r3, r1, ror r0
     270:	0000649f 	muleq	r0, pc, r4	; <UNPREDICTABLE>
     274:	00007400 	andeq	r7, r0, r0, lsl #8
     278:	51000100 	mrspl	r0, (UNDEF: 16)
     27c:	00000076 	andeq	r0, r0, r6, ror r0
     280:	0000007c 	andeq	r0, r0, ip, ror r0
     284:	88520001 	ldmdahi	r2, {r0}^
     288:	8e000000 	cdphi	0, 0, cr0, cr0, cr0, {0}
     28c:	01000000 	mrseq	r0, (UNDEF: 0)
     290:	00005000 	andeq	r5, r0, r0
     294:	00000000 	andeq	r0, r0, r0
     298:	00260000 	eoreq	r0, r6, r0
     29c:	00620000 	rsbeq	r0, r2, r0
     2a0:	000c0000 	andeq	r0, ip, r0
     2a4:	83dbd010 	bicshi	sp, fp, #16
     2a8:	fffffe80 			; <UNDEFINED> instruction: 0xfffffe80
     2ac:	9f01ffff 	svcls	0x0001ffff
     2b0:	00000064 	andeq	r0, r0, r4, rrx
     2b4:	00000094 	muleq	r0, r4, r0
     2b8:	d010000c 	andsle	r0, r0, ip
     2bc:	fe8083db 	mcr2	3, 4, r8, cr0, cr11, {6}
     2c0:	ffffffff 			; <UNDEFINED> instruction: 0xffffffff
     2c4:	00009f01 	andeq	r9, r0, r1, lsl #30
     2c8:	00000000 	andeq	r0, r0, r0
     2cc:	00260000 	eoreq	r0, r6, r0
     2d0:	00620000 	rsbeq	r0, r2, r0
     2d4:	000c0000 	andeq	r0, ip, r0
     2d8:	83dbd810 	bicshi	sp, fp, #16, 16	; 0x100000
     2dc:	fffffe80 			; <UNDEFINED> instruction: 0xfffffe80
     2e0:	9f01ffff 	svcls	0x0001ffff
     2e4:	00000064 	andeq	r0, r0, r4, rrx
     2e8:	00000094 	muleq	r0, r4, r0
     2ec:	d810000c 	ldmdale	r0, {r2, r3}
     2f0:	fe8083db 	mcr2	3, 4, r8, cr0, cr11, {6}
     2f4:	ffffffff 			; <UNDEFINED> instruction: 0xffffffff
     2f8:	00009f01 	andeq	r9, r0, r1, lsl #30
     2fc:	00000000 	andeq	r0, r0, r0
     300:	002a0000 	eoreq	r0, sl, r0
     304:	00620000 	rsbeq	r0, r2, r0
     308:	000c0000 	andeq	r0, ip, r0
     30c:	83dbe010 	bicshi	lr, fp, #16
     310:	fffffe80 			; <UNDEFINED> instruction: 0xfffffe80
     314:	9f01ffff 	svcls	0x0001ffff
     318:	00000068 	andeq	r0, r0, r8, rrx
     31c:	00000094 	muleq	r0, r4, r0
     320:	e010000c 	ands	r0, r0, ip
     324:	fe8083db 	mcr2	3, 4, r8, cr0, cr11, {6}
     328:	ffffffff 			; <UNDEFINED> instruction: 0xffffffff
     32c:	00009f01 	andeq	r9, r0, r1, lsl #30
     330:	00000000 	andeq	r0, r0, r0
     334:	002a0000 	eoreq	r0, sl, r0
     338:	00620000 	rsbeq	r0, r2, r0
     33c:	000c0000 	andeq	r0, ip, r0
     340:	83dbd010 	bicshi	sp, fp, #16
     344:	fffffe80 			; <UNDEFINED> instruction: 0xfffffe80
     348:	9f01ffff 	svcls	0x0001ffff
     34c:	00000068 	andeq	r0, r0, r8, rrx
     350:	00000094 	muleq	r0, r4, r0
     354:	d010000c 	andsle	r0, r0, ip
     358:	fe8083db 	mcr2	3, 4, r8, cr0, cr11, {6}
     35c:	ffffffff 			; <UNDEFINED> instruction: 0xffffffff
     360:	00009f01 	andeq	r9, r0, r1, lsl #30
     364:	00000000 	andeq	r0, r0, r0
     368:	002a0000 	eoreq	r0, sl, r0
     36c:	00620000 	rsbeq	r0, r2, r0
     370:	00020000 	andeq	r0, r2, r0
     374:	00689f40 	rsbeq	r9, r8, r0, asr #30
     378:	00940000 	addseq	r0, r4, r0
     37c:	00020000 	andeq	r0, r2, r0
     380:	00009f40 	andeq	r9, r0, r0, asr #30
     384:	00000000 	andeq	r0, r0, r0
     388:	002a0000 	eoreq	r0, sl, r0
     38c:	00620000 	rsbeq	r0, r2, r0
     390:	000c0000 	andeq	r0, ip, r0
     394:	83dbd010 	bicshi	sp, fp, #16
     398:	fffffe80 			; <UNDEFINED> instruction: 0xfffffe80
     39c:	9f01ffff 	svcls	0x0001ffff
     3a0:	00000068 	andeq	r0, r0, r8, rrx
     3a4:	00000094 	muleq	r0, r4, r0
     3a8:	d010000c 	andsle	r0, r0, ip
     3ac:	fe8083db 	mcr2	3, 4, r8, cr0, cr11, {6}
     3b0:	ffffffff 			; <UNDEFINED> instruction: 0xffffffff
     3b4:	00009f01 	andeq	r9, r0, r1, lsl #30
     3b8:	00000000 	andeq	r0, r0, r0
     3bc:	002a0000 	eoreq	r0, sl, r0
     3c0:	00620000 	rsbeq	r0, r2, r0
     3c4:	00020000 	andeq	r0, r2, r0
     3c8:	00689f30 	rsbeq	r9, r8, r0, lsr pc
     3cc:	00940000 	addseq	r0, r4, r0
     3d0:	00020000 	andeq	r0, r2, r0
     3d4:	00009f30 	andeq	r9, r0, r0, lsr pc
     3d8:	00000000 	andeq	r0, r0, r0
     3dc:	002a0000 	eoreq	r0, sl, r0
     3e0:	00620000 	rsbeq	r0, r2, r0
     3e4:	00020000 	andeq	r0, r2, r0
     3e8:	00689f40 	rsbeq	r9, r8, r0, asr #30
     3ec:	00940000 	addseq	r0, r4, r0
     3f0:	00020000 	andeq	r0, r2, r0
     3f4:	00009f40 	andeq	r9, r0, r0, asr #30
     3f8:	00000000 	andeq	r0, r0, r0
     3fc:	002a0000 	eoreq	r0, sl, r0
     400:	00620000 	rsbeq	r0, r2, r0
     404:	000c0000 	andeq	r0, ip, r0
     408:	83dbd010 	bicshi	sp, fp, #16
     40c:	fffffe80 			; <UNDEFINED> instruction: 0xfffffe80
     410:	9f01ffff 	svcls	0x0001ffff
     414:	00000068 	andeq	r0, r0, r8, rrx
     418:	00000094 	muleq	r0, r4, r0
     41c:	d010000c 	andsle	r0, r0, ip
     420:	fe8083db 	mcr2	3, 4, r8, cr0, cr11, {6}
     424:	ffffffff 			; <UNDEFINED> instruction: 0xffffffff
     428:	00009f01 	andeq	r9, r0, r1, lsl #30
     42c:	00000000 	andeq	r0, r0, r0
     430:	002a0000 	eoreq	r0, sl, r0
     434:	00620000 	rsbeq	r0, r2, r0
     438:	00020000 	andeq	r0, r2, r0
     43c:	00689f30 	rsbeq	r9, r8, r0, lsr pc
     440:	00940000 	addseq	r0, r4, r0
     444:	00020000 	andeq	r0, r2, r0
     448:	00009f30 	andeq	r9, r0, r0, lsr pc
     44c:	00000000 	andeq	r0, r0, r0
     450:	002a0000 	eoreq	r0, sl, r0
     454:	00620000 	rsbeq	r0, r2, r0
     458:	00020000 	andeq	r0, r2, r0
     45c:	00689f30 	rsbeq	r9, r8, r0, lsr pc
     460:	00940000 	addseq	r0, r4, r0
     464:	00020000 	andeq	r0, r2, r0
     468:	00009f30 	andeq	r9, r0, r0, lsr pc
     46c:	00000000 	andeq	r0, r0, r0
     470:	002a0000 	eoreq	r0, sl, r0
     474:	00620000 	rsbeq	r0, r2, r0
     478:	00080000 	andeq	r0, r8, r0
     47c:	02939f31 	addseq	r9, r3, #49, 30	; 0xc4
     480:	02939f31 	addseq	r9, r3, #49, 30	; 0xc4
     484:	00000068 	andeq	r0, r0, r8, rrx
     488:	00000074 	andeq	r0, r0, r4, ror r0
     48c:	9f310008 	svcls	0x00310008
     490:	9f310293 	svcls	0x00310293
     494:	00740293 			; <UNDEFINED> instruction: 0x00740293
     498:	007a0000 	rsbseq	r0, sl, r0
     49c:	00040000 	andeq	r0, r4, r0
     4a0:	02939f31 	addseq	r9, r3, #49, 30	; 0xc4
     4a4:	0000007a 	andeq	r0, r0, sl, ror r0
     4a8:	00000086 	andeq	r0, r0, r6, lsl #1
     4ac:	9f310008 	svcls	0x00310008
     4b0:	9f310293 	svcls	0x00310293
     4b4:	00860293 	umulleq	r0, r6, r3, r2
     4b8:	008c0000 	addeq	r0, ip, r0
     4bc:	00040000 	andeq	r0, r4, r0
     4c0:	02939f31 	addseq	r9, r3, #49, 30	; 0xc4
     4c4:	0000008c 	andeq	r0, r0, ip, lsl #1
     4c8:	00000094 	muleq	r0, r4, r0
     4cc:	9f310008 	svcls	0x00310008
     4d0:	9f310293 	svcls	0x00310293
     4d4:	00000293 	muleq	r0, r3, r2
     4d8:	00000000 	andeq	r0, r0, r0
     4dc:	002a0000 	eoreq	r0, sl, r0
     4e0:	00620000 	rsbeq	r0, r2, r0
     4e4:	00080000 	andeq	r0, r8, r0
     4e8:	10028010 	andne	r8, r2, r0, lsl r0
     4ec:	9f1a01ff 	svcls	0x001a01ff
     4f0:	00000068 	andeq	r0, r0, r8, rrx
     4f4:	00000094 	muleq	r0, r4, r0
     4f8:	80100008 	andshi	r0, r0, r8
     4fc:	01ff1002 	mvnseq	r1, r2
     500:	00009f1a 	andeq	r9, r0, sl, lsl pc
     504:	00000000 	andeq	r0, r0, r0
     508:	002a0000 	eoreq	r0, sl, r0
     50c:	00620000 	rsbeq	r0, r2, r0
     510:	00020000 	andeq	r0, r2, r0
     514:	00689f31 	rsbeq	r9, r8, r1, lsr pc
     518:	00940000 	addseq	r0, r4, r0
     51c:	00020000 	andeq	r0, r2, r0
     520:	00009f31 	andeq	r9, r0, r1, lsr pc
     524:	00000000 	andeq	r0, r0, r0
     528:	002a0000 	eoreq	r0, sl, r0
     52c:	00620000 	rsbeq	r0, r2, r0
     530:	00020000 	andeq	r0, r2, r0
     534:	00689f31 	rsbeq	r9, r8, r1, lsr pc
     538:	00940000 	addseq	r0, r4, r0
     53c:	00020000 	andeq	r0, r2, r0
     540:	00009f31 	andeq	r9, r0, r1, lsr pc
     544:	00000000 	andeq	r0, r0, r0
     548:	002a0000 	eoreq	r0, sl, r0
     54c:	00620000 	rsbeq	r0, r2, r0
     550:	00040000 	andeq	r0, r4, r0
     554:	9f028010 	svcls	0x00028010
     558:	00000068 	andeq	r0, r0, r8, rrx
     55c:	00000094 	muleq	r0, r4, r0
     560:	80100004 	andshi	r0, r0, r4
     564:	00009f02 	andeq	r9, r0, r2, lsl #30
     568:	00000000 	andeq	r0, r0, r0
     56c:	002a0000 	eoreq	r0, sl, r0
     570:	00620000 	rsbeq	r0, r2, r0
     574:	00020000 	andeq	r0, r2, r0
     578:	00689f40 	rsbeq	r9, r8, r0, asr #30
     57c:	00940000 	addseq	r0, r4, r0
     580:	00020000 	andeq	r0, r2, r0
     584:	00009f40 	andeq	r9, r0, r0, asr #30
     588:	00000000 	andeq	r0, r0, r0
     58c:	002a0000 	eoreq	r0, sl, r0
     590:	00620000 	rsbeq	r0, r2, r0
     594:	000c0000 	andeq	r0, ip, r0
     598:	83dbd010 	bicshi	sp, fp, #16
     59c:	fffffe80 			; <UNDEFINED> instruction: 0xfffffe80
     5a0:	9f01ffff 	svcls	0x0001ffff
     5a4:	00000068 	andeq	r0, r0, r8, rrx
     5a8:	00000094 	muleq	r0, r4, r0
     5ac:	d010000c 	andsle	r0, r0, ip
     5b0:	fe8083db 	mcr2	3, 4, r8, cr0, cr11, {6}
     5b4:	ffffffff 			; <UNDEFINED> instruction: 0xffffffff
     5b8:	00009f01 	andeq	r9, r0, r1, lsl #30
     5bc:	00000000 	andeq	r0, r0, r0
     5c0:	002c0000 	eoreq	r0, ip, r0
     5c4:	00300000 	eorseq	r0, r0, r0
     5c8:	00010000 	andeq	r0, r1, r0
     5cc:	00003a53 	andeq	r3, r0, r3, asr sl
     5d0:	00003e00 	andeq	r3, r0, r0, lsl #28
     5d4:	53000100 	movwpl	r0, #256	; 0x100
     5d8:	00000048 	andeq	r0, r0, r8, asr #32
     5dc:	0000004c 	andeq	r0, r0, ip, asr #32
     5e0:	56530001 	ldrbpl	r0, [r3], -r1
     5e4:	5e000000 	cdppl	0, 0, cr0, cr0, cr0, {0}
     5e8:	01000000 	mrseq	r0, (UNDEF: 0)
     5ec:	006c5300 	rsbeq	r5, ip, r0, lsl #6
     5f0:	00700000 	rsbseq	r0, r0, r0
     5f4:	00010000 	andeq	r0, r1, r0
     5f8:	00007c52 	andeq	r7, r0, r2, asr ip
     5fc:	00008200 	andeq	r8, r0, r0, lsl #4
     600:	52000100 	andpl	r0, r0, #0, 2
     604:	0000008e 	andeq	r0, r0, lr, lsl #1
     608:	00000092 	muleq	r0, r2, r0
     60c:	00500001 	subseq	r0, r0, r1
     610:	00000000 	andeq	r0, r0, r0
     614:	30000000 	andcc	r0, r0, r0
     618:	62000000 	andvs	r0, r0, #0
     61c:	0c000000 	stceq	0, cr0, [r0], {-0}
     620:	dbe01000 	blle	ff804628 <_umb_estack+0xdf7c662c>
     624:	fffe8083 			; <UNDEFINED> instruction: 0xfffe8083
     628:	01ffffff 	ldrsheq	pc, [pc, #255]	; 72f <_umb_stack_size-0x8d1>	; <UNPREDICTABLE>
     62c:	0000709f 	muleq	r0, pc, r0	; <UNPREDICTABLE>
     630:	00009400 	andeq	r9, r0, r0, lsl #8
     634:	10000c00 	andne	r0, r0, r0, lsl #24
     638:	8083dbe0 	addhi	sp, r3, r0, ror #23
     63c:	fffffffe 			; <UNDEFINED> instruction: 0xfffffffe
     640:	009f01ff 			; <UNDEFINED> instruction: 0x009f01ff
     644:	00000000 	andeq	r0, r0, r0
     648:	30000000 	andcc	r0, r0, r0
     64c:	62000000 	andvs	r0, r0, #0
     650:	0c000000 	stceq	0, cr0, [r0], {-0}
     654:	dbd01000 	blle	ff40465c <_umb_estack+0xdf3c6660>
     658:	fffe8083 			; <UNDEFINED> instruction: 0xfffe8083
     65c:	01ffffff 	ldrsheq	pc, [pc, #255]	; 763 <_umb_stack_size-0x89d>	; <UNPREDICTABLE>
     660:	0000709f 	muleq	r0, pc, r0	; <UNPREDICTABLE>
     664:	00009400 	andeq	r9, r0, r0, lsl #8
     668:	10000c00 	andne	r0, r0, r0, lsl #24
     66c:	8083dbd0 	ldrdhi	sp, [r3], r0
     670:	fffffffe 			; <UNDEFINED> instruction: 0xfffffffe
     674:	009f01ff 			; <UNDEFINED> instruction: 0x009f01ff
     678:	00000000 	andeq	r0, r0, r0
     67c:	30000000 	andcc	r0, r0, r0
     680:	62000000 	andvs	r0, r0, #0
     684:	02000000 	andeq	r0, r0, #0
     688:	709f4000 	addsvc	r4, pc, r0
     68c:	94000000 	strls	r0, [r0], #-0
     690:	02000000 	andeq	r0, r0, #0
     694:	009f4000 	addseq	r4, pc, r0
     698:	00000000 	andeq	r0, r0, r0
     69c:	30000000 	andcc	r0, r0, r0
     6a0:	62000000 	andvs	r0, r0, #0
     6a4:	0c000000 	stceq	0, cr0, [r0], {-0}
     6a8:	dbd01000 	blle	ff4046b0 <_umb_estack+0xdf3c66b4>
     6ac:	fffe8083 			; <UNDEFINED> instruction: 0xfffe8083
     6b0:	01ffffff 	ldrsheq	pc, [pc, #255]	; 7b7 <_umb_stack_size-0x849>	; <UNPREDICTABLE>
     6b4:	0000709f 	muleq	r0, pc, r0	; <UNPREDICTABLE>
     6b8:	00009400 	andeq	r9, r0, r0, lsl #8
     6bc:	10000c00 	andne	r0, r0, r0, lsl #24
     6c0:	8083dbd0 	ldrdhi	sp, [r3], r0
     6c4:	fffffffe 			; <UNDEFINED> instruction: 0xfffffffe
     6c8:	009f01ff 			; <UNDEFINED> instruction: 0x009f01ff
     6cc:	00000000 	andeq	r0, r0, r0
     6d0:	30000000 	andcc	r0, r0, r0
     6d4:	34000000 	strcc	r0, [r0], #-0
     6d8:	01000000 	mrseq	r0, (UNDEF: 0)
     6dc:	003e5300 	eorseq	r5, lr, r0, lsl #6
     6e0:	00420000 	subeq	r0, r2, r0
     6e4:	00010000 	andeq	r0, r1, r0
     6e8:	00004c53 	andeq	r4, r0, r3, asr ip
     6ec:	00005000 	andeq	r5, r0, r0
     6f0:	53000100 	movwpl	r0, #256	; 0x100
     6f4:	0000005e 	andeq	r0, r0, lr, asr r0
     6f8:	00000062 	andeq	r0, r0, r2, rrx
     6fc:	70530001 	subsvc	r0, r3, r1
     700:	74000000 	strvc	r0, [r0], #-0
     704:	01000000 	mrseq	r0, (UNDEF: 0)
     708:	00825200 	addeq	r5, r2, r0, lsl #4
     70c:	00860000 	addeq	r0, r6, r0
     710:	00010000 	andeq	r0, r1, r0
     714:	00009252 	andeq	r9, r0, r2, asr r2
     718:	00009400 	andeq	r9, r0, r0, lsl #8
     71c:	50000100 	andpl	r0, r0, r0, lsl #2
	...
     728:	00000030 	andeq	r0, r0, r0, lsr r0
     72c:	00000034 	andeq	r0, r0, r4, lsr r0
     730:	3e530001 	cdpcc	0, 5, cr0, cr3, cr1, {0}
     734:	42000000 	andmi	r0, r0, #0
     738:	01000000 	mrseq	r0, (UNDEF: 0)
     73c:	004c5300 	subeq	r5, ip, r0, lsl #6
     740:	00500000 	subseq	r0, r0, r0
     744:	00010000 	andeq	r0, r1, r0
     748:	00005e53 	andeq	r5, r0, r3, asr lr
     74c:	00006200 	andeq	r6, r0, r0, lsl #4
     750:	53000100 	movwpl	r0, #256	; 0x100
     754:	00000070 	andeq	r0, r0, r0, ror r0
     758:	00000074 	andeq	r0, r0, r4, ror r0
     75c:	82520001 	subshi	r0, r2, #1
     760:	86000000 	strhi	r0, [r0], -r0
     764:	01000000 	mrseq	r0, (UNDEF: 0)
     768:	00925200 	addseq	r5, r2, r0, lsl #4
     76c:	00940000 	addseq	r0, r4, r0
     770:	00010000 	andeq	r0, r1, r0
     774:	00000050 	andeq	r0, r0, r0, asr r0
     778:	00000000 	andeq	r0, r0, r0
     77c:	00007400 	andeq	r7, r0, r0, lsl #8
     780:	00009400 	andeq	r9, r0, r0, lsl #8
     784:	31000200 	mrscc	r0, R8_usr
     788:	0000009f 	muleq	r0, pc, r0	; <UNPREDICTABLE>
     78c:	00000000 	andeq	r0, r0, r0
     790:	00007400 	andeq	r7, r0, r0, lsl #8
     794:	00009400 	andeq	r9, r0, r0, lsl #8
     798:	31000200 	mrscc	r0, R8_usr
     79c:	0000009f 	muleq	r0, pc, r0	; <UNPREDICTABLE>
     7a0:	00000000 	andeq	r0, r0, r0
     7a4:	00009a00 	andeq	r9, r0, r0, lsl #20
     7a8:	0000be00 	andeq	fp, r0, r0, lsl #28
     7ac:	31000800 	tstcc	r0, r0, lsl #16
     7b0:	3102939f 			; <UNDEFINED> instruction: 0x3102939f
     7b4:	0002939f 	muleq	r2, pc, r3	; <UNPREDICTABLE>
     7b8:	00000000 	andeq	r0, r0, r0
     7bc:	9e000000 	cdpls	0, 0, cr0, cr0, cr0, {0}
     7c0:	a2000000 	andge	r0, r0, #0
     7c4:	01000000 	mrseq	r0, (UNDEF: 0)
     7c8:	00005000 	andeq	r5, r0, r0
     7cc:	00000000 	andeq	r0, r0, r0
     7d0:	00a60000 	adceq	r0, r6, r0
     7d4:	00be0000 	adcseq	r0, lr, r0
     7d8:	00080000 	andeq	r0, r8, r0
     7dc:	02939f31 	addseq	r9, r3, #49, 30	; 0xc4
     7e0:	02939f31 	addseq	r9, r3, #49, 30	; 0xc4
	...
     7ec:	000000aa 	andeq	r0, r0, sl, lsr #1
     7f0:	000000ae 	andeq	r0, r0, lr, lsr #1
     7f4:	00500001 	subseq	r0, r0, r1
     7f8:	00000000 	andeq	r0, r0, r0
     7fc:	b2000000 	andlt	r0, r0, #0
     800:	24000000 	strcs	r0, [r0], #-0
     804:	15000001 	strne	r0, [r0, #-1]
     808:	04801000 	streq	r1, [r0], #0
     80c:	1004939f 	mulne	r4, pc, r3	; <UNPREDICTABLE>
     810:	9f208880 	svcls	0x00208880
     814:	9f300493 	svcls	0x00300493
     818:	9f300193 	svcls	0x00300193
     81c:	01240193 			; <UNDEFINED> instruction: 0x01240193
     820:	022a0000 	eoreq	r0, sl, #0
     824:	00160000 	andseq	r0, r6, r0
     828:	9f068010 	svcls	0x00068010
     82c:	80100493 	mulshi	r0, r3, r4
     830:	9f018080 	svcls	0x00018080
     834:	9f300493 	svcls	0x00300493
     838:	9f300193 	svcls	0x00300193
     83c:	022a0193 	eoreq	r0, sl, #-1073741788	; 0xc0000024
     840:	02a60000 	adceq	r0, r6, #0
     844:	00150000 	andseq	r0, r5, r0
     848:	9f028010 	svcls	0x00028010
     84c:	80100493 	mulshi	r0, r3, r4
     850:	939f2086 	orrsls	r2, pc, #134	; 0x86
     854:	939f3004 	orrsls	r3, pc, #4
     858:	939f3201 	orrsls	r3, pc, #268435456	; 0x10000000
     85c:	00000001 	andeq	r0, r0, r1
     860:	00000000 	andeq	r0, r0, r0
     864:	0000b600 	andeq	fp, r0, r0, lsl #12
     868:	0000be00 	andeq	fp, r0, r0, lsl #28
     86c:	30000400 	andcc	r0, r0, r0, lsl #8
     870:	be01939f 	mcrlt	3, 0, r9, cr1, cr15, {4}
     874:	02000000 	andeq	r0, r0, #0
     878:	03000001 	movweq	r0, #1
     87c:	01935000 	orrseq	r5, r3, r0
	...
     888:	000000c6 	andeq	r0, r0, r6, asr #1
     88c:	000000d0 	ldrdeq	r0, [r0], -r0	; <UNPREDICTABLE>
     890:	d810000c 	ldmdale	r0, {r2, r3}
     894:	fe8083db 	mcr2	3, 4, r8, cr0, cr11, {6}
     898:	ffffffff 			; <UNDEFINED> instruction: 0xffffffff
     89c:	00d69f01 	sbcseq	r9, r6, r1, lsl #30
     8a0:	00e00000 	rsceq	r0, r0, r0
     8a4:	000c0000 	andeq	r0, ip, r0
     8a8:	83dbd810 	bicshi	sp, fp, #16, 16	; 0x100000
     8ac:	fffffe80 			; <UNDEFINED> instruction: 0xfffffe80
     8b0:	9f01ffff 	svcls	0x0001ffff
     8b4:	000000e6 	andeq	r0, r0, r6, ror #1
     8b8:	000000f0 	strdeq	r0, [r0], -r0	; <UNPREDICTABLE>
     8bc:	d810000c 	ldmdale	r0, {r2, r3}
     8c0:	fe8083db 	mcr2	3, 4, r8, cr0, cr11, {6}
     8c4:	ffffffff 			; <UNDEFINED> instruction: 0xffffffff
     8c8:	00f69f01 	rscseq	r9, r6, r1, lsl #30
     8cc:	01020000 	mrseq	r0, (UNDEF: 2)
     8d0:	000c0000 	andeq	r0, ip, r0
     8d4:	83dbd810 	bicshi	sp, fp, #16, 16	; 0x100000
     8d8:	fffffe80 			; <UNDEFINED> instruction: 0xfffffe80
     8dc:	9f01ffff 	svcls	0x0001ffff
	...
     8e8:	000000c6 	andeq	r0, r0, r6, asr #1
     8ec:	000000d0 	ldrdeq	r0, [r0], -r0	; <UNPREDICTABLE>
     8f0:	d010000c 	andsle	r0, r0, ip
     8f4:	fe8083db 	mcr2	3, 4, r8, cr0, cr11, {6}
     8f8:	ffffffff 			; <UNDEFINED> instruction: 0xffffffff
     8fc:	00d69f01 	sbcseq	r9, r6, r1, lsl #30
     900:	00e00000 	rsceq	r0, r0, r0
     904:	000c0000 	andeq	r0, ip, r0
     908:	83dbd010 	bicshi	sp, fp, #16
     90c:	fffffe80 			; <UNDEFINED> instruction: 0xfffffe80
     910:	9f01ffff 	svcls	0x0001ffff
     914:	000000e6 	andeq	r0, r0, r6, ror #1
     918:	000000f0 	strdeq	r0, [r0], -r0	; <UNPREDICTABLE>
     91c:	d010000c 	andsle	r0, r0, ip
     920:	fe8083db 	mcr2	3, 4, r8, cr0, cr11, {6}
     924:	ffffffff 			; <UNDEFINED> instruction: 0xffffffff
     928:	00f69f01 	rscseq	r9, r6, r1, lsl #30
     92c:	01020000 	mrseq	r0, (UNDEF: 2)
     930:	000c0000 	andeq	r0, ip, r0
     934:	83dbd010 	bicshi	sp, fp, #16
     938:	fffffe80 			; <UNDEFINED> instruction: 0xfffffe80
     93c:	9f01ffff 	svcls	0x0001ffff
	...
     948:	000000c6 	andeq	r0, r0, r6, asr #1
     94c:	000000d0 	ldrdeq	r0, [r0], -r0	; <UNPREDICTABLE>
     950:	01700003 	cmneq	r0, r3
     954:	0000d69f 	muleq	r0, pc, r6	; <UNPREDICTABLE>
     958:	0000e000 	andeq	lr, r0, r0
     95c:	70000300 	andvc	r0, r0, r0, lsl #6
     960:	00e69f02 	rsceq	r9, r6, r2, lsl #30
     964:	00f00000 	rscseq	r0, r0, r0
     968:	00030000 	andeq	r0, r3, r0
     96c:	f69f0370 			; <UNDEFINED> instruction: 0xf69f0370
     970:	02000000 	andeq	r0, r0, #0
     974:	03000001 	movweq	r0, #1
     978:	9f047000 	svcls	0x00047000
	...
     984:	000000c6 	andeq	r0, r0, r6, asr #1
     988:	000000d0 	ldrdeq	r0, [r0], -r0	; <UNPREDICTABLE>
     98c:	01700003 	cmneq	r0, r3
     990:	0000d69f 	muleq	r0, pc, r6	; <UNPREDICTABLE>
     994:	0000e000 	andeq	lr, r0, r0
     998:	70000300 	andvc	r0, r0, r0, lsl #6
     99c:	00e69f02 	rsceq	r9, r6, r2, lsl #30
     9a0:	00f00000 	rscseq	r0, r0, r0
     9a4:	00030000 	andeq	r0, r3, r0
     9a8:	f69f0370 			; <UNDEFINED> instruction: 0xf69f0370
     9ac:	02000000 	andeq	r0, r0, #0
     9b0:	03000001 	movweq	r0, #1
     9b4:	9f047000 	svcls	0x00047000
	...
     9c0:	000000c6 	andeq	r0, r0, r6, asr #1
     9c4:	000000d0 	ldrdeq	r0, [r0], -r0	; <UNPREDICTABLE>
     9c8:	9f380002 	svcls	0x00380002
     9cc:	000000d6 	ldrdeq	r0, [r0], -r6
     9d0:	000000e0 	andeq	r0, r0, r0, ror #1
     9d4:	9f380002 	svcls	0x00380002
     9d8:	000000e6 	andeq	r0, r0, r6, ror #1
     9dc:	000000f0 	strdeq	r0, [r0], -r0	; <UNPREDICTABLE>
     9e0:	9f380002 	svcls	0x00380002
     9e4:	000000f6 	strdeq	r0, [r0], -r6
     9e8:	00000102 	andeq	r0, r0, r2, lsl #2
     9ec:	9f380002 	svcls	0x00380002
	...
     9f8:	000000c6 	andeq	r0, r0, r6, asr #1
     9fc:	000000d0 	ldrdeq	r0, [r0], -r0	; <UNPREDICTABLE>
     a00:	d010000c 	andsle	r0, r0, ip
     a04:	fe8083db 	mcr2	3, 4, r8, cr0, cr11, {6}
     a08:	ffffffff 			; <UNDEFINED> instruction: 0xffffffff
     a0c:	00d69f01 	sbcseq	r9, r6, r1, lsl #30
     a10:	00e00000 	rsceq	r0, r0, r0
     a14:	000c0000 	andeq	r0, ip, r0
     a18:	83dbd010 	bicshi	sp, fp, #16
     a1c:	fffffe80 			; <UNDEFINED> instruction: 0xfffffe80
     a20:	9f01ffff 	svcls	0x0001ffff
     a24:	000000e6 	andeq	r0, r0, r6, ror #1
     a28:	000000f0 	strdeq	r0, [r0], -r0	; <UNPREDICTABLE>
     a2c:	d010000c 	andsle	r0, r0, ip
     a30:	fe8083db 	mcr2	3, 4, r8, cr0, cr11, {6}
     a34:	ffffffff 			; <UNDEFINED> instruction: 0xffffffff
     a38:	00f69f01 	rscseq	r9, r6, r1, lsl #30
     a3c:	01020000 	mrseq	r0, (UNDEF: 2)
     a40:	000c0000 	andeq	r0, ip, r0
     a44:	83dbd010 	bicshi	sp, fp, #16
     a48:	fffffe80 			; <UNDEFINED> instruction: 0xfffffe80
     a4c:	9f01ffff 	svcls	0x0001ffff
	...
     a58:	000000c6 	andeq	r0, r0, r6, asr #1
     a5c:	000000d0 	ldrdeq	r0, [r0], -r0	; <UNPREDICTABLE>
     a60:	01700003 	cmneq	r0, r3
     a64:	0000d69f 	muleq	r0, pc, r6	; <UNPREDICTABLE>
     a68:	0000e000 	andeq	lr, r0, r0
     a6c:	70000300 	andvc	r0, r0, r0, lsl #6
     a70:	00e69f02 	rsceq	r9, r6, r2, lsl #30
     a74:	00f00000 	rscseq	r0, r0, r0
     a78:	00030000 	andeq	r0, r3, r0
     a7c:	f69f0370 			; <UNDEFINED> instruction: 0xf69f0370
     a80:	02000000 	andeq	r0, r0, #0
     a84:	03000001 	movweq	r0, #1
     a88:	9f047000 	svcls	0x00047000
	...
     a94:	000000ca 	andeq	r0, r0, sl, asr #1
     a98:	000000d0 	ldrdeq	r0, [r0], -r0	; <UNPREDICTABLE>
     a9c:	e010000c 	ands	r0, r0, ip
     aa0:	fe8083db 	mcr2	3, 4, r8, cr0, cr11, {6}
     aa4:	ffffffff 			; <UNDEFINED> instruction: 0xffffffff
     aa8:	00da9f01 	sbcseq	r9, sl, r1, lsl #30
     aac:	00e00000 	rsceq	r0, r0, r0
     ab0:	000c0000 	andeq	r0, ip, r0
     ab4:	83dbe010 	bicshi	lr, fp, #16
     ab8:	fffffe80 			; <UNDEFINED> instruction: 0xfffffe80
     abc:	9f01ffff 	svcls	0x0001ffff
     ac0:	000000ea 	andeq	r0, r0, sl, ror #1
     ac4:	000000f0 	strdeq	r0, [r0], -r0	; <UNPREDICTABLE>
     ac8:	e010000c 	ands	r0, r0, ip
     acc:	fe8083db 	mcr2	3, 4, r8, cr0, cr11, {6}
     ad0:	ffffffff 			; <UNDEFINED> instruction: 0xffffffff
     ad4:	00fa9f01 	rscseq	r9, sl, r1, lsl #30
     ad8:	01020000 	mrseq	r0, (UNDEF: 2)
     adc:	000c0000 	andeq	r0, ip, r0
     ae0:	83dbe010 	bicshi	lr, fp, #16
     ae4:	fffffe80 			; <UNDEFINED> instruction: 0xfffffe80
     ae8:	9f01ffff 	svcls	0x0001ffff
	...
     af4:	000000ca 	andeq	r0, r0, sl, asr #1
     af8:	000000d0 	ldrdeq	r0, [r0], -r0	; <UNPREDICTABLE>
     afc:	d010000c 	andsle	r0, r0, ip
     b00:	fe8083db 	mcr2	3, 4, r8, cr0, cr11, {6}
     b04:	ffffffff 			; <UNDEFINED> instruction: 0xffffffff
     b08:	00da9f01 	sbcseq	r9, sl, r1, lsl #30
     b0c:	00e00000 	rsceq	r0, r0, r0
     b10:	000c0000 	andeq	r0, ip, r0
     b14:	83dbd010 	bicshi	sp, fp, #16
     b18:	fffffe80 			; <UNDEFINED> instruction: 0xfffffe80
     b1c:	9f01ffff 	svcls	0x0001ffff
     b20:	000000ea 	andeq	r0, r0, sl, ror #1
     b24:	000000f0 	strdeq	r0, [r0], -r0	; <UNPREDICTABLE>
     b28:	d010000c 	andsle	r0, r0, ip
     b2c:	fe8083db 	mcr2	3, 4, r8, cr0, cr11, {6}
     b30:	ffffffff 			; <UNDEFINED> instruction: 0xffffffff
     b34:	00fa9f01 	rscseq	r9, sl, r1, lsl #30
     b38:	01020000 	mrseq	r0, (UNDEF: 2)
     b3c:	000c0000 	andeq	r0, ip, r0
     b40:	83dbd010 	bicshi	sp, fp, #16
     b44:	fffffe80 			; <UNDEFINED> instruction: 0xfffffe80
     b48:	9f01ffff 	svcls	0x0001ffff
	...
     b54:	000000ca 	andeq	r0, r0, sl, asr #1
     b58:	000000d0 	ldrdeq	r0, [r0], -r0	; <UNPREDICTABLE>
     b5c:	9f400002 	svcls	0x00400002
     b60:	000000da 	ldrdeq	r0, [r0], -sl
     b64:	000000e0 	andeq	r0, r0, r0, ror #1
     b68:	9f400002 	svcls	0x00400002
     b6c:	000000ea 	andeq	r0, r0, sl, ror #1
     b70:	000000f0 	strdeq	r0, [r0], -r0	; <UNPREDICTABLE>
     b74:	9f400002 	svcls	0x00400002
     b78:	000000fa 	strdeq	r0, [r0], -sl
     b7c:	00000102 	andeq	r0, r0, r2, lsl #2
     b80:	9f400002 	svcls	0x00400002
	...
     b8c:	000000ca 	andeq	r0, r0, sl, asr #1
     b90:	000000d0 	ldrdeq	r0, [r0], -r0	; <UNPREDICTABLE>
     b94:	d010000c 	andsle	r0, r0, ip
     b98:	fe8083db 	mcr2	3, 4, r8, cr0, cr11, {6}
     b9c:	ffffffff 			; <UNDEFINED> instruction: 0xffffffff
     ba0:	00da9f01 	sbcseq	r9, sl, r1, lsl #30
     ba4:	00e00000 	rsceq	r0, r0, r0
     ba8:	000c0000 	andeq	r0, ip, r0
     bac:	83dbd010 	bicshi	sp, fp, #16
     bb0:	fffffe80 			; <UNDEFINED> instruction: 0xfffffe80
     bb4:	9f01ffff 	svcls	0x0001ffff
     bb8:	000000ea 	andeq	r0, r0, sl, ror #1
     bbc:	000000f0 	strdeq	r0, [r0], -r0	; <UNPREDICTABLE>
     bc0:	d010000c 	andsle	r0, r0, ip
     bc4:	fe8083db 	mcr2	3, 4, r8, cr0, cr11, {6}
     bc8:	ffffffff 			; <UNDEFINED> instruction: 0xffffffff
     bcc:	00fa9f01 	rscseq	r9, sl, r1, lsl #30
     bd0:	01020000 	mrseq	r0, (UNDEF: 2)
     bd4:	000c0000 	andeq	r0, ip, r0
     bd8:	83dbd010 	bicshi	sp, fp, #16
     bdc:	fffffe80 			; <UNDEFINED> instruction: 0xfffffe80
     be0:	9f01ffff 	svcls	0x0001ffff
	...
     bec:	0000010a 	andeq	r0, r0, sl, lsl #2
     bf0:	00000110 	andeq	r0, r0, r0, lsl r1
     bf4:	00500001 	subseq	r0, r0, r1
     bf8:	00000000 	andeq	r0, r0, r0
     bfc:	0a000000 	beq	c04 <_umb_stack_size-0x3fc>
     c00:	10000001 	andne	r0, r0, r1
     c04:	1b000001 	blne	c10 <_umb_stack_size-0x3f0>
     c08:	80801000 	addhi	r1, r0, r0
     c0c:	939f4090 	orrsls	r4, pc, #144	; 0x90
     c10:	80801004 	addhi	r1, r0, r4
     c14:	939f4098 	orrsls	r4, pc, #152	; 0x98
     c18:	939f3004 	orrsls	r3, pc, #4
     c1c:	939f3101 	orrsls	r3, pc, #1073741824	; 0x40000000
     c20:	01935001 	orrseq	r5, r3, r1
     c24:	00000110 	andeq	r0, r0, r0, lsl r1
     c28:	00000130 	andeq	r0, r0, r0, lsr r1
     c2c:	80100018 	andshi	r0, r0, r8, lsl r0
     c30:	9f409080 	svcls	0x00409080
     c34:	80100493 	mulshi	r0, r3, r4
     c38:	9f409880 	svcls	0x00409880
     c3c:	9f300493 	svcls	0x00300493
     c40:	9f310193 	svcls	0x00310193
     c44:	00000193 	muleq	r0, r3, r1
     c48:	00000000 	andeq	r0, r0, r0
     c4c:	010a0000 	mrseq	r0, (UNDEF: 10)
     c50:	01300000 	teqeq	r0, r0
     c54:	000c0000 	andeq	r0, ip, r0
     c58:	83dbd010 	bicshi	sp, fp, #16
     c5c:	fffffe80 			; <UNDEFINED> instruction: 0xfffffe80
     c60:	9f01ffff 	svcls	0x0001ffff
	...
     c6c:	0000010a 	andeq	r0, r0, sl, lsl #2
     c70:	00000130 	andeq	r0, r0, r0, lsr r1
     c74:	81100006 	tsthi	r0, r6
     c78:	9f409880 	svcls	0x00409880
	...
     c84:	0000010a 	andeq	r0, r0, sl, lsl #2
     c88:	00000110 	andeq	r0, r0, r0, lsl r1
     c8c:	00500001 	subseq	r0, r0, r1
     c90:	00000000 	andeq	r0, r0, r0
     c94:	0a000000 	beq	c9c <_umb_stack_size-0x364>
     c98:	10000001 	andne	r0, r0, r1
     c9c:	01000001 	tsteq	r0, r1
     ca0:	00005000 	andeq	r5, r0, r0
     ca4:	00000000 	andeq	r0, r0, r0
     ca8:	01280000 			; <UNDEFINED> instruction: 0x01280000
     cac:	01300000 	teqeq	r0, r0
     cb0:	00040000 	andeq	r0, r4, r0
     cb4:	01939f30 	orrseq	r9, r3, r0, lsr pc
     cb8:	00000130 	andeq	r0, r0, r0, lsr r1
     cbc:	00000174 	andeq	r0, r0, r4, ror r1
     cc0:	93500003 	cmpls	r0, #3
     cc4:	00000001 	andeq	r0, r0, r1
     cc8:	00000000 	andeq	r0, r0, r0
     ccc:	00013800 	andeq	r3, r1, r0, lsl #16
     cd0:	00014200 	andeq	r4, r1, r0, lsl #4
     cd4:	10000c00 	andne	r0, r0, r0, lsl #24
     cd8:	8083dbd8 	ldrdhi	sp, [r3], r8
     cdc:	fffffffe 			; <UNDEFINED> instruction: 0xfffffffe
     ce0:	489f01ff 	ldmmi	pc, {r0, r1, r2, r3, r4, r5, r6, r7, r8}	; <UNPREDICTABLE>
     ce4:	52000001 	andpl	r0, r0, #1
     ce8:	0c000001 	stceq	0, cr0, [r0], {1}
     cec:	dbd81000 	blle	ff604cf4 <_umb_estack+0xdf5c6cf8>
     cf0:	fffe8083 			; <UNDEFINED> instruction: 0xfffe8083
     cf4:	01ffffff 	ldrsheq	pc, [pc, #255]	; dfb <_umb_stack_size-0x205>	; <UNPREDICTABLE>
     cf8:	0001589f 	muleq	r1, pc, r8	; <UNPREDICTABLE>
     cfc:	00016200 	andeq	r6, r1, r0, lsl #4
     d00:	10000c00 	andne	r0, r0, r0, lsl #24
     d04:	8083dbd8 	ldrdhi	sp, [r3], r8
     d08:	fffffffe 			; <UNDEFINED> instruction: 0xfffffffe
     d0c:	689f01ff 	ldmvs	pc, {r0, r1, r2, r3, r4, r5, r6, r7, r8}	; <UNPREDICTABLE>
     d10:	74000001 	strvc	r0, [r0], #-1
     d14:	0c000001 	stceq	0, cr0, [r0], {1}
     d18:	dbd81000 	blle	ff604d20 <_umb_estack+0xdf5c6d24>
     d1c:	fffe8083 			; <UNDEFINED> instruction: 0xfffe8083
     d20:	01ffffff 	ldrsheq	pc, [pc, #255]	; e27 <_umb_stack_size-0x1d9>	; <UNPREDICTABLE>
     d24:	0000009f 	muleq	r0, pc, r0	; <UNPREDICTABLE>
     d28:	00000000 	andeq	r0, r0, r0
     d2c:	00013800 	andeq	r3, r1, r0, lsl #16
     d30:	00014200 	andeq	r4, r1, r0, lsl #4
     d34:	10000c00 	andne	r0, r0, r0, lsl #24
     d38:	8083dbd0 	ldrdhi	sp, [r3], r0
     d3c:	fffffffe 			; <UNDEFINED> instruction: 0xfffffffe
     d40:	489f01ff 	ldmmi	pc, {r0, r1, r2, r3, r4, r5, r6, r7, r8}	; <UNPREDICTABLE>
     d44:	52000001 	andpl	r0, r0, #1
     d48:	0c000001 	stceq	0, cr0, [r0], {1}
     d4c:	dbd01000 	blle	ff404d54 <_umb_estack+0xdf3c6d58>
     d50:	fffe8083 			; <UNDEFINED> instruction: 0xfffe8083
     d54:	01ffffff 	ldrsheq	pc, [pc, #255]	; e5b <_umb_stack_size-0x1a5>	; <UNPREDICTABLE>
     d58:	0001589f 	muleq	r1, pc, r8	; <UNPREDICTABLE>
     d5c:	00016200 	andeq	r6, r1, r0, lsl #4
     d60:	10000c00 	andne	r0, r0, r0, lsl #24
     d64:	8083dbd0 	ldrdhi	sp, [r3], r0
     d68:	fffffffe 			; <UNDEFINED> instruction: 0xfffffffe
     d6c:	689f01ff 	ldmvs	pc, {r0, r1, r2, r3, r4, r5, r6, r7, r8}	; <UNPREDICTABLE>
     d70:	74000001 	strvc	r0, [r0], #-1
     d74:	0c000001 	stceq	0, cr0, [r0], {1}
     d78:	dbd01000 	blle	ff404d80 <_umb_estack+0xdf3c6d84>
     d7c:	fffe8083 			; <UNDEFINED> instruction: 0xfffe8083
     d80:	01ffffff 	ldrsheq	pc, [pc, #255]	; e87 <_umb_stack_size-0x179>	; <UNPREDICTABLE>
     d84:	0000009f 	muleq	r0, pc, r0	; <UNPREDICTABLE>
     d88:	00000000 	andeq	r0, r0, r0
     d8c:	00013800 	andeq	r3, r1, r0, lsl #16
     d90:	00014200 	andeq	r4, r1, r0, lsl #4
     d94:	70000300 	andvc	r0, r0, r0, lsl #6
     d98:	01489f01 	cmpeq	r8, r1, lsl #30
     d9c:	01520000 	cmpeq	r2, r0
     da0:	00030000 	andeq	r0, r3, r0
     da4:	589f0270 	ldmpl	pc, {r4, r5, r6, r9}	; <UNPREDICTABLE>
     da8:	62000001 	andvs	r0, r0, #1
     dac:	03000001 	movweq	r0, #1
     db0:	9f037000 	svcls	0x00037000
     db4:	00000168 	andeq	r0, r0, r8, ror #2
     db8:	00000174 	andeq	r0, r0, r4, ror r1
     dbc:	04700003 	ldrbteq	r0, [r0], #-3
     dc0:	0000009f 	muleq	r0, pc, r0	; <UNPREDICTABLE>
     dc4:	00000000 	andeq	r0, r0, r0
     dc8:	00013800 	andeq	r3, r1, r0, lsl #16
     dcc:	00014200 	andeq	r4, r1, r0, lsl #4
     dd0:	70000300 	andvc	r0, r0, r0, lsl #6
     dd4:	01489f01 	cmpeq	r8, r1, lsl #30
     dd8:	01520000 	cmpeq	r2, r0
     ddc:	00030000 	andeq	r0, r3, r0
     de0:	589f0270 	ldmpl	pc, {r4, r5, r6, r9}	; <UNPREDICTABLE>
     de4:	62000001 	andvs	r0, r0, #1
     de8:	03000001 	movweq	r0, #1
     dec:	9f037000 	svcls	0x00037000
     df0:	00000168 	andeq	r0, r0, r8, ror #2
     df4:	00000174 	andeq	r0, r0, r4, ror r1
     df8:	04700003 	ldrbteq	r0, [r0], #-3
     dfc:	0000009f 	muleq	r0, pc, r0	; <UNPREDICTABLE>
     e00:	00000000 	andeq	r0, r0, r0
     e04:	00013800 	andeq	r3, r1, r0, lsl #16
     e08:	00014200 	andeq	r4, r1, r0, lsl #4
     e0c:	38000200 	stmdacc	r0, {r9}
     e10:	0001489f 	muleq	r1, pc, r8	; <UNPREDICTABLE>
     e14:	00015200 	andeq	r5, r1, r0, lsl #4
     e18:	38000200 	stmdacc	r0, {r9}
     e1c:	0001589f 	muleq	r1, pc, r8	; <UNPREDICTABLE>
     e20:	00016200 	andeq	r6, r1, r0, lsl #4
     e24:	38000200 	stmdacc	r0, {r9}
     e28:	0001689f 	muleq	r1, pc, r8	; <UNPREDICTABLE>
     e2c:	00017400 	andeq	r7, r1, r0, lsl #8
     e30:	38000200 	stmdacc	r0, {r9}
     e34:	0000009f 	muleq	r0, pc, r0	; <UNPREDICTABLE>
     e38:	00000000 	andeq	r0, r0, r0
     e3c:	00013800 	andeq	r3, r1, r0, lsl #16
     e40:	00014200 	andeq	r4, r1, r0, lsl #4
     e44:	10000c00 	andne	r0, r0, r0, lsl #24
     e48:	8083dbd0 	ldrdhi	sp, [r3], r0
     e4c:	fffffffe 			; <UNDEFINED> instruction: 0xfffffffe
     e50:	489f01ff 	ldmmi	pc, {r0, r1, r2, r3, r4, r5, r6, r7, r8}	; <UNPREDICTABLE>
     e54:	52000001 	andpl	r0, r0, #1
     e58:	0c000001 	stceq	0, cr0, [r0], {1}
     e5c:	dbd01000 	blle	ff404e64 <_umb_estack+0xdf3c6e68>
     e60:	fffe8083 			; <UNDEFINED> instruction: 0xfffe8083
     e64:	01ffffff 	ldrsheq	pc, [pc, #255]	; f6b <_umb_stack_size-0x95>	; <UNPREDICTABLE>
     e68:	0001589f 	muleq	r1, pc, r8	; <UNPREDICTABLE>
     e6c:	00016200 	andeq	r6, r1, r0, lsl #4
     e70:	10000c00 	andne	r0, r0, r0, lsl #24
     e74:	8083dbd0 	ldrdhi	sp, [r3], r0
     e78:	fffffffe 			; <UNDEFINED> instruction: 0xfffffffe
     e7c:	689f01ff 	ldmvs	pc, {r0, r1, r2, r3, r4, r5, r6, r7, r8}	; <UNPREDICTABLE>
     e80:	74000001 	strvc	r0, [r0], #-1
     e84:	0c000001 	stceq	0, cr0, [r0], {1}
     e88:	dbd01000 	blle	ff404e90 <_umb_estack+0xdf3c6e94>
     e8c:	fffe8083 			; <UNDEFINED> instruction: 0xfffe8083
     e90:	01ffffff 	ldrsheq	pc, [pc, #255]	; f97 <_umb_stack_size-0x69>	; <UNPREDICTABLE>
     e94:	0000009f 	muleq	r0, pc, r0	; <UNPREDICTABLE>
     e98:	00000000 	andeq	r0, r0, r0
     e9c:	00013800 	andeq	r3, r1, r0, lsl #16
     ea0:	00014200 	andeq	r4, r1, r0, lsl #4
     ea4:	70000300 	andvc	r0, r0, r0, lsl #6
     ea8:	01489f01 	cmpeq	r8, r1, lsl #30
     eac:	01520000 	cmpeq	r2, r0
     eb0:	00030000 	andeq	r0, r3, r0
     eb4:	589f0270 	ldmpl	pc, {r4, r5, r6, r9}	; <UNPREDICTABLE>
     eb8:	62000001 	andvs	r0, r0, #1
     ebc:	03000001 	movweq	r0, #1
     ec0:	9f037000 	svcls	0x00037000
     ec4:	00000168 	andeq	r0, r0, r8, ror #2
     ec8:	00000174 	andeq	r0, r0, r4, ror r1
     ecc:	04700003 	ldrbteq	r0, [r0], #-3
     ed0:	0000009f 	muleq	r0, pc, r0	; <UNPREDICTABLE>
     ed4:	00000000 	andeq	r0, r0, r0
     ed8:	00013c00 	andeq	r3, r1, r0, lsl #24
     edc:	00014200 	andeq	r4, r1, r0, lsl #4
     ee0:	10000c00 	andne	r0, r0, r0, lsl #24
     ee4:	8083dbe0 	addhi	sp, r3, r0, ror #23
     ee8:	fffffffe 			; <UNDEFINED> instruction: 0xfffffffe
     eec:	4c9f01ff 	ldfmis	f0, [pc], {255}	; 0xff
     ef0:	52000001 	andpl	r0, r0, #1
     ef4:	0c000001 	stceq	0, cr0, [r0], {1}
     ef8:	dbe01000 	blle	ff804f00 <_umb_estack+0xdf7c6f04>
     efc:	fffe8083 			; <UNDEFINED> instruction: 0xfffe8083
     f00:	01ffffff 	ldrsheq	pc, [pc, #255]	; 1007 <_umb_stack_size+0x7>	; <UNPREDICTABLE>
     f04:	00015c9f 	muleq	r1, pc, ip	; <UNPREDICTABLE>
     f08:	00016200 	andeq	r6, r1, r0, lsl #4
     f0c:	10000c00 	andne	r0, r0, r0, lsl #24
     f10:	8083dbe0 	addhi	sp, r3, r0, ror #23
     f14:	fffffffe 			; <UNDEFINED> instruction: 0xfffffffe
     f18:	6c9f01ff 	ldfvss	f0, [pc], {255}	; 0xff
     f1c:	74000001 	strvc	r0, [r0], #-1
     f20:	0c000001 	stceq	0, cr0, [r0], {1}
     f24:	dbe01000 	blle	ff804f2c <_umb_estack+0xdf7c6f30>
     f28:	fffe8083 			; <UNDEFINED> instruction: 0xfffe8083
     f2c:	01ffffff 	ldrsheq	pc, [pc, #255]	; 1033 <_umb_stack_size+0x33>	; <UNPREDICTABLE>
     f30:	0000009f 	muleq	r0, pc, r0	; <UNPREDICTABLE>
     f34:	00000000 	andeq	r0, r0, r0
     f38:	00013c00 	andeq	r3, r1, r0, lsl #24
     f3c:	00014200 	andeq	r4, r1, r0, lsl #4
     f40:	10000c00 	andne	r0, r0, r0, lsl #24
     f44:	8083dbd0 	ldrdhi	sp, [r3], r0
     f48:	fffffffe 			; <UNDEFINED> instruction: 0xfffffffe
     f4c:	4c9f01ff 	ldfmis	f0, [pc], {255}	; 0xff
     f50:	52000001 	andpl	r0, r0, #1
     f54:	0c000001 	stceq	0, cr0, [r0], {1}
     f58:	dbd01000 	blle	ff404f60 <_umb_estack+0xdf3c6f64>
     f5c:	fffe8083 			; <UNDEFINED> instruction: 0xfffe8083
     f60:	01ffffff 	ldrsheq	pc, [pc, #255]	; 1067 <_umb_stack_size+0x67>	; <UNPREDICTABLE>
     f64:	00015c9f 	muleq	r1, pc, ip	; <UNPREDICTABLE>
     f68:	00016200 	andeq	r6, r1, r0, lsl #4
     f6c:	10000c00 	andne	r0, r0, r0, lsl #24
     f70:	8083dbd0 	ldrdhi	sp, [r3], r0
     f74:	fffffffe 			; <UNDEFINED> instruction: 0xfffffffe
     f78:	6c9f01ff 	ldfvss	f0, [pc], {255}	; 0xff
     f7c:	74000001 	strvc	r0, [r0], #-1
     f80:	0c000001 	stceq	0, cr0, [r0], {1}
     f84:	dbd01000 	blle	ff404f8c <_umb_estack+0xdf3c6f90>
     f88:	fffe8083 			; <UNDEFINED> instruction: 0xfffe8083
     f8c:	01ffffff 	ldrsheq	pc, [pc, #255]	; 1093 <_umb_stack_size+0x93>	; <UNPREDICTABLE>
     f90:	0000009f 	muleq	r0, pc, r0	; <UNPREDICTABLE>
     f94:	00000000 	andeq	r0, r0, r0
     f98:	00013c00 	andeq	r3, r1, r0, lsl #24
     f9c:	00014200 	andeq	r4, r1, r0, lsl #4
     fa0:	40000200 	andmi	r0, r0, r0, lsl #4
     fa4:	00014c9f 	muleq	r1, pc, ip	; <UNPREDICTABLE>
     fa8:	00015200 	andeq	r5, r1, r0, lsl #4
     fac:	40000200 	andmi	r0, r0, r0, lsl #4
     fb0:	00015c9f 	muleq	r1, pc, ip	; <UNPREDICTABLE>
     fb4:	00016200 	andeq	r6, r1, r0, lsl #4
     fb8:	40000200 	andmi	r0, r0, r0, lsl #4
     fbc:	00016c9f 	muleq	r1, pc, ip	; <UNPREDICTABLE>
     fc0:	00017400 	andeq	r7, r1, r0, lsl #8
     fc4:	40000200 	andmi	r0, r0, r0, lsl #4
     fc8:	0000009f 	muleq	r0, pc, r0	; <UNPREDICTABLE>
     fcc:	00000000 	andeq	r0, r0, r0
     fd0:	00013c00 	andeq	r3, r1, r0, lsl #24
     fd4:	00014200 	andeq	r4, r1, r0, lsl #4
     fd8:	10000c00 	andne	r0, r0, r0, lsl #24
     fdc:	8083dbd0 	ldrdhi	sp, [r3], r0
     fe0:	fffffffe 			; <UNDEFINED> instruction: 0xfffffffe
     fe4:	4c9f01ff 	ldfmis	f0, [pc], {255}	; 0xff
     fe8:	52000001 	andpl	r0, r0, #1
     fec:	0c000001 	stceq	0, cr0, [r0], {1}
     ff0:	dbd01000 	blle	ff404ff8 <_umb_estack+0xdf3c6ffc>
     ff4:	fffe8083 			; <UNDEFINED> instruction: 0xfffe8083
     ff8:	01ffffff 	ldrsheq	pc, [pc, #255]	; 10ff <_umb_stack_size+0xff>	; <UNPREDICTABLE>
     ffc:	00015c9f 	muleq	r1, pc, ip	; <UNPREDICTABLE>
    1000:	00016200 	andeq	r6, r1, r0, lsl #4
    1004:	10000c00 	andne	r0, r0, r0, lsl #24
    1008:	8083dbd0 	ldrdhi	sp, [r3], r0
    100c:	fffffffe 			; <UNDEFINED> instruction: 0xfffffffe
    1010:	6c9f01ff 	ldfvss	f0, [pc], {255}	; 0xff
    1014:	74000001 	strvc	r0, [r0], #-1
    1018:	0c000001 	stceq	0, cr0, [r0], {1}
    101c:	dbd01000 	blle	ff405024 <_umb_estack+0xdf3c7028>
    1020:	fffe8083 			; <UNDEFINED> instruction: 0xfffe8083
    1024:	01ffffff 	ldrsheq	pc, [pc, #255]	; 112b <_umb_stack_size+0x12b>	; <UNPREDICTABLE>
    1028:	0000009f 	muleq	r0, pc, r0	; <UNPREDICTABLE>
    102c:	00000000 	andeq	r0, r0, r0
    1030:	00017c00 	andeq	r7, r1, r0, lsl #24
    1034:	00018200 	andeq	r8, r1, r0, lsl #4
    1038:	50000100 	andpl	r0, r0, r0, lsl #2
	...
    1044:	0000017c 	andeq	r0, r0, ip, ror r1
    1048:	00000182 	andeq	r0, r0, r2, lsl #3
    104c:	8010001d 	andshi	r0, r0, sp, lsl r0
    1050:	02808080 	addeq	r8, r0, #128	; 0x80
    1054:	1004939f 	mulne	r4, pc, r3	; <UNPREDICTABLE>
    1058:	808c8080 	addhi	r8, ip, r0, lsl #1
    105c:	04939f02 	ldreq	r9, [r3], #3842	; 0xf02
    1060:	01939f30 	orrseq	r9, r3, r0, lsr pc
    1064:	01939f31 	orrseq	r9, r3, r1, lsr pc
    1068:	82019350 	andhi	r9, r1, #80, 6	; 0x40000001
    106c:	ac000001 	stcge	0, cr0, [r0], {1}
    1070:	1a000001 	bne	107c <_umb_stack_size+0x7c>
    1074:	80801000 	addhi	r1, r0, r0
    1078:	9f028080 	svcls	0x00028080
    107c:	80100493 	mulshi	r0, r3, r4
    1080:	02808c80 	addeq	r8, r0, #128, 24	; 0x8000
    1084:	3004939f 	mulcc	r4, pc, r3	; <UNPREDICTABLE>
    1088:	3101939f 			; <UNDEFINED> instruction: 0x3101939f
    108c:	0001939f 	muleq	r1, pc, r3	; <UNPREDICTABLE>
    1090:	00000000 	andeq	r0, r0, r0
    1094:	7c000000 	stcvc	0, cr0, [r0], {-0}
    1098:	ac000001 	stcge	0, cr0, [r0], {1}
    109c:	0c000001 	stceq	0, cr0, [r0], {1}
    10a0:	dbd01000 	blle	ff4050a8 <_umb_estack+0xdf3c70ac>
    10a4:	fffe8083 			; <UNDEFINED> instruction: 0xfffe8083
    10a8:	01ffffff 	ldrsheq	pc, [pc, #255]	; 11af <_umb_stack_size+0x1af>	; <UNPREDICTABLE>
    10ac:	0000009f 	muleq	r0, pc, r0	; <UNPREDICTABLE>
    10b0:	00000000 	andeq	r0, r0, r0
    10b4:	00017c00 	andeq	r7, r1, r0, lsl #24
    10b8:	0001ac00 	andeq	sl, r1, r0, lsl #24
    10bc:	10000700 	andne	r0, r0, r0, lsl #14
    10c0:	808c8081 	addhi	r8, ip, r1, lsl #1
    10c4:	00009f02 	andeq	r9, r0, r2, lsl #30
    10c8:	00000000 	andeq	r0, r0, r0
    10cc:	017c0000 	cmneq	ip, r0
    10d0:	01820000 	orreq	r0, r2, r0
    10d4:	00010000 	andeq	r0, r1, r0
    10d8:	00000050 	andeq	r0, r0, r0, asr r0
    10dc:	00000000 	andeq	r0, r0, r0
    10e0:	00017c00 	andeq	r7, r1, r0, lsl #24
    10e4:	00018200 	andeq	r8, r1, r0, lsl #4
    10e8:	50000100 	andpl	r0, r0, r0, lsl #2
	...
    10f4:	000001ac 	andeq	r0, r0, ip, lsr #3
    10f8:	000001b0 			; <UNDEFINED> instruction: 0x000001b0
    10fc:	04930008 	ldreq	r0, [r3], #8
    1100:	9f068010 	svcls	0x00068010
    1104:	01b00493 	lslseq	r0, r3	; <illegal shifter operand>
    1108:	01ba0000 			; <UNDEFINED> instruction: 0x01ba0000
    110c:	00090000 	andeq	r0, r9, r0
    1110:	10049358 	andne	r9, r4, r8, asr r3
    1114:	939f0680 	orrsls	r0, pc, #128, 12	; 0x8000000
    1118:	0001ba04 	andeq	fp, r1, r4, lsl #20
    111c:	00022a00 	andeq	r2, r2, r0, lsl #20
    1120:	93000800 	movwls	r0, #2048	; 0x800
    1124:	06801004 	streq	r1, [r0], r4
    1128:	0004939f 	muleq	r4, pc, r3	; <UNPREDICTABLE>
    112c:	00000000 	andeq	r0, r0, r0
    1130:	ba000000 	blt	1138 <_umb_stack_size+0x138>
    1134:	2a000001 	bcs	1140 <_umb_stack_size+0x140>
    1138:	01000002 	tsteq	r0, r2
    113c:	00005800 	andeq	r5, r0, r0, lsl #16
    1140:	00000000 	andeq	r0, r0, r0
    1144:	01de0000 	bicseq	r0, lr, r0
    1148:	022a0000 	eoreq	r0, sl, #0
    114c:	00010000 	andeq	r0, r1, r0
    1150:	00000053 	andeq	r0, r0, r3, asr r0
    1154:	00000000 	andeq	r0, r0, r0
    1158:	0001e600 	andeq	lr, r1, r0, lsl #12
    115c:	0001f800 	andeq	pc, r1, r0, lsl #16
    1160:	76000b00 	strvc	r0, [r0], -r0, lsl #22
    1164:	9f213100 	svcls	0x00213100
    1168:	9f4f0293 	svcls	0x004f0293
    116c:	01f80293 			; <UNDEFINED> instruction: 0x01f80293
    1170:	02060000 	andeq	r0, r6, #0
    1174:	000b0000 	andeq	r0, fp, r0
    1178:	21320076 	teqcs	r2, r6, ror r0
    117c:	4f02939f 	svcmi	0x0002939f
    1180:	0602939f 			; <UNDEFINED> instruction: 0x0602939f
    1184:	28000002 	stmdacs	r0, {r1}
    1188:	0b000002 	bleq	1198 <_umb_stack_size+0x198>
    118c:	33007600 	movwcc	r7, #1536	; 0x600
    1190:	02939f21 	addseq	r9, r3, #33, 30	; 0x84
    1194:	02939f4f 	addseq	r9, r3, #316	; 0x13c
    1198:	00000228 	andeq	r0, r0, r8, lsr #4
    119c:	0000022a 	andeq	r0, r0, sl, lsr #4
    11a0:	93560007 	cmpls	r6, #7
    11a4:	939f4f02 	orrsls	r4, pc, #2, 30
    11a8:	00000002 	andeq	r0, r0, r2
    11ac:	00000000 	andeq	r0, r0, r0
    11b0:	0001e600 	andeq	lr, r1, r0, lsl #12
    11b4:	0001f800 	andeq	pc, r1, r0, lsl #16
    11b8:	56000100 	strpl	r0, [r0], -r0, lsl #2
    11bc:	000001f8 	strdeq	r0, [r0], -r8
    11c0:	00000206 	andeq	r0, r0, r6, lsl #4
    11c4:	00760005 	rsbseq	r0, r6, r5
    11c8:	069f2131 			; <UNDEFINED> instruction: 0x069f2131
    11cc:	18000002 	stmdane	r0, {r1}
    11d0:	05000002 	streq	r0, [r0, #-2]
    11d4:	32007600 	andcc	r7, r0, #0, 12
    11d8:	02189f21 	andseq	r9, r8, #33, 30	; 0x84
    11dc:	02280000 	eoreq	r0, r8, #0
    11e0:	00050000 	andeq	r0, r5, r0
    11e4:	21330076 	teqcs	r3, r6, ror r0
    11e8:	0000009f 	muleq	r0, pc, r0	; <UNPREDICTABLE>
    11ec:	00000000 	andeq	r0, r0, r0
    11f0:	0001ec00 	andeq	lr, r1, r0, lsl #24
    11f4:	0001fe00 	andeq	pc, r1, r0, lsl #28
    11f8:	76000300 	strvc	r0, [r0], -r0, lsl #6
    11fc:	01fe9f00 	mvnseq	r9, r0, lsl #30
    1200:	020c0000 	andeq	r0, ip, #0
    1204:	00050000 	andeq	r0, r5, r0
    1208:	21310076 	teqcs	r1, r6, ror r0
    120c:	00020c9f 	muleq	r2, pc, ip	; <UNPREDICTABLE>
    1210:	00021800 	andeq	r1, r2, r0, lsl #16
    1214:	76000500 	strvc	r0, [r0], -r0, lsl #10
    1218:	9f213200 	svcls	0x00213200
    121c:	0000021e 	andeq	r0, r0, lr, lsl r2
    1220:	00000228 	andeq	r0, r0, r8, lsr #4
    1224:	00760005 	rsbseq	r0, r6, r5
    1228:	009f2133 	addseq	r2, pc, r3, lsr r1	; <UNPREDICTABLE>
    122c:	00000000 	andeq	r0, r0, r0
    1230:	ec000000 	stc	0, cr0, [r0], {-0}
    1234:	fe000001 	cdp2	0, 0, cr0, cr0, cr1, {0}
    1238:	03000001 	movweq	r0, #1
    123c:	9f007600 	svcls	0x00007600
    1240:	000001fe 	strdeq	r0, [r0], -lr
    1244:	0000020c 	andeq	r0, r0, ip, lsl #4
    1248:	00760005 	rsbseq	r0, r6, r5
    124c:	0c9f2131 	ldfeqs	f2, [pc], {49}	; 0x31
    1250:	18000002 	stmdane	r0, {r1}
    1254:	05000002 	streq	r0, [r0, #-2]
    1258:	32007600 	andcc	r7, r0, #0, 12
    125c:	021e9f21 	andseq	r9, lr, #33, 30	; 0x84
    1260:	02280000 	eoreq	r0, r8, #0
    1264:	00050000 	andeq	r0, r5, r0
    1268:	21330076 	teqcs	r3, r6, ror r0
    126c:	0000009f 	muleq	r0, pc, r0	; <UNPREDICTABLE>
    1270:	00000000 	andeq	r0, r0, r0
    1274:	0001f200 	andeq	pc, r1, r0, lsl #4
    1278:	00020200 	andeq	r0, r2, r0, lsl #4
    127c:	5c000100 	stfpls	f0, [r0], {-0}
    1280:	00000202 	andeq	r0, r0, r2, lsl #4
    1284:	00000204 	andeq	r0, r0, r4, lsl #4
    1288:	10550001 	subsne	r0, r5, r1
    128c:	12000002 	andne	r0, r0, #2
    1290:	01000002 	tsteq	r0, r2
    1294:	02225500 	eoreq	r5, r2, #0, 10
    1298:	02240000 	eoreq	r0, r4, #0
    129c:	00010000 	andeq	r0, r1, r0
    12a0:	00000055 	andeq	r0, r0, r5, asr r0
    12a4:	00000000 	andeq	r0, r0, r0
    12a8:	0001f600 	andeq	pc, r1, r0, lsl #12
    12ac:	0001fc00 	andeq	pc, r1, r0, lsl #24
    12b0:	54000100 	strpl	r0, [r0], #-256	; 0xffffff00
    12b4:	00000204 	andeq	r0, r0, r4, lsl #4
    12b8:	00000210 	andeq	r0, r0, r0, lsl r2
    12bc:	12550001 	subsne	r0, r5, #1
    12c0:	18000002 	stmdane	r0, {r1}
    12c4:	01000002 	tsteq	r0, r2
    12c8:	02245500 	eoreq	r5, r4, #0, 10
    12cc:	022a0000 	eoreq	r0, sl, #0
    12d0:	00010000 	andeq	r0, r1, r0
    12d4:	00000055 	andeq	r0, r0, r5, asr r0
    12d8:	00000000 	andeq	r0, r0, r0
    12dc:	0001f600 	andeq	pc, r1, r0, lsl #12
    12e0:	0001fc00 	andeq	pc, r1, r0, lsl #24
    12e4:	54000100 	strpl	r0, [r0], #-256	; 0xffffff00
    12e8:	00000204 	andeq	r0, r0, r4, lsl #4
    12ec:	00000210 	andeq	r0, r0, r0, lsl r2
    12f0:	12550001 	subsne	r0, r5, #1
    12f4:	18000002 	stmdane	r0, {r1}
    12f8:	01000002 	tsteq	r0, r2
    12fc:	02245500 	eoreq	r5, r4, #0, 10
    1300:	022a0000 	eoreq	r0, sl, #0
    1304:	00010000 	andeq	r0, r1, r0
    1308:	00000055 	andeq	r0, r0, r5, asr r0
    130c:	00000000 	andeq	r0, r0, r0
    1310:	00023c00 	andeq	r3, r2, r0, lsl #24
    1314:	00024400 	andeq	r4, r2, r0, lsl #8
    1318:	30000400 	andcc	r0, r0, r0, lsl #8
    131c:	4401939f 	strmi	r9, [r1], #-927	; 0xfffffc61
    1320:	88000002 	stmdahi	r0, {r1}
    1324:	03000002 	movweq	r0, #2
    1328:	01935000 	orrseq	r5, r3, r0
	...
    1334:	0000024c 	andeq	r0, r0, ip, asr #4
    1338:	00000256 	andeq	r0, r0, r6, asr r2
    133c:	d810000c 	ldmdale	r0, {r2, r3}
    1340:	fe8083db 	mcr2	3, 4, r8, cr0, cr11, {6}
    1344:	ffffffff 			; <UNDEFINED> instruction: 0xffffffff
    1348:	025c9f01 	subseq	r9, ip, #1, 30
    134c:	02660000 	rsbeq	r0, r6, #0
    1350:	000c0000 	andeq	r0, ip, r0
    1354:	83dbd810 	bicshi	sp, fp, #16, 16	; 0x100000
    1358:	fffffe80 			; <UNDEFINED> instruction: 0xfffffe80
    135c:	9f01ffff 	svcls	0x0001ffff
    1360:	0000026c 	andeq	r0, r0, ip, ror #4
    1364:	00000276 	andeq	r0, r0, r6, ror r2
    1368:	d810000c 	ldmdale	r0, {r2, r3}
    136c:	fe8083db 	mcr2	3, 4, r8, cr0, cr11, {6}
    1370:	ffffffff 			; <UNDEFINED> instruction: 0xffffffff
    1374:	027c9f01 	rsbseq	r9, ip, #1, 30
    1378:	02880000 	addeq	r0, r8, #0
    137c:	000c0000 	andeq	r0, ip, r0
    1380:	83dbd810 	bicshi	sp, fp, #16, 16	; 0x100000
    1384:	fffffe80 			; <UNDEFINED> instruction: 0xfffffe80
    1388:	9f01ffff 	svcls	0x0001ffff
	...
    1394:	0000024c 	andeq	r0, r0, ip, asr #4
    1398:	00000256 	andeq	r0, r0, r6, asr r2
    139c:	d010000c 	andsle	r0, r0, ip
    13a0:	fe8083db 	mcr2	3, 4, r8, cr0, cr11, {6}
    13a4:	ffffffff 			; <UNDEFINED> instruction: 0xffffffff
    13a8:	025c9f01 	subseq	r9, ip, #1, 30
    13ac:	02660000 	rsbeq	r0, r6, #0
    13b0:	000c0000 	andeq	r0, ip, r0
    13b4:	83dbd010 	bicshi	sp, fp, #16
    13b8:	fffffe80 			; <UNDEFINED> instruction: 0xfffffe80
    13bc:	9f01ffff 	svcls	0x0001ffff
    13c0:	0000026c 	andeq	r0, r0, ip, ror #4
    13c4:	00000276 	andeq	r0, r0, r6, ror r2
    13c8:	d010000c 	andsle	r0, r0, ip
    13cc:	fe8083db 	mcr2	3, 4, r8, cr0, cr11, {6}
    13d0:	ffffffff 			; <UNDEFINED> instruction: 0xffffffff
    13d4:	027c9f01 	rsbseq	r9, ip, #1, 30
    13d8:	02880000 	addeq	r0, r8, #0
    13dc:	000c0000 	andeq	r0, ip, r0
    13e0:	83dbd010 	bicshi	sp, fp, #16
    13e4:	fffffe80 			; <UNDEFINED> instruction: 0xfffffe80
    13e8:	9f01ffff 	svcls	0x0001ffff
	...
    13f4:	0000024c 	andeq	r0, r0, ip, asr #4
    13f8:	00000256 	andeq	r0, r0, r6, asr r2
    13fc:	01700003 	cmneq	r0, r3
    1400:	00025c9f 	muleq	r2, pc, ip	; <UNPREDICTABLE>
    1404:	00026600 	andeq	r6, r2, r0, lsl #12
    1408:	70000300 	andvc	r0, r0, r0, lsl #6
    140c:	026c9f02 	rsbeq	r9, ip, #2, 30
    1410:	02760000 	rsbseq	r0, r6, #0
    1414:	00030000 	andeq	r0, r3, r0
    1418:	7c9f0370 	ldcvc	3, cr0, [pc], {112}	; 0x70
    141c:	88000002 	stmdahi	r0, {r1}
    1420:	03000002 	movweq	r0, #2
    1424:	9f047000 	svcls	0x00047000
	...
    1430:	0000024c 	andeq	r0, r0, ip, asr #4
    1434:	00000256 	andeq	r0, r0, r6, asr r2
    1438:	01700003 	cmneq	r0, r3
    143c:	00025c9f 	muleq	r2, pc, ip	; <UNPREDICTABLE>
    1440:	00026600 	andeq	r6, r2, r0, lsl #12
    1444:	70000300 	andvc	r0, r0, r0, lsl #6
    1448:	026c9f02 	rsbeq	r9, ip, #2, 30
    144c:	02760000 	rsbseq	r0, r6, #0
    1450:	00030000 	andeq	r0, r3, r0
    1454:	7c9f0370 	ldcvc	3, cr0, [pc], {112}	; 0x70
    1458:	88000002 	stmdahi	r0, {r1}
    145c:	03000002 	movweq	r0, #2
    1460:	9f047000 	svcls	0x00047000
	...
    146c:	0000024c 	andeq	r0, r0, ip, asr #4
    1470:	00000256 	andeq	r0, r0, r6, asr r2
    1474:	9f380002 	svcls	0x00380002
    1478:	0000025c 	andeq	r0, r0, ip, asr r2
    147c:	00000266 	andeq	r0, r0, r6, ror #4
    1480:	9f380002 	svcls	0x00380002
    1484:	0000026c 	andeq	r0, r0, ip, ror #4
    1488:	00000276 	andeq	r0, r0, r6, ror r2
    148c:	9f380002 	svcls	0x00380002
    1490:	0000027c 	andeq	r0, r0, ip, ror r2
    1494:	00000288 	andeq	r0, r0, r8, lsl #5
    1498:	9f380002 	svcls	0x00380002
	...
    14a4:	0000024c 	andeq	r0, r0, ip, asr #4
    14a8:	00000256 	andeq	r0, r0, r6, asr r2
    14ac:	d010000c 	andsle	r0, r0, ip
    14b0:	fe8083db 	mcr2	3, 4, r8, cr0, cr11, {6}
    14b4:	ffffffff 			; <UNDEFINED> instruction: 0xffffffff
    14b8:	025c9f01 	subseq	r9, ip, #1, 30
    14bc:	02660000 	rsbeq	r0, r6, #0
    14c0:	000c0000 	andeq	r0, ip, r0
    14c4:	83dbd010 	bicshi	sp, fp, #16
    14c8:	fffffe80 			; <UNDEFINED> instruction: 0xfffffe80
    14cc:	9f01ffff 	svcls	0x0001ffff
    14d0:	0000026c 	andeq	r0, r0, ip, ror #4
    14d4:	00000276 	andeq	r0, r0, r6, ror r2
    14d8:	d010000c 	andsle	r0, r0, ip
    14dc:	fe8083db 	mcr2	3, 4, r8, cr0, cr11, {6}
    14e0:	ffffffff 			; <UNDEFINED> instruction: 0xffffffff
    14e4:	027c9f01 	rsbseq	r9, ip, #1, 30
    14e8:	02880000 	addeq	r0, r8, #0
    14ec:	000c0000 	andeq	r0, ip, r0
    14f0:	83dbd010 	bicshi	sp, fp, #16
    14f4:	fffffe80 			; <UNDEFINED> instruction: 0xfffffe80
    14f8:	9f01ffff 	svcls	0x0001ffff
	...
    1504:	0000024c 	andeq	r0, r0, ip, asr #4
    1508:	00000256 	andeq	r0, r0, r6, asr r2
    150c:	01700003 	cmneq	r0, r3
    1510:	00025c9f 	muleq	r2, pc, ip	; <UNPREDICTABLE>
    1514:	00026600 	andeq	r6, r2, r0, lsl #12
    1518:	70000300 	andvc	r0, r0, r0, lsl #6
    151c:	026c9f02 	rsbeq	r9, ip, #2, 30
    1520:	02760000 	rsbseq	r0, r6, #0
    1524:	00030000 	andeq	r0, r3, r0
    1528:	7c9f0370 	ldcvc	3, cr0, [pc], {112}	; 0x70
    152c:	88000002 	stmdahi	r0, {r1}
    1530:	03000002 	movweq	r0, #2
    1534:	9f047000 	svcls	0x00047000
	...
    1540:	00000250 	andeq	r0, r0, r0, asr r2
    1544:	00000256 	andeq	r0, r0, r6, asr r2
    1548:	e010000c 	ands	r0, r0, ip
    154c:	fe8083db 	mcr2	3, 4, r8, cr0, cr11, {6}
    1550:	ffffffff 			; <UNDEFINED> instruction: 0xffffffff
    1554:	02609f01 	rsbeq	r9, r0, #1, 30
    1558:	02660000 	rsbeq	r0, r6, #0
    155c:	000c0000 	andeq	r0, ip, r0
    1560:	83dbe010 	bicshi	lr, fp, #16
    1564:	fffffe80 			; <UNDEFINED> instruction: 0xfffffe80
    1568:	9f01ffff 	svcls	0x0001ffff
    156c:	00000270 	andeq	r0, r0, r0, ror r2
    1570:	00000276 	andeq	r0, r0, r6, ror r2
    1574:	e010000c 	ands	r0, r0, ip
    1578:	fe8083db 	mcr2	3, 4, r8, cr0, cr11, {6}
    157c:	ffffffff 			; <UNDEFINED> instruction: 0xffffffff
    1580:	02809f01 	addeq	r9, r0, #1, 30
    1584:	02880000 	addeq	r0, r8, #0
    1588:	000c0000 	andeq	r0, ip, r0
    158c:	83dbe010 	bicshi	lr, fp, #16
    1590:	fffffe80 			; <UNDEFINED> instruction: 0xfffffe80
    1594:	9f01ffff 	svcls	0x0001ffff
	...
    15a0:	00000250 	andeq	r0, r0, r0, asr r2
    15a4:	00000256 	andeq	r0, r0, r6, asr r2
    15a8:	d010000c 	andsle	r0, r0, ip
    15ac:	fe8083db 	mcr2	3, 4, r8, cr0, cr11, {6}
    15b0:	ffffffff 			; <UNDEFINED> instruction: 0xffffffff
    15b4:	02609f01 	rsbeq	r9, r0, #1, 30
    15b8:	02660000 	rsbeq	r0, r6, #0
    15bc:	000c0000 	andeq	r0, ip, r0
    15c0:	83dbd010 	bicshi	sp, fp, #16
    15c4:	fffffe80 			; <UNDEFINED> instruction: 0xfffffe80
    15c8:	9f01ffff 	svcls	0x0001ffff
    15cc:	00000270 	andeq	r0, r0, r0, ror r2
    15d0:	00000276 	andeq	r0, r0, r6, ror r2
    15d4:	d010000c 	andsle	r0, r0, ip
    15d8:	fe8083db 	mcr2	3, 4, r8, cr0, cr11, {6}
    15dc:	ffffffff 			; <UNDEFINED> instruction: 0xffffffff
    15e0:	02809f01 	addeq	r9, r0, #1, 30
    15e4:	02880000 	addeq	r0, r8, #0
    15e8:	000c0000 	andeq	r0, ip, r0
    15ec:	83dbd010 	bicshi	sp, fp, #16
    15f0:	fffffe80 			; <UNDEFINED> instruction: 0xfffffe80
    15f4:	9f01ffff 	svcls	0x0001ffff
	...
    1600:	00000250 	andeq	r0, r0, r0, asr r2
    1604:	00000256 	andeq	r0, r0, r6, asr r2
    1608:	9f400002 	svcls	0x00400002
    160c:	00000260 	andeq	r0, r0, r0, ror #4
    1610:	00000266 	andeq	r0, r0, r6, ror #4
    1614:	9f400002 	svcls	0x00400002
    1618:	00000270 	andeq	r0, r0, r0, ror r2
    161c:	00000276 	andeq	r0, r0, r6, ror r2
    1620:	9f400002 	svcls	0x00400002
    1624:	00000280 	andeq	r0, r0, r0, lsl #5
    1628:	00000288 	andeq	r0, r0, r8, lsl #5
    162c:	9f400002 	svcls	0x00400002
	...
    1638:	00000250 	andeq	r0, r0, r0, asr r2
    163c:	00000256 	andeq	r0, r0, r6, asr r2
    1640:	d010000c 	andsle	r0, r0, ip
    1644:	fe8083db 	mcr2	3, 4, r8, cr0, cr11, {6}
    1648:	ffffffff 			; <UNDEFINED> instruction: 0xffffffff
    164c:	02609f01 	rsbeq	r9, r0, #1, 30
    1650:	02660000 	rsbeq	r0, r6, #0
    1654:	000c0000 	andeq	r0, ip, r0
    1658:	83dbd010 	bicshi	sp, fp, #16
    165c:	fffffe80 			; <UNDEFINED> instruction: 0xfffffe80
    1660:	9f01ffff 	svcls	0x0001ffff
    1664:	00000270 	andeq	r0, r0, r0, ror r2
    1668:	00000276 	andeq	r0, r0, r6, ror r2
    166c:	d010000c 	andsle	r0, r0, ip
    1670:	fe8083db 	mcr2	3, 4, r8, cr0, cr11, {6}
    1674:	ffffffff 			; <UNDEFINED> instruction: 0xffffffff
    1678:	02809f01 	addeq	r9, r0, #1, 30
    167c:	02880000 	addeq	r0, r8, #0
    1680:	000c0000 	andeq	r0, ip, r0
    1684:	83dbd010 	bicshi	sp, fp, #16
    1688:	fffffe80 			; <UNDEFINED> instruction: 0xfffffe80
    168c:	9f01ffff 	svcls	0x0001ffff
	...
    1698:	00000290 	muleq	r0, r0, r2
    169c:	00000296 	muleq	r0, r6, r2
    16a0:	00500001 	subseq	r0, r0, r1
    16a4:	00000000 	andeq	r0, r0, r0
    16a8:	90000000 	andls	r0, r0, r0
    16ac:	96000002 	strls	r0, [r0], -r2
    16b0:	1b000002 	blne	16c0 <_umb_stack_size+0x6c0>
    16b4:	80801000 	addhi	r1, r0, r0
    16b8:	939f408c 	orrsls	r4, pc, #140	; 0x8c
    16bc:	80801004 	addhi	r1, r0, r4
    16c0:	939f4090 	orrsls	r4, pc, #144	; 0x90
    16c4:	939f3204 	orrsls	r3, pc, #4, 4	; 0x40000000
    16c8:	939f3101 	orrsls	r3, pc, #1073741824	; 0x40000000
    16cc:	01935001 	orrseq	r5, r3, r1
    16d0:	00000296 	muleq	r0, r6, r2
    16d4:	000002a4 	andeq	r0, r0, r4, lsr #5
    16d8:	80100018 	andshi	r0, r0, r8, lsl r0
    16dc:	9f408c80 	svcls	0x00408c80
    16e0:	80100493 	mulshi	r0, r3, r4
    16e4:	9f409080 	svcls	0x00409080
    16e8:	9f320493 	svcls	0x00320493
    16ec:	9f310193 	svcls	0x00310193
    16f0:	00000193 	muleq	r0, r3, r1
    16f4:	00000000 	andeq	r0, r0, r0
    16f8:	02900000 	addseq	r0, r0, #0
    16fc:	02a40000 	adceq	r0, r4, #0
    1700:	000c0000 	andeq	r0, ip, r0
    1704:	83dbd010 	bicshi	sp, fp, #16
    1708:	fffffe80 			; <UNDEFINED> instruction: 0xfffffe80
    170c:	9f01ffff 	svcls	0x0001ffff
	...
    1718:	00000290 	muleq	r0, r0, r2
    171c:	000002a4 	andeq	r0, r0, r4, lsr #5
    1720:	83100006 	tsthi	r0, #6
    1724:	9f409080 	svcls	0x00409080
	...
    1730:	00000290 	muleq	r0, r0, r2
    1734:	00000296 	muleq	r0, r6, r2
    1738:	00500001 	subseq	r0, r0, r1
    173c:	00000000 	andeq	r0, r0, r0
    1740:	90000000 	andls	r0, r0, r0
    1744:	96000002 	strls	r0, [r0], -r2
    1748:	01000002 	tsteq	r0, r2
    174c:	00005000 	andeq	r5, r0, r0
    1750:	00000000 	andeq	r0, r0, r0
	...

Disassembly of section .debug_abbrev:

00000000 <.debug_abbrev>:
   0:	25011101 	strcs	r1, [r1, #-257]	; 0xfffffeff
   4:	0305130e 	movweq	r1, #21262	; 0x530e
   8:	1b17100e 	blne	5c4048 <_umb_stack_size+0x5c3048>
   c:	1201110e 	andne	r1, r1, #-2147483645	; 0x80000003
  10:	02000006 	andeq	r0, r0, #6
  14:	0e030139 	mcreq	1, 0, r0, cr3, cr9, {1}
  18:	04030000 	streq	r0, [r3], #-0
  1c:	6d134901 	vldrvs.16	s8, [r3, #-2]	; <UNPREDICTABLE>
  20:	0b0e0319 	bleq	380c8c <_umb_stack_size+0x37fc8c>
  24:	0f01880b 	svceq	0x0001880b
  28:	28040000 	stmdacs	r4, {}	; <UNPREDICTABLE>
  2c:	1c0e0300 	stcne	3, cr0, [lr], {-0}
  30:	0500000f 	streq	r0, [r0, #-15]
  34:	0e030113 	mcreq	1, 0, r0, cr3, cr3, {0}
  38:	0b320b0b 	bleq	c82c6c <_umb_stack_size+0xc81c6c>
  3c:	000f0188 	andeq	r0, pc, r8, lsl #3
  40:	000d0600 	andeq	r0, sp, r0, lsl #12
  44:	13490e03 	movtne	r0, #40451	; 0x9e03
  48:	380f0188 	stmdacc	pc, {r3, r7, r8}	; <UNPREDICTABLE>
  4c:	000b320b 	andeq	r3, fp, fp, lsl #4
  50:	000d0700 	andeq	r0, sp, r0, lsl #14
  54:	10490e03 	subne	r0, r9, r3, lsl #28
  58:	380f0188 	stmdacc	pc, {r3, r7, r8}	; <UNPREDICTABLE>
  5c:	000b320b 	andeq	r3, fp, fp, lsl #4
  60:	00240800 	eoreq	r0, r4, r0, lsl #16
  64:	0b3e0e03 	bleq	f83878 <_umb_stack_size+0xf82878>
  68:	00000b0b 	andeq	r0, r0, fp, lsl #22
  6c:	11012e09 	tstne	r1, r9, lsl #28
  70:	40061201 	andmi	r1, r6, r1, lsl #4
  74:	3a0e0318 	bcc	380cdc <_umb_stack_size+0x37fcdc>
  78:	3f0b3b0b 	svccc	0x000b3b0b
  7c:	19018719 	stmdbne	r1, {r0, r3, r4, r8, r9, sl, pc}
  80:	0b0a0000 	bleq	280088 <_umb_stack_size+0x27f088>
  84:	12011101 	andne	r1, r1, #1073741824	; 0x40000000
  88:	0b000006 	bleq	a8 <_umb_stack_size-0xf58>
  8c:	0f1c0034 	svceq	0x001c0034
  90:	01880e03 	orreq	r0, r8, r3, lsl #28
  94:	3b0b3a0f 	blcc	2ce8d8 <_umb_stack_size+0x2cd8d8>
  98:	0013490b 	andseq	r4, r3, fp, lsl #18
  9c:	011d0c00 	tsteq	sp, r0, lsl #24
  a0:	01111031 	tsteq	r1, r1, lsr r0
  a4:	0b580612 	bleq	16018f4 <_umb_stack_size+0x16008f4>
  a8:	0b570b59 	bleq	15c2e14 <_umb_stack_size+0x15c1e14>
  ac:	1d0d0000 	stcne	0, cr0, [sp, #-0]
  b0:	11103101 	tstne	r0, r1, lsl #2
  b4:	58061201 	stmdapl	r6, {r0, r9, ip}
  b8:	5705590b 	strpl	r5, [r5, -fp, lsl #18]
  bc:	0e00000b 	cdpeq	0, 0, cr0, cr0, cr11, {0}
  c0:	0f1c0034 	svceq	0x001c0034
  c4:	00001031 	andeq	r1, r0, r1, lsr r0
  c8:	1c00050f 	cfstr32ne	mvfx0, [r0], {15}
  cc:	0010310f 	andseq	r3, r0, pc, lsl #2
  d0:	00341000 	eorseq	r1, r4, r0
  d4:	10311702 	eorsne	r1, r1, r2, lsl #14
  d8:	1d110000 	ldcne	0, cr0, [r1, #-0]
  dc:	55103101 	ldrpl	r3, [r0, #-257]	; 0xfffffeff
  e0:	590b5817 	stmdbpl	fp, {r0, r1, r2, r4, fp, ip, lr}
  e4:	b60b570b 	strlt	r5, [fp], -fp, lsl #14
  e8:	00000b42 	andeq	r0, r0, r2, asr #22
  ec:	31011d12 	tstcc	r1, r2, lsl sp
  f0:	58175510 	ldmdapl	r7, {r4, r8, sl, ip, lr}
  f4:	5705590b 	strpl	r5, [r5, -fp, lsl #18]
  f8:	1300000b 	movwne	r0, #11
  fc:	1031001d 	eorsne	r0, r1, sp, lsl r0
 100:	06120111 			; <UNDEFINED> instruction: 0x06120111
 104:	05590b58 	ldrbeq	r0, [r9, #-2904]	; 0xfffff4a8
 108:	00000b57 	andeq	r0, r0, r7, asr fp
 10c:	55010b14 	strpl	r0, [r1, #-2836]	; 0xfffff4ec
 110:	15000017 	strne	r0, [r0, #-23]	; 0xffffffe9
 114:	17020005 	strne	r0, [r2, -r5]
 118:	00001031 	andeq	r1, r0, r1, lsr r0
 11c:	31011d16 	tstcc	r1, r6, lsl sp
 120:	58175510 	ldmdapl	r7, {r4, r8, sl, ip, lr}
 124:	570b590b 	strpl	r5, [fp, -fp, lsl #18]
 128:	1700000b 	strne	r0, [r0, -fp]
 12c:	18020034 	stmdane	r2, {r2, r4, r5}
 130:	00001031 	andeq	r1, r0, r1, lsr r0
 134:	02000518 	andeq	r0, r0, #24, 10	; 0x6000000
 138:	00103118 	andseq	r3, r0, r8, lsl r1
 13c:	00341900 	eorseq	r1, r4, r0, lsl #18
 140:	0e031702 	cdpeq	7, 0, cr1, cr3, cr2, {0}
 144:	3a0f0188 	bcc	3c076c <_umb_stack_size+0x3bf76c>
 148:	490b3b0b 	stmdbmi	fp, {r0, r1, r3, r8, r9, fp, ip, sp}
 14c:	1a000013 	bne	1a0 <_umb_stack_size-0xe60>
 150:	1031001d 	eorsne	r0, r1, sp, lsl r0
 154:	0b581755 	bleq	1605eb0 <_umb_stack_size+0x1604eb0>
 158:	0b570559 	bleq	15c16c4 <_umb_stack_size+0x15c06c4>
 15c:	341b0000 	ldrcc	r0, [fp], #-0
 160:	310d1c00 	tstcc	sp, r0, lsl #24
 164:	1c000010 	stcne	0, cr0, [r0], {16}
 168:	1031001d 	eorsne	r0, r1, sp, lsl r0
 16c:	06120111 			; <UNDEFINED> instruction: 0x06120111
 170:	0b590b58 	bleq	1642ed8 <_umb_stack_size+0x1641ed8>
 174:	00000b57 	andeq	r0, r0, r7, asr fp
 178:	2501111d 	strcs	r1, [r1, #-285]	; 0xfffffee3
 17c:	0305130e 	movweq	r1, #21262	; 0x530e
 180:	1b17100e 	blne	5c41c0 <_umb_stack_size+0x5c31c0>
 184:	1e00000e 	cdpne	0, 0, cr0, cr0, cr14, {0}
 188:	0e6e012e 	poweqep	f0, f6, #0.5
 18c:	0b3a0e03 	bleq	e839a0 <_umb_stack_size+0xe829a0>
 190:	193c0b3b 	ldmdbne	ip!, {r0, r1, r3, r4, r5, r8, r9, fp}
 194:	0000193f 	andeq	r1, r0, pc, lsr r9
 198:	4900051f 	stmdbmi	r0, {r0, r1, r2, r3, r4, r8, sl}
 19c:	20000013 	andcs	r0, r0, r3, lsl r0
 1a0:	0e6e012e 	poweqep	f0, f6, #0.5
 1a4:	0b3a0e03 	bleq	e839b8 <_umb_stack_size+0xe829b8>
 1a8:	10490b3b 	subne	r0, r9, fp, lsr fp
 1ac:	193f193c 	ldmdbne	pc!, {r2, r3, r4, r5, r8, fp, ip}	; <UNPREDICTABLE>
 1b0:	2e210000 	cdpcs	0, 2, cr0, cr1, cr0, {0}
 1b4:	030e6e01 	movweq	r6, #60929	; 0xee01
 1b8:	3b0b3a0e 	blcc	2ce9f8 <_umb_stack_size+0x2cd9f8>
 1bc:	20193f05 	andscs	r3, r9, r5, lsl #30
 1c0:	2200000b 	andcs	r0, r0, #11
 1c4:	0e030005 	cdpeq	0, 0, cr0, cr3, cr5, {0}
 1c8:	053b0b3a 	ldreq	r0, [fp, #-2874]!	; 0xfffff4c6
 1cc:	00001349 	andeq	r1, r0, r9, asr #6
 1d0:	00010b23 	andeq	r0, r1, r3, lsr #22
 1d4:	00342400 	eorseq	r2, r4, r0, lsl #8
 1d8:	01880e03 	orreq	r0, r8, r3, lsl #28
 1dc:	3b0b3a0f 	blcc	2cea20 <_umb_stack_size+0x2cda20>
 1e0:	00104905 	andseq	r4, r0, r5, lsl #18
 1e4:	00342500 	eorseq	r2, r4, r0, lsl #10
 1e8:	01880e03 	orreq	r0, r8, r3, lsl #28
 1ec:	3b0b3a0f 	blcc	2cea30 <_umb_stack_size+0x2cda30>
 1f0:	00134905 	andseq	r4, r3, r5, lsl #18
 1f4:	000f2600 	andeq	r2, pc, r0, lsl #12
 1f8:	0e031049 	cdpeq	0, 0, cr1, cr3, cr9, {2}
 1fc:	00000633 	andeq	r0, r0, r3, lsr r6
 200:	49000f27 	stmdbmi	r0, {r0, r1, r2, r5, r8, r9, sl, fp}
 204:	330e0313 	movwcc	r0, #58131	; 0xe313
 208:	28000006 	stmdacs	r0, {r1, r2}
 20c:	1347012e 	movtne	r0, #28974	; 0x712e
 210:	00000b20 	andeq	r0, r0, r0, lsr #22
 214:	03000529 	movweq	r0, #1321	; 0x529
 218:	3b0b3a0e 	blcc	2cea58 <_umb_stack_size+0x2cda58>
 21c:	0013490b 	andseq	r4, r3, fp, lsl #18
 220:	00342a00 	eorseq	r2, r4, r0, lsl #20
 224:	01880e03 	orreq	r0, r8, r3, lsl #28
 228:	3b0b3a0f 	blcc	2cea6c <_umb_stack_size+0x2cda6c>
 22c:	0013490b 	andseq	r4, r3, fp, lsl #18
 230:	00342b00 	eorseq	r2, r4, r0, lsl #22
 234:	01880e03 	orreq	r0, r8, r3, lsl #28
 238:	3b0b3a0f 	blcc	2cea7c <_umb_stack_size+0x2cda7c>
 23c:	0010490b 	andseq	r4, r0, fp, lsl #18
 240:	002f2c00 	eoreq	r2, pc, r0, lsl #24
 244:	0e031049 	cdpeq	0, 0, cr1, cr3, cr9, {2}
 248:	2e2d0000 	cdpcs	0, 2, cr0, cr13, cr0, {0}
 24c:	030e6e01 	movweq	r6, #60929	; 0xee01
 250:	3b0b3a0e 	blcc	2cea90 <_umb_stack_size+0x2cda90>
 254:	20134905 	andscs	r4, r3, r5, lsl #18
 258:	2e00000b 	cdpcs	0, 0, cr0, cr0, cr11, {0}
 25c:	0e6e012e 	poweqep	f0, f6, #0.5
 260:	0b3a0e03 	bleq	e83a74 <_umb_stack_size+0xe82a74>
 264:	10490b3b 	subne	r0, r9, fp, lsr fp
 268:	00000b20 	andeq	r0, r0, r0, lsr #22
 26c:	0300052f 	movweq	r0, #1327	; 0x52f
 270:	3b0b3a0e 	blcc	2ceab0 <_umb_stack_size+0x2cdab0>
 274:	0010490b 	andseq	r4, r0, fp, lsl #18
 278:	01333000 	teqeq	r3, r0
 27c:	00001315 	andeq	r1, r0, r5, lsl r3
 280:	49000d31 	stmdbmi	r0, {r0, r4, r5, r8, sl, fp}
 284:	0f018810 	svceq	0x00018810
 288:	19340b38 	ldmdbne	r4!, {r3, r4, r5, r8, r9, fp}
 28c:	19320000 	ldmdbne	r2!, {}	; <UNPREDICTABLE>
 290:	000b1601 	andeq	r1, fp, r1, lsl #12
 294:	000d3300 	andeq	r3, sp, r0, lsl #6
 298:	13490e03 	movtne	r0, #40451	; 0x9e03
 29c:	380f0188 	stmdacc	pc, {r3, r7, r8}	; <UNPREDICTABLE>
 2a0:	3400000b 	strcc	r0, [r0], #-11
 2a4:	0e6e012e 	poweqep	f0, f6, #0.5
 2a8:	0b3a0e03 	bleq	e83abc <_umb_stack_size+0xe82abc>
 2ac:	1049053b 	subne	r0, r9, fp, lsr r5
 2b0:	00000b20 	andeq	r0, r0, r0, lsr #22
 2b4:	03000535 	movweq	r0, #1333	; 0x535
 2b8:	3b0b3a0e 	blcc	2ceaf8 <_umb_stack_size+0x2cdaf8>
 2bc:	00104905 	andseq	r4, r0, r5, lsl #18
 2c0:	012e3600 			; <UNDEFINED> instruction: 0x012e3600
 2c4:	0e030e6e 	cdpeq	14, 0, cr0, cr3, cr14, {3}
 2c8:	0b3b0b3a 	bleq	ec2fb8 <_umb_stack_size+0xec1fb8>
 2cc:	0b20193f 	bleq	8067d0 <_umb_stack_size+0x8057d0>
 2d0:	05370000 	ldreq	r0, [r7, #-0]!
 2d4:	00104900 	andseq	r4, r0, r0, lsl #18
 2d8:	01043800 	tsteq	r4, r0, lsl #16
 2dc:	196d1049 	stmdbne	sp!, {r0, r3, r6, ip}^
 2e0:	0b0b0e03 	bleq	2c3af4 <_umb_stack_size+0x2c2af4>
 2e4:	000f0188 	andeq	r0, pc, r8, lsl #3
 2e8:	002e3900 	eoreq	r3, lr, r0, lsl #18
 2ec:	06120111 			; <UNDEFINED> instruction: 0x06120111
 2f0:	0e031840 	cdpeq	8, 0, cr1, cr3, cr0, {2}
 2f4:	0b3b0b3a 	bleq	ec2fe4 <_umb_stack_size+0xec1fe4>
 2f8:	0000193f 	andeq	r1, r0, pc, lsr r9
 2fc:	49002f3a 	stmdbmi	r0, {r1, r3, r4, r5, r8, r9, sl, fp, sp}
 300:	000e0313 	andeq	r0, lr, r3, lsl r3
 304:	012e3b00 			; <UNDEFINED> instruction: 0x012e3b00
 308:	0e030e6e 	cdpeq	14, 0, cr0, cr3, cr14, {3}
 30c:	053b0b3a 	ldreq	r0, [fp, #-2874]!	; 0xfffff4c6
 310:	00000b20 	andeq	r0, r0, r0, lsr #22
 314:	6e012e3c 	mcrvs	14, 0, r2, cr1, cr12, {1}
 318:	3a0e030e 	bcc	380f58 <_umb_stack_size+0x37ff58>
 31c:	490b3b0b 	stmdbmi	fp, {r0, r1, r3, r8, r9, fp, ip, sp}
 320:	000b2013 	andeq	r2, fp, r3, lsl r0
 324:	000d3d00 	andeq	r3, sp, r0, lsl #26
 328:	01881349 	orreq	r1, r8, r9, asr #6
 32c:	340b380f 	strcc	r3, [fp], #-2063	; 0xfffff7f1
 330:	3e000019 	mcrcc	0, 0, r0, cr0, cr9, {0}
 334:	0e6e012e 	poweqep	f0, f6, #0.5
 338:	0b3a0e03 	bleq	e83b4c <_umb_stack_size+0xe82b4c>
 33c:	13490b3b 	movtne	r0, #39739	; 0x9b3b
 340:	0b20193f 	bleq	806844 <_umb_stack_size+0x805844>
 344:	Address 0x0000000000000344 is out of bounds.


Disassembly of section .debug_info:

00000000 <.debug_info>:
       0:	00001582 	andeq	r1, r0, r2, lsl #11
       4:	00000004 	andeq	r0, r0, r4
       8:	01040000 	mrseq	r0, (UNDEF: 4)
       c:	00000000 	andeq	r0, r0, r0
      10:	0041001c 	subeq	r0, r1, ip, lsl r0
      14:	00000000 	andeq	r0, r0, r0
      18:	006b0000 	rsbeq	r0, fp, r0
      1c:	00880000 	addeq	r0, r8, r0
      20:	02a60800 	adceq	r0, r6, #0, 16
      24:	60020000 	andvs	r0, r2, r0
      28:	02000003 	andeq	r0, r0, #3
      2c:	000000ba 	strheq	r0, [r0], -sl
      30:	0000c102 	andeq	ip, r0, r2, lsl #2
      34:	00c20300 	sbceq	r0, r2, r0, lsl #6
      38:	00f10000 	rscseq	r0, r1, r0
      3c:	01010000 	mrseq	r0, (UNDEF: 1)
      40:	0000cf04 	andeq	ip, r0, r4, lsl #30
      44:	d8040000 	stmdale	r4, {}	; <UNPREDICTABLE>
      48:	01000000 	mrseq	r0, (UNDEF: 0)
      4c:	0000e204 	andeq	lr, r0, r4, lsl #4
      50:	03000200 	movweq	r0, #512	; 0x200
      54:	000000c2 	andeq	r0, r0, r2, asr #1
      58:	0000012d 	andeq	r0, r0, sp, lsr #2
      5c:	0c040101 	stfeqs	f0, [r4], {1}
      60:	00000001 	andeq	r0, r0, r1
      64:	00011604 	andeq	r1, r1, r4, lsl #12
      68:	1e040100 	adfnes	f0, f4, f0
      6c:	02000001 	andeq	r0, r0, #1
      70:	0d380500 	cfldr32eq	mvfx0, [r8, #-0]
      74:	010c0000 	mrseq	r0, (UNDEF: 12)
      78:	11340604 	teqne	r4, r4, lsl #12
      7c:	00920000 	addseq	r0, r2, r0
      80:	04040000 	streq	r0, [r4], #-0
      84:	0d010703 	stceq	7, cr0, [r1, #-12]
      88:	21310000 	teqcs	r1, r0
      8c:	00040000 	andeq	r0, r4, r0
      90:	f5050003 			; <UNDEFINED> instruction: 0xf5050003
      94:	0800000c 	stmdaeq	r0, {r2, r3}
      98:	b2070401 	andlt	r0, r7, #16777216	; 0x1000000
      9c:	3100000c 	tstcc	r0, ip
      a0:	04000021 	streq	r0, [r0], #-33	; 0xffffffdf
      a4:	c5060300 	strgt	r0, [r6, #-768]	; 0xfffffd00
      a8:	3500000c 	strcc	r0, [r0, #-12]
      ac:	01000000 	mrseq	r0, (UNDEF: 0)
      b0:	dc060304 	stcle	3, cr0, [r6], {4}
      b4:	5300000c 	movwpl	r0, #12
      b8:	01000000 	mrseq	r0, (UNDEF: 0)
      bc:	00000305 	andeq	r0, r0, r5, lsl #6
      c0:	f0080000 			; <UNDEFINED> instruction: 0xf0080000
      c4:	07000006 	streq	r0, [r0, -r6]
      c8:	00b50201 	adcseq	r0, r5, r1, lsl #4
      cc:	88090000 	stmdahi	r9, {}	; <UNPREDICTABLE>
      d0:	a6080000 	strge	r0, [r8], -r0
      d4:	01000002 	tsteq	r0, r2
      d8:	00142b57 	andseq	r2, r4, r7, asr fp
      dc:	0a280100 	beq	a004e4 <_umb_stack_size+0x9ff4e4>
      e0:	08000094 	stmdaeq	r0, {r2, r4, r7}
      e4:	0000029a 	muleq	r0, sl, r2
      e8:	83dbd00b 	bicshi	sp, fp, #11
      ec:	fffffe80 			; <UNDEFINED> instruction: 0xfffffe80
      f0:	5901ffff 	stmdbpl	r1, {r0, r1, r2, r3, r4, r5, r6, r7, r8, r9, sl, fp, ip, sp, lr, pc}
      f4:	04000014 	streq	r0, [r0], #-20	; 0xffffffec
      f8:	156e2e01 	strbne	r2, [lr, #-3585]!	; 0xfffff1ff
      fc:	940a0000 	strls	r0, [sl], #-0
     100:	9a080000 	bls	200108 <_umb_stack_size+0x1ff108>
     104:	0b000002 	bleq	114 <_umb_stack_size-0xeec>
     108:	808cc880 	addhi	ip, ip, r0, lsl #17
     10c:	00144d04 	andseq	r4, r4, r4, lsl #26
     110:	2f010400 	svccs	0x00010400
     114:	0000154d 	andeq	r1, r0, sp, asr #10
     118:	0016750c 	andseq	r7, r6, ip, lsl #10
     11c:	00009400 	andeq	r9, r0, r0, lsl #8
     120:	0000a608 	andeq	sl, r0, r8, lsl #12
     124:	05300100 	ldreq	r0, [r0, #-256]!	; 0xffffff00
     128:	0017620d 	andseq	r6, r7, sp, lsl #4
     12c:	00009400 	andeq	r9, r0, r0, lsl #8
     130:	00008e08 	andeq	r8, r0, r8, lsl #28
     134:	01090700 	tsteq	r9, r0, lsl #14
     138:	00940a0d 	addseq	r0, r4, sp, lsl #20
     13c:	008e0800 	addeq	r0, lr, r0, lsl #16
     140:	d00e0000 	andle	r0, lr, r0
     144:	fe8083db 	mcr2	3, 4, r8, cr0, cr11, {6}
     148:	ffffffff 			; <UNDEFINED> instruction: 0xffffffff
     14c:	00177401 	andseq	r7, r7, r1, lsl #8
     150:	214a0c00 	cmpcs	sl, r0, lsl #24
     154:	00940000 	addseq	r0, r4, r0
     158:	00040800 	andeq	r0, r4, r0, lsl #16
     15c:	be070000 	cdplt	0, 0, cr0, cr7, cr0, {0}
     160:	dbd00f1f 	blle	ff403de4 <_umb_estack+0xdf3c5de8>
     164:	fffe8083 			; <UNDEFINED> instruction: 0xfffe8083
     168:	01ffffff 	ldrsheq	pc, [pc, #255]	; 26f <_umb_stack_size-0xd91>	; <UNPREDICTABLE>
     16c:	0000215a 	andeq	r2, r0, sl, asr r1
     170:	2165040f 	cmncs	r5, pc, lsl #8
     174:	940a0000 	strls	r0, [sl], #-0
     178:	04080000 	streq	r0, [r8], #-0
     17c:	0e000000 	cdpeq	0, 0, cr0, cr0, cr0, {0}
     180:	8083dbd0 	ldrdhi	sp, [r3], r0
     184:	fffffffe 			; <UNDEFINED> instruction: 0xfffffffe
     188:	217101ff 	ldrshcs	r0, [r1, #-31]!	; 0xffffffe1
     18c:	630c0000 	movwvs	r0, #49152	; 0xc000
     190:	9400001f 	strls	r0, [r0], #-31	; 0xffffffe1
     194:	04080000 	streq	r0, [r8], #-0
     198:	05000000 	streq	r0, [r0, #-0]
     19c:	d40f1124 	strle	r1, [pc], #-292	; 1a4 <_umb_stack_size-0xe5c>
     1a0:	fe8083db 	mcr2	3, 4, r8, cr0, cr11, {6}
     1a4:	ffffffff 			; <UNDEFINED> instruction: 0xffffffff
     1a8:	001f7d01 	andseq	r7, pc, r1, lsl #26
     1ac:	00000000 	andeq	r0, r0, r0
     1b0:	0000980a 	andeq	r9, r0, sl, lsl #16
     1b4:	00008a08 	andeq	r8, r0, r8, lsl #20
     1b8:	00871000 	addeq	r1, r7, r0
     1bc:	17810000 	strne	r0, [r1, r0]
     1c0:	980a0000 	stmdals	sl, {}	; <UNPREDICTABLE>
     1c4:	84080000 	strhi	r0, [r8], #-0
     1c8:	10000000 	andne	r0, r0, r0
     1cc:	00000000 	andeq	r0, r0, r0
     1d0:	0000178e 	andeq	r1, r0, lr, lsl #15
     1d4:	0018ce11 	andseq	ip, r8, r1, lsl lr
     1d8:	00000000 	andeq	r0, r0, r0
     1dc:	12c00700 	sbcne	r0, r0, #0, 14
     1e0:	185c1202 	ldmdane	ip, {r1, r9, ip}^
     1e4:	00400000 	subeq	r0, r0, r0
     1e8:	51040000 	mrspl	r0, (UNDEF: 4)
     1ec:	f6130e03 			; <UNDEFINED> instruction: 0xf6130e03
     1f0:	98000017 	stmdals	r0, {r0, r1, r2, r4}
     1f4:	02080000 	andeq	r0, r8, #0
     1f8:	04000000 	streq	r0, [r0], #-0
     1fc:	140c02fc 	strne	r0, [ip], #-764	; 0xfffffd04
     200:	00000080 	andeq	r0, r0, r0, lsl #1
     204:	00009c10 	andeq	r9, r0, r0, lsl ip
     208:	00188300 	andseq	r8, r8, r0, lsl #6
     20c:	19221200 	stmdbne	r2!, {r9, ip}
     210:	00a00000 	adceq	r0, r0, r0
     214:	ff040000 			; <UNDEFINED> instruction: 0xff040000
     218:	c9152302 	ldmdbgt	r5, {r1, r8, r9, sp}
     21c:	32000000 	andcc	r0, r0, #0
     220:	15000019 	strne	r0, [r0, #-25]	; 0xffffffe7
     224:	00000791 	muleq	r0, r1, r7
     228:	0000193d 	andeq	r1, r0, sp, lsr r9
     22c:	0019be16 	andseq	fp, r9, r6, lsl lr
     230:	0000c000 	andeq	ip, r0, r0
     234:	1ccd0400 	cfstrdne	mvd0, [sp], {0}
     238:	0000f615 	andeq	pc, r0, r5, lsl r6	; <UNPREDICTABLE>
     23c:	0019cf00 	andseq	ip, r9, r0, lsl #30
     240:	077d1500 	ldrbeq	r1, [sp, -r0, lsl #10]!
     244:	19db0000 	ldmibne	fp, {}^	; <UNPREDICTABLE>
     248:	00000000 	andeq	r0, r0, r0
     24c:	14000000 	strne	r0, [r0], #-0
     250:	000000e0 	andeq	r0, r0, r0, ror #1
     254:	00012310 	andeq	r2, r1, r0, lsl r3
     258:	00179b00 	andseq	r9, r7, r0, lsl #22
     25c:	218d1600 	orrcs	r1, sp, r0, lsl #12
     260:	01200000 			; <UNDEFINED> instruction: 0x01200000
     264:	c2070000 	andgt	r0, r7, #0
     268:	0184150d 	orreq	r1, r4, sp, lsl #10
     26c:	21990000 	orrscs	r0, r9, r0
     270:	b8150000 	ldmdalt	r5, {}	; <UNPREDICTABLE>
     274:	a4000001 	strge	r0, [r0], #-1
     278:	15000021 	strne	r0, [r0, #-33]	; 0xffffffdf
     27c:	000001d8 	ldrdeq	r0, [r0], -r8
     280:	000021af 	andeq	r2, r0, pc, lsr #3
     284:	00016014 	andeq	r6, r1, r4, lsl r0
     288:	029a1000 	addseq	r1, sl, #0
     28c:	21bb0000 			; <UNDEFINED> instruction: 0x21bb0000
     290:	8a160000 	bhi	580298 <_umb_stack_size+0x57f298>
     294:	a000001f 	andge	r0, r0, pc, lsl r0
     298:	05000001 	streq	r0, [r0, #-1]
     29c:	ce15052a 	cfmul64gt	mvdx0, mvdx5, mvdx10
     2a0:	a0000002 	andge	r0, r0, r2
     2a4:	1500001f 	strne	r0, [r0, #-31]	; 0xffffffe1
     2a8:	00000239 	andeq	r0, r0, r9, lsr r2
     2ac:	00001fac 	andeq	r1, r0, ip, lsr #31
     2b0:	16000000 	strne	r0, [r0], -r0
     2b4:	00002205 	andeq	r2, r0, r5, lsl #4
     2b8:	000001e0 	andeq	r0, r0, r0, ror #3
     2bc:	150dc407 	strne	ip, [sp, #-1031]	; 0xfffffbf9
     2c0:	0000058e 	andeq	r0, r0, lr, lsl #11
     2c4:	00002211 	andeq	r2, r0, r1, lsl r2
     2c8:	00056e15 	andeq	r6, r5, r5, lsl lr
     2cc:	00221c00 	eoreq	r1, r2, r0, lsl #24
     2d0:	054a1500 	strbeq	r1, [sl, #-1280]	; 0xfffffb00
     2d4:	22270000 	eorcs	r0, r7, #0
     2d8:	2a150000 	bcs	5402e0 <_umb_stack_size+0x53f2e0>
     2dc:	32000005 	andcc	r0, r0, #5
     2e0:	14000022 	strne	r0, [r0], #-34	; 0xffffffde
     2e4:	00000230 	andeq	r0, r0, r0, lsr r2
     2e8:	00050a10 	andeq	r0, r5, r0, lsl sl
     2ec:	00223e00 	eoreq	r3, r2, r0, lsl #28
     2f0:	02801400 	addeq	r1, r0, #0, 8
     2f4:	de100000 	cdple	0, 1, cr0, cr0, cr0, {0}
     2f8:	4b000004 	blmi	310 <_umb_stack_size-0xcf0>
     2fc:	14000022 	strne	r0, [r0], #-34	; 0xffffffde
     300:	000002d0 	ldrdeq	r0, [r0], -r0	; <UNPREDICTABLE>
     304:	00047210 	andeq	r7, r4, r0, lsl r2
     308:	00225800 	eoreq	r5, r2, r0, lsl #16
     30c:	03201400 	nopeq	{0}	; <UNPREDICTABLE>
     310:	52100000 	andspl	r0, r0, #0
     314:	65000004 	strvs	r0, [r0, #-4]
     318:	14000022 	strne	r0, [r0], #-34	; 0xffffffde
     31c:	00000370 	andeq	r0, r0, r0, ror r3
     320:	00043210 	andeq	r3, r4, r0, lsl r2
     324:	00227200 	eoreq	r7, r2, r0, lsl #4
     328:	21c91600 	biccs	r1, r9, r0, lsl #12
     32c:	03c00000 	biceq	r0, r0, #0
     330:	4c050000 	stcmi	0, cr0, [r5], {-0}
     334:	03fe150d 	mvnseq	r1, #54525952	; 0x3400000
     338:	21d50000 	bicscs	r0, r5, r0
     33c:	de150000 	cdple	0, 1, cr0, cr5, cr0, {0}
     340:	e0000003 	and	r0, r0, r3
     344:	15000021 	strne	r0, [r0, #-33]	; 0xffffffdf
     348:	000003be 			; <UNDEFINED> instruction: 0x000003be
     34c:	000021eb 	andeq	r2, r0, fp, ror #3
     350:	00214a16 	eoreq	r4, r1, r6, lsl sl
     354:	00041000 	andeq	r1, r4, r0
     358:	13330500 	teqne	r3, #0, 10
     35c:	00038a15 	andeq	r8, r3, r5, lsl sl
     360:	00215a00 	eoreq	r5, r1, r0, lsl #20
     364:	036a1500 	cmneq	sl, #0, 10
     368:	21650000 	cmncs	r5, r0
     36c:	50140000 	andspl	r0, r4, r0
     370:	10000004 	andne	r0, r0, r4
     374:	00000336 	andeq	r0, r0, r6, lsr r3
     378:	00002171 	andeq	r2, r0, r1, ror r1
     37c:	001f6316 	andseq	r6, pc, r6, lsl r3	; <UNPREDICTABLE>
     380:	00049000 	andeq	r9, r4, r0
     384:	11240500 			; <UNDEFINED> instruction: 0x11240500
     388:	00030215 	andeq	r0, r3, r5, lsl r2
     38c:	001f7d00 	andseq	r7, pc, r0, lsl #26
     390:	00000000 	andeq	r0, r0, r0
     394:	0004d014 	andeq	sp, r4, r4, lsl r0
     398:	05c21000 	strbeq	r1, [r2]
     39c:	21f70000 	mvnscs	r0, r0
     3a0:	8d160000 	ldchi	0, cr0, [r6, #-0]
     3a4:	10000021 	andne	r0, r0, r1, lsr #32
     3a8:	05000005 	streq	r0, [r0, #-5]
     3ac:	9f150534 	svcls	0x00150534
     3b0:	99000006 	stmdbls	r0, {r1, r2}
     3b4:	15000021 	strne	r0, [r0, #-33]	; 0xffffffdf
     3b8:	0000067f 	andeq	r0, r0, pc, ror r6
     3bc:	000021a4 	andeq	r2, r0, r4, lsr #3
     3c0:	00072815 	andeq	r2, r7, r5, lsl r8
     3c4:	0021af00 	eoreq	sl, r1, r0, lsl #30
     3c8:	05501400 	ldrbeq	r1, [r0, #-1024]	; 0xfffffc00
     3cc:	4b100000 	blmi	4003d4 <_umb_stack_size+0x3ff3d4>
     3d0:	bb000006 	bllt	3f0 <_umb_stack_size-0xc10>
     3d4:	16000021 	strne	r0, [r0], -r1, lsr #32
     3d8:	00001f8a 	andeq	r1, r0, sl, lsl #31
     3dc:	00000590 	muleq	r0, r0, r5
     3e0:	15052a05 	strne	r2, [r5, #-2565]	; 0xfffff5fb
     3e4:	00000617 	andeq	r0, r0, r7, lsl r6
     3e8:	00001fa0 	andeq	r1, r0, r0, lsr #31
     3ec:	0006d315 	andeq	sp, r6, r5, lsl r3
     3f0:	001fac00 	andseq	sl, pc, r0, lsl #24
	...
     400:	8d0c0000 	stchi	0, cr0, [ip, #-0]
     404:	1e000021 	cdpne	0, 0, cr0, cr0, cr1, {1}
     408:	04080001 	streq	r0, [r8], #-1
     40c:	07000000 	streq	r0, [r0, -r0]
     410:	d00f09c6 	andle	r0, pc, r6, asr #19
     414:	fe8083db 	mcr2	3, 4, r8, cr0, cr11, {6}
     418:	ffffffff 			; <UNDEFINED> instruction: 0xffffffff
     41c:	00219901 	eoreq	r9, r1, r1, lsl #18
     420:	a4080f00 	strge	r0, [r8], #-3840	; 0xfffff100
     424:	0f000021 	svceq	0x00000021
     428:	0021af00 	eoreq	sl, r1, r0, lsl #30
     42c:	011e0a00 	tsteq	lr, r0, lsl #20
     430:	00040800 	andeq	r0, r4, r0, lsl #16
     434:	d00e0000 	andle	r0, lr, r0
     438:	fe8083db 	mcr2	3, 4, r8, cr0, cr11, {6}
     43c:	ffffffff 			; <UNDEFINED> instruction: 0xffffffff
     440:	0021bb01 	eoreq	fp, r1, r1, lsl #22
     444:	1f8a0c00 	svcne	0x008a0c00
     448:	011e0000 	tsteq	lr, r0
     44c:	00040800 	andeq	r0, r4, r0, lsl #16
     450:	2a050000 	bcs	140458 <_umb_stack_size+0x13f458>
     454:	dbd80f05 	blle	ff604070 <_umb_estack+0xdf5c6074>
     458:	fffe8083 			; <UNDEFINED> instruction: 0xfffe8083
     45c:	01ffffff 	ldrsheq	pc, [pc, #255]	; 563 <_umb_stack_size-0xa9d>	; <UNPREDICTABLE>
     460:	00001fa0 	andeq	r1, r0, r0, lsr #31
     464:	1fac000f 	svcne	0x00ac000f
	...
     470:	001a130d 	andseq	r1, sl, sp, lsl #6
     474:	00012200 	andeq	r2, r1, r0, lsl #4
     478:	00001808 	andeq	r1, r0, r8, lsl #16
     47c:	010a0700 	tsteq	sl, r0, lsl #14
     480:	01220a0d 			; <UNDEFINED> instruction: 0x01220a0d
     484:	00180800 	andseq	r0, r8, r0, lsl #16
     488:	d00e0000 	andle	r0, lr, r0
     48c:	fe8083db 	mcr2	3, 4, r8, cr0, cr11, {6}
     490:	ffffffff 			; <UNDEFINED> instruction: 0xffffffff
     494:	001a2501 	andseq	r2, sl, r1, lsl #10
     498:	22050c00 	andcs	r0, r5, #0, 24
     49c:	01220000 			; <UNDEFINED> instruction: 0x01220000
     4a0:	000c0800 	andeq	r0, ip, r0, lsl #16
     4a4:	d0070000 	andle	r0, r7, r0
     4a8:	dbd00f09 	blle	ff4040d4 <_umb_estack+0xdf3c60d8>
     4ac:	fffe8083 			; <UNDEFINED> instruction: 0xfffe8083
     4b0:	01ffffff 	ldrsheq	pc, [pc, #255]	; 5b7 <_umb_stack_size-0xa49>	; <UNPREDICTABLE>
     4b4:	00002211 	andeq	r2, r0, r1, lsl r2
     4b8:	221c000f 	andscs	r0, ip, #15
     4bc:	810f0000 	mrshi	r0, CPSR
     4c0:	00222702 	eoreq	r2, r2, r2, lsl #14
     4c4:	32010f00 	andcc	r0, r1, #0, 30
     4c8:	0a000022 	beq	558 <_umb_stack_size-0xaa8>
     4cc:	08000122 	stmdaeq	r0, {r1, r5, r8}
     4d0:	0000000c 	andeq	r0, r0, ip
     4d4:	223e010e 	eorscs	r0, lr, #-2147483645	; 0x80000003
     4d8:	220a0000 	andcs	r0, sl, #0
     4dc:	0c080001 	stceq	0, cr0, [r8], {1}
     4e0:	17000000 	strne	r0, [r0, -r0]
     4e4:	02811008 	addeq	r1, r1, #8
     4e8:	1a01ff10 	bne	80130 <_umb_stack_size+0x7f130>
     4ec:	00224b9f 	mlaeq	r2, pc, fp, r4	; <UNPREDICTABLE>
     4f0:	01220a00 			; <UNDEFINED> instruction: 0x01220a00
     4f4:	000c0800 	andeq	r0, ip, r0, lsl #16
     4f8:	a5100000 	ldrge	r0, [r0, #-0]
     4fc:	58000007 	stmdapl	r0, {r0, r1, r2}
     500:	0a000022 	beq	590 <_umb_stack_size-0xa70>
     504:	08000122 	stmdaeq	r0, {r1, r5, r8}
     508:	0000000c 	andeq	r0, r0, ip
     50c:	2265000e 	rsbcs	r0, r5, #14
     510:	220a0000 	andcs	r0, sl, #0
     514:	0c080001 	stceq	0, cr0, [r8], {1}
     518:	17000000 	strne	r0, [r0, -r0]
     51c:	729f3102 	addsvc	r3, pc, #-2147483648	; 0x80000000
     520:	0c000022 	stceq	0, cr0, [r0], {34}	; 0x22
     524:	000021c9 	andeq	r2, r0, r9, asr #3
     528:	08000122 	stmdaeq	r0, {r1, r5, r8}
     52c:	0000000c 	andeq	r0, r0, ip
     530:	0f0d4c05 	svceq	0x000d4c05
     534:	8083dbd0 	ldrdhi	sp, [r3], r0
     538:	fffffffe 			; <UNDEFINED> instruction: 0xfffffffe
     53c:	21d501ff 	ldrshcs	r0, [r5, #31]
     540:	000f0000 	andeq	r0, pc, r0
     544:	000021e0 	andeq	r2, r0, r0, ror #3
     548:	9f310218 	svcls	0x00310218
     54c:	000021eb 	andeq	r2, r0, fp, ror #3
     550:	00214a0c 	eoreq	r4, r1, ip, lsl #20
     554:	00012200 	andeq	r2, r1, r0, lsl #4
     558:	00000408 	andeq	r0, r0, r8, lsl #8
     55c:	13330500 	teqne	r3, #0, 10
     560:	83dbd00f 	bicshi	sp, fp, #15
     564:	fffffe80 			; <UNDEFINED> instruction: 0xfffffe80
     568:	5a01ffff 	bpl	8056c <_umb_stack_size+0x7f56c>
     56c:	0f000021 	svceq	0x00000021
     570:	00216500 	eoreq	r6, r1, r0, lsl #10
     574:	01220a00 			; <UNDEFINED> instruction: 0x01220a00
     578:	00040800 	andeq	r0, r4, r0, lsl #16
     57c:	d00e0000 	andle	r0, lr, r0
     580:	fe8083db 	mcr2	3, 4, r8, cr0, cr11, {6}
     584:	ffffffff 			; <UNDEFINED> instruction: 0xffffffff
     588:	00217101 	eoreq	r7, r1, r1, lsl #2
     58c:	1f630c00 	svcne	0x00630c00
     590:	01220000 			; <UNDEFINED> instruction: 0x01220000
     594:	00040800 	andeq	r0, r4, r0, lsl #16
     598:	24050000 	strcs	r0, [r5], #-0
     59c:	dbd00f11 	blle	ff4041e8 <_umb_estack+0xdf3c61ec>
     5a0:	fffe8083 			; <UNDEFINED> instruction: 0xfffe8083
     5a4:	01ffffff 	ldrsheq	pc, [pc, #255]	; 6ab <_umb_stack_size-0x955>	; <UNPREDICTABLE>
     5a8:	00001f7d 	andeq	r1, r0, sp, ror pc
     5ac:	0a000000 	beq	5b4 <_umb_stack_size-0xa4c>
     5b0:	08000126 	stmdaeq	r0, {r1, r2, r5, r8}
     5b4:	00000008 	andeq	r0, r0, r8
     5b8:	0007bf10 	andeq	fp, r7, r0, lsl pc
     5bc:	0021f700 	eoreq	pc, r1, r0, lsl #14
     5c0:	218d0c00 	orrcs	r0, sp, r0, lsl #24
     5c4:	012a0000 			; <UNDEFINED> instruction: 0x012a0000
     5c8:	00040800 	andeq	r0, r4, r0, lsl #16
     5cc:	34050000 	strcc	r0, [r5], #-0
     5d0:	dbd00f05 	blle	ff4041ec <_umb_estack+0xdf3c61f0>
     5d4:	fffe8083 			; <UNDEFINED> instruction: 0xfffe8083
     5d8:	01ffffff 	ldrsheq	pc, [pc, #255]	; 6df <_umb_stack_size-0x921>	; <UNPREDICTABLE>
     5dc:	00002199 	muleq	r0, r9, r1
     5e0:	21a4000f 			; <UNDEFINED> instruction: 0x21a4000f
     5e4:	01180000 	tsteq	r8, r0
     5e8:	0021af50 	eoreq	sl, r1, r0, asr pc
     5ec:	012a0a00 			; <UNDEFINED> instruction: 0x012a0a00
     5f0:	00040800 	andeq	r0, r4, r0, lsl #16
     5f4:	d00e0000 	andle	r0, lr, r0
     5f8:	fe8083db 	mcr2	3, 4, r8, cr0, cr11, {6}
     5fc:	ffffffff 			; <UNDEFINED> instruction: 0xffffffff
     600:	0021bb01 	eoreq	fp, r1, r1, lsl #22
     604:	1f8a0c00 	svcne	0x008a0c00
     608:	012a0000 			; <UNDEFINED> instruction: 0x012a0000
     60c:	00040800 	andeq	r0, r4, r0, lsl #16
     610:	2a050000 	bcs	140618 <_umb_stack_size+0x13f618>
     614:	dbd00f05 	blle	ff404230 <_umb_estack+0xdf3c6234>
     618:	fffe8083 			; <UNDEFINED> instruction: 0xfffe8083
     61c:	01ffffff 	ldrsheq	pc, [pc, #255]	; 723 <_umb_stack_size-0x8dd>	; <UNPREDICTABLE>
     620:	00001fa0 	andeq	r1, r0, r0, lsr #31
     624:	ac500118 	ldfgee	f0, [r0], {24}
     628:	0000001f 	andeq	r0, r0, pc, lsl r0
	...
     634:	c00c0000 	andgt	r0, ip, r0
     638:	2e000022 	cdpcs	0, 0, cr0, cr0, cr2, {1}
     63c:	0c080001 	stceq	0, cr0, [r8], {1}
     640:	07000000 	streq	r0, [r0, -r0]
     644:	d00f09d2 	ldrdle	r0, [pc], -r2
     648:	fe8083db 	mcr2	3, 4, r8, cr0, cr11, {6}
     64c:	ffffffff 			; <UNDEFINED> instruction: 0xffffffff
     650:	0022cc01 	eoreq	ip, r2, r1, lsl #24
     654:	d7000f00 	strle	r0, [r0, -r0, lsl #30]
     658:	0f000022 	svceq	0x00000022
     65c:	22e20280 	rsccs	r0, r2, #128, 4
     660:	010f0000 	mrseq	r0, CPSR
     664:	000022ed 	andeq	r2, r0, sp, ror #5
     668:	00012e0a 	andeq	r2, r1, sl, lsl #28
     66c:	00000c08 	andeq	r0, r0, r8, lsl #24
     670:	f9010e00 			; <UNDEFINED> instruction: 0xf9010e00
     674:	0a000022 	beq	704 <_umb_stack_size-0x8fc>
     678:	0800012e 	stmdaeq	r0, {r1, r2, r3, r5, r8}
     67c:	0000000c 	andeq	r0, r0, ip
     680:	80100817 	andshi	r0, r0, r7, lsl r8
     684:	01ff1002 	mvnseq	r1, r2
     688:	23069f1a 	movwcs	r9, #28442	; 0x6f1a
     68c:	2e0a0000 	cdpcs	0, 0, cr0, cr10, cr0, {0}
     690:	0c080001 	stceq	0, cr0, [r8], {1}
     694:	10000000 	andne	r0, r0, r0
     698:	000007d2 	ldrdeq	r0, [r0], -r2
     69c:	00002313 	andeq	r2, r0, r3, lsl r3
     6a0:	00012e0a 	andeq	r2, r1, sl, lsl #28
     6a4:	00000c08 	andeq	r0, r0, r8, lsl #24
     6a8:	20000e00 	andcs	r0, r0, r0, lsl #28
     6ac:	0a000023 	beq	740 <_umb_stack_size-0x8c0>
     6b0:	0800012e 	stmdaeq	r0, {r1, r2, r3, r5, r8}
     6b4:	0000000c 	andeq	r0, r0, ip
     6b8:	9f300217 	svcls	0x00300217
     6bc:	0000232d 	andeq	r2, r0, sp, lsr #6
     6c0:	0022840c 	eoreq	r8, r2, ip, lsl #8
     6c4:	00012e00 	andeq	r2, r1, r0, lsl #28
     6c8:	00000c08 	andeq	r0, r0, r8, lsl #24
     6cc:	0d3f0500 	cfldr32eq	mvfx0, [pc, #-0]	; 6d4 <_umb_stack_size-0x92c>
     6d0:	83dbd00f 	bicshi	sp, fp, #15
     6d4:	fffffe80 			; <UNDEFINED> instruction: 0xfffffe80
     6d8:	9001ffff 	strdls	pc, [r1], -pc	; <UNPREDICTABLE>
     6dc:	0f000022 	svceq	0x00000022
     6e0:	00229b00 	eoreq	r9, r2, r0, lsl #22
     6e4:	30021800 	andcc	r1, r2, r0, lsl #16
     6e8:	0022a69f 	mlaeq	r2, pc, r6, sl	; <UNPREDICTABLE>
     6ec:	214a0c00 	cmpcs	sl, r0, lsl #24
     6f0:	012e0000 			; <UNDEFINED> instruction: 0x012e0000
     6f4:	00040800 	andeq	r0, r4, r0, lsl #16
     6f8:	2e050000 	cdpcs	0, 0, cr0, cr5, cr0, {0}
     6fc:	dbd00f13 	blle	ff404350 <_umb_estack+0xdf3c6354>
     700:	fffe8083 			; <UNDEFINED> instruction: 0xfffe8083
     704:	01ffffff 	ldrsheq	pc, [pc, #255]	; 80b <_umb_stack_size-0x7f5>	; <UNPREDICTABLE>
     708:	0000215a 	andeq	r2, r0, sl, asr r1
     70c:	2165000f 	cmncs	r5, pc
     710:	2e0a0000 	cdpcs	0, 0, cr0, cr10, cr0, {0}
     714:	04080001 	streq	r0, [r8], #-1
     718:	0e000000 	cdpeq	0, 0, cr0, cr0, cr0, {0}
     71c:	8083dbd0 	ldrdhi	sp, [r3], r0
     720:	fffffffe 			; <UNDEFINED> instruction: 0xfffffffe
     724:	217101ff 	ldrshcs	r0, [r1, #-31]!	; 0xffffffe1
     728:	630c0000 	movwvs	r0, #49152	; 0xc000
     72c:	2e00001f 	mcrcs	0, 0, r0, cr0, cr15, {0}
     730:	04080001 	streq	r0, [r8], #-1
     734:	05000000 	streq	r0, [r0, #-0]
     738:	d00f1124 	andle	r1, pc, r4, lsr #2
     73c:	fe8083db 	mcr2	3, 4, r8, cr0, cr11, {6}
     740:	ffffffff 			; <UNDEFINED> instruction: 0xffffffff
     744:	001f7d01 	andseq	r7, pc, r1, lsl #26
     748:	00000000 	andeq	r0, r0, r0
     74c:	0001320a 	andeq	r3, r1, sl, lsl #4
     750:	00000808 	andeq	r0, r0, r8, lsl #16
     754:	07ec1000 	strbeq	r1, [ip, r0]!
     758:	22b20000 	adcscs	r0, r2, #0
     75c:	8d0c0000 	stchi	0, cr0, [ip, #-0]
     760:	36000021 	strcc	r0, [r0], -r1, lsr #32
     764:	04080001 	streq	r0, [r8], #-1
     768:	05000000 	streq	r0, [r0, #-0]
     76c:	d00f052f 	andle	r0, pc, pc, lsr #10
     770:	fe8083db 	mcr2	3, 4, r8, cr0, cr11, {6}
     774:	ffffffff 			; <UNDEFINED> instruction: 0xffffffff
     778:	00219901 	eoreq	r9, r1, r1, lsl #18
     77c:	a4000f00 	strge	r0, [r0], #-3840	; 0xfffff100
     780:	18000021 	stmdane	r0, {r0, r5}
     784:	21af5001 			; <UNDEFINED> instruction: 0x21af5001
     788:	360a0000 	strcc	r0, [sl], -r0
     78c:	04080001 	streq	r0, [r8], #-1
     790:	0e000000 	cdpeq	0, 0, cr0, cr0, cr0, {0}
     794:	8083dbd0 	ldrdhi	sp, [r3], r0
     798:	fffffffe 			; <UNDEFINED> instruction: 0xfffffffe
     79c:	21bb01ff 			; <UNDEFINED> instruction: 0x21bb01ff
     7a0:	8a0c0000 	bhi	3007a8 <_umb_stack_size+0x2ff7a8>
     7a4:	3600001f 			; <UNDEFINED> instruction: 0x3600001f
     7a8:	04080001 	streq	r0, [r8], #-1
     7ac:	05000000 	streq	r0, [r0, #-0]
     7b0:	d00f052a 	andle	r0, pc, sl, lsr #10
     7b4:	fe8083db 	mcr2	3, 4, r8, cr0, cr11, {6}
     7b8:	ffffffff 			; <UNDEFINED> instruction: 0xffffffff
     7bc:	001fa001 	andseq	sl, pc, r1
     7c0:	50011800 	andpl	r1, r1, r0, lsl #16
     7c4:	00001fac 	andeq	r1, r0, ip, lsr #31
	...
     7d4:	3a0a0000 	bcc	2807dc <_umb_stack_size+0x27f7dc>
     7d8:	f4080001 	vst4.8	{d0-d3}, [r8], r1
     7dc:	19000001 	stmdbne	r0, {r0}
     7e0:	000007ff 	strdeq	r0, [r0], -pc	; <UNPREDICTABLE>
     7e4:	00000ca0 	andeq	r0, r0, r0, lsr #25
     7e8:	71400104 	cmpvc	r0, r4, lsl #2
     7ec:	0c000000 	stceq	0, cr0, [r0], {-0}
     7f0:	0000168f 	andeq	r1, r0, pc, lsl #13
     7f4:	0800013a 	stmdaeq	r0, {r1, r3, r4, r5, r8}
     7f8:	00000072 	andeq	r0, r0, r2, ror r0
     7fc:	0a054201 	beq	151008 <_umb_stack_size+0x150008>
     800:	0800013a 	stmdaeq	r0, {r1, r3, r4, r5, r8}
     804:	00000072 	andeq	r0, r0, r2, ror r0
     808:	9080800e 	addls	r8, r0, lr
     80c:	0016b540 	andseq	fp, r6, r0, asr #10
     810:	013a0a00 	teqeq	sl, r0, lsl #20
     814:	00720800 	rsbseq	r0, r2, r0, lsl #16
     818:	800e0000 	andhi	r0, lr, r0
     81c:	c3409880 	movtgt	r9, #2176	; 0x880
     820:	0a000016 	beq	880 <_umb_stack_size-0x780>
     824:	0800013a 	stmdaeq	r0, {r1, r3, r4, r5, r8}
     828:	00000072 	andeq	r0, r0, r2, ror r0
     82c:	16d1000e 	ldrbne	r0, [r1], lr
     830:	330d0000 	movwcc	r0, #53248	; 0xd000
     834:	3a00001a 	bcc	8a4 <_umb_stack_size-0x75c>
     838:	50080001 	andpl	r0, r8, r1
     83c:	07000000 	streq	r0, [r0, -r0]
     840:	0a22011d 	beq	880cbc <_umb_stack_size+0x87fcbc>
     844:	0800013a 	stmdaeq	r0, {r1, r3, r4, r5, r8}
     848:	00000050 	andeq	r0, r0, r0, asr r0
     84c:	83dbd00e 	bicshi	sp, fp, #14
     850:	fffffe80 			; <UNDEFINED> instruction: 0xfffffe80
     854:	4501ffff 	strmi	pc, [r1, #-4095]	; 0xfffff001
     858:	0c00001a 	stceq	0, cr0, [r0], {26}
     85c:	0000214a 	andeq	r2, r0, sl, asr #2
     860:	0800013a 	stmdaeq	r0, {r1, r3, r4, r5, r8}
     864:	00000004 	andeq	r0, r0, r4
     868:	0f1fe907 	svceq	0x001fe907
     86c:	8083dbd0 	ldrdhi	sp, [r3], r0
     870:	fffffffe 			; <UNDEFINED> instruction: 0xfffffffe
     874:	215a01ff 	ldrshcs	r0, [sl, #-31]	; 0xffffffe1
     878:	040f0000 	streq	r0, [pc], #-0	; 880 <_umb_stack_size-0x780>
     87c:	00002165 	andeq	r2, r0, r5, ror #2
     880:	00013a0a 	andeq	r3, r1, sl, lsl #20
     884:	00000408 	andeq	r0, r0, r8, lsl #8
     888:	dbd00e00 	blle	ff404090 <_umb_estack+0xdf3c6094>
     88c:	fffe8083 			; <UNDEFINED> instruction: 0xfffe8083
     890:	01ffffff 	ldrsheq	pc, [pc, #255]	; 997 <_umb_stack_size-0x669>	; <UNPREDICTABLE>
     894:	00002171 	andeq	r2, r0, r1, ror r1
     898:	001f630c 	andseq	r6, pc, ip, lsl #6
     89c:	00013a00 	andeq	r3, r1, r0, lsl #20
     8a0:	00000408 	andeq	r0, r0, r8, lsl #8
     8a4:	11240500 			; <UNDEFINED> instruction: 0x11240500
     8a8:	83dbd40f 	bicshi	sp, fp, #251658240	; 0xf000000
     8ac:	fffffe80 			; <UNDEFINED> instruction: 0xfffffe80
     8b0:	7d01ffff 	stcvc	15, cr15, [r1, #-1020]	; 0xfffffc04
     8b4:	0000001f 	andeq	r0, r0, pc, lsl r0
     8b8:	3e0a0000 	cdpcc	0, 0, cr0, cr10, cr0, {0}
     8bc:	4c080001 	stcmi	0, cr0, [r8], {1}
     8c0:	10000000 	andne	r0, r0, r0
     8c4:	00000865 	andeq	r0, r0, r5, ror #16
     8c8:	00001a5f 	andeq	r1, r0, pc, asr sl
     8cc:	0018f511 	andseq	pc, r8, r1, lsl r5	; <UNPREDICTABLE>
     8d0:	0005d000 	andeq	sp, r5, r0
     8d4:	12eb0700 	rscne	r0, fp, #0, 14
     8d8:	18921202 	ldmne	r2, {r1, r9, ip}
     8dc:	06000000 	streq	r0, [r0], -r0
     8e0:	51040000 	mrspl	r0, (UNDEF: 4)
     8e4:	201a0e03 	andscs	r0, sl, r3, lsl #28
     8e8:	30000018 	andcc	r0, r0, r8, lsl r0
     8ec:	04000006 	streq	r0, [r0], #-6
     8f0:	000c02fc 	strdeq	r0, [ip], -ip
     8f4:	06481400 	strbeq	r1, [r8], -r0, lsl #8
     8f8:	58100000 	ldmdapl	r0, {}	; <UNPREDICTABLE>
     8fc:	6c00000a 	stcvs	0, cr0, [r0], {10}
     900:	1600001a 			; <UNDEFINED> instruction: 0x1600001a
     904:	0000218d 	andeq	r2, r0, sp, lsl #3
     908:	00000670 	andeq	r0, r0, r0, ror r6
     90c:	150ded07 	strne	lr, [sp, #-3335]	; 0xfffff2f9
     910:	000009f8 	strdeq	r0, [r0], -r8
     914:	00002199 	muleq	r0, r9, r1
     918:	0009c015 	andeq	ip, r9, r5, lsl r0
     91c:	0021a400 	eoreq	sl, r1, r0, lsl #8
     920:	09841500 	stmibeq	r4, {r8, sl, ip}
     924:	21af0000 			; <UNDEFINED> instruction: 0x21af0000
     928:	98140000 	ldmdals	r4, {}	; <UNPREDICTABLE>
     92c:	10000006 	andne	r0, r0, r6
     930:	000008e8 	andeq	r0, r0, r8, ror #17
     934:	000021bb 			; <UNDEFINED> instruction: 0x000021bb
     938:	001f8a16 	andseq	r8, pc, r6, lsl sl	; <UNPREDICTABLE>
     93c:	0006c000 	andeq	ip, r6, r0
     940:	052a0500 	streq	r0, [sl, #-1280]!	; 0xfffffb00
     944:	00088815 	andeq	r8, r8, r5, lsl r8
     948:	001fa000 	andseq	sl, pc, r0
     94c:	09481500 	stmdbeq	r8, {r8, sl, ip}^
     950:	1fac0000 	svcne	0x00ac0000
     954:	00000000 	andeq	r0, r0, r0
     958:	214a1600 	cmpcs	sl, r0, lsl #12
     95c:	06e80000 	strbteq	r0, [r8], r0
     960:	ef070000 	svc	0x00070000
     964:	0b8c1511 	bleq	fe305db0 <_umb_estack+0xde2c7db4>
     968:	215a0000 	cmpcs	sl, r0
     96c:	54150000 	ldrpl	r0, [r5], #-0
     970:	6500000b 	strvs	r0, [r0, #-11]
     974:	14000021 	strne	r0, [r0], #-33	; 0xffffffdf
     978:	00000710 	andeq	r0, r0, r0, lsl r7
     97c:	000af410 	andeq	pc, sl, r0, lsl r4	; <UNPREDICTABLE>
     980:	00217100 	eoreq	r7, r1, r0, lsl #2
     984:	1f631600 	svcne	0x00631600
     988:	07380000 	ldreq	r0, [r8, -r0]!
     98c:	24050000 	strcs	r0, [r5], #-0
     990:	0a941511 	beq	fe505ddc <_umb_estack+0xde4c7de0>
     994:	1f7d0000 	svcne	0x007d0000
	...
     9a0:	01900a00 	orrseq	r0, r0, r0, lsl #20
     9a4:	001c0800 	andseq	r0, ip, r0, lsl #16
     9a8:	ec100000 	ldc	0, cr0, [r0], {-0}
     9ac:	df00000b 	svcle	0x0000000b
     9b0:	0a000016 	beq	a10 <_umb_stack_size-0x5f0>
     9b4:	08000190 	stmdaeq	r0, {r4, r7, r8}
     9b8:	0000001c 	andeq	r0, r0, ip, lsl r0
     9bc:	000bff10 	andeq	pc, fp, r0, lsl pc	; <UNPREDICTABLE>
     9c0:	0016ed00 	andseq	lr, r6, r0, lsl #26
     9c4:	1a970d00 	bne	fe5c3dcc <_umb_estack+0xde585dd0>
     9c8:	01900000 	orrseq	r0, r0, r0
     9cc:	001c0800 	andseq	r0, ip, r0, lsl #16
     9d0:	26070000 	strcs	r0, [r7], -r0
     9d4:	900a0d01 	andls	r0, sl, r1, lsl #26
     9d8:	1c080001 	stcne	0, cr0, [r8], {1}
     9dc:	10000000 	andne	r0, r0, r0
     9e0:	00000c4e 	andeq	r0, r0, lr, asr #24
     9e4:	00001ab4 			; <UNDEFINED> instruction: 0x00001ab4
     9e8:	0001900a 	andeq	r9, r1, sl
     9ec:	00001c08 	andeq	r1, r0, r8, lsl #24
     9f0:	0c6c1000 	stcleq	0, cr1, [ip], #-0
     9f4:	1ac10000 	bne	ff0409fc <_umb_estack+0xdf002a00>
     9f8:	8d0c0000 	stchi	0, cr0, [ip, #-0]
     9fc:	92000021 	andls	r0, r0, #33	; 0x21
     a00:	0a080001 	beq	200a0c <_umb_stack_size+0x1ffa0c>
     a04:	07000000 	streq	r0, [r0, -r0]
     a08:	d00f09e0 	andle	r0, pc, r0, ror #19
     a0c:	fe8083db 	mcr2	3, 4, r8, cr0, cr11, {6}
     a10:	ffffffff 			; <UNDEFINED> instruction: 0xffffffff
     a14:	00219901 	eoreq	r9, r1, r1, lsl #18
     a18:	a4080f00 	strge	r0, [r8], #-3840	; 0xfffff100
     a1c:	15000021 	strne	r0, [r0, #-33]	; 0xffffffdf
     a20:	00000c84 	andeq	r0, r0, r4, lsl #25
     a24:	000021af 	andeq	r2, r0, pc, lsr #3
     a28:	0001920a 	andeq	r9, r1, sl, lsl #4
     a2c:	00000a08 	andeq	r0, r0, r8, lsl #20
     a30:	dbd00e00 	blle	ff404238 <_umb_estack+0xdf3c623c>
     a34:	fffe8083 			; <UNDEFINED> instruction: 0xfffe8083
     a38:	01ffffff 	ldrsheq	pc, [pc, #255]	; b3f <_umb_stack_size-0x4c1>	; <UNPREDICTABLE>
     a3c:	000021bb 			; <UNDEFINED> instruction: 0x000021bb
     a40:	001f8a0c 	andseq	r8, pc, ip, lsl #20
     a44:	00019200 	andeq	r9, r1, r0, lsl #4
     a48:	00000a08 	andeq	r0, r0, r8, lsl #20
     a4c:	052a0500 	streq	r0, [sl, #-1280]!	; 0xfffffb00
     a50:	83dbd80f 	bicshi	sp, fp, #983040	; 0xf0000
     a54:	fffffe80 			; <UNDEFINED> instruction: 0xfffffe80
     a58:	a001ffff 	strdge	pc, [r1], -pc	; <UNPREDICTABLE>
     a5c:	1500001f 	strne	r0, [r0, #-31]	; 0xffffffe1
     a60:	00000c97 	muleq	r0, r7, ip
     a64:	00001fac 	andeq	r1, r0, ip, lsr #31
     a68:	0c000000 	stceq	0, cr0, [r0], {-0}
     a6c:	0000218d 	andeq	r2, r0, sp, lsl #3
     a70:	0800019c 	stmdaeq	r0, {r2, r3, r4, r7, r8}
     a74:	0000000e 	andeq	r0, r0, lr
     a78:	0f09e107 	svceq	0x0009e107
     a7c:	8083dbd0 	ldrdhi	sp, [r3], r0
     a80:	fffffffe 			; <UNDEFINED> instruction: 0xfffffffe
     a84:	219901ff 			; <UNDEFINED> instruction: 0x219901ff
     a88:	0c0f0000 	stceq	0, cr0, [pc], {-0}
     a8c:	000021a4 	andeq	r2, r0, r4, lsr #3
     a90:	9080800f 	addls	r8, r0, pc
     a94:	0021af40 	eoreq	sl, r1, r0, asr #30
     a98:	019c0a00 	orrseq	r0, ip, r0, lsl #20
     a9c:	000e0800 	andeq	r0, lr, r0, lsl #16
     aa0:	d00e0000 	andle	r0, lr, r0
     aa4:	fe8083db 	mcr2	3, 4, r8, cr0, cr11, {6}
     aa8:	ffffffff 			; <UNDEFINED> instruction: 0xffffffff
     aac:	0021bb01 	eoreq	fp, r1, r1, lsl #22
     ab0:	1f8a0c00 	svcne	0x008a0c00
     ab4:	019c0000 	orrseq	r0, ip, r0
     ab8:	000e0800 	andeq	r0, lr, r0, lsl #16
     abc:	2a050000 	bcs	140ac4 <_umb_stack_size+0x13fac4>
     ac0:	dbdc0f05 	blle	ff7046dc <_umb_estack+0xdf6c66e0>
     ac4:	fffe8083 			; <UNDEFINED> instruction: 0xfffe8083
     ac8:	01ffffff 	ldrsheq	pc, [pc, #255]	; bcf <_umb_stack_size-0x431>	; <UNPREDICTABLE>
     acc:	00001fa0 	andeq	r1, r0, r0, lsr #31
     ad0:	9080800f 	addls	r8, r0, pc
     ad4:	001fac40 	andseq	sl, pc, r0, asr #24
     ad8:	00000000 	andeq	r0, r0, r0
     adc:	00218d0c 	eoreq	r8, r1, ip, lsl #26
     ae0:	0001aa00 	andeq	sl, r1, r0, lsl #20
     ae4:	00000208 	andeq	r0, r0, r8, lsl #4
     ae8:	09e20700 	stmibeq	r2!, {r8, r9, sl}^
     aec:	83dbd00f 	bicshi	sp, fp, #15
     af0:	fffffe80 			; <UNDEFINED> instruction: 0xfffffe80
     af4:	9901ffff 	stmdbls	r1, {r0, r1, r2, r3, r4, r5, r6, r7, r8, r9, sl, fp, ip, sp, lr, pc}
     af8:	0f000021 	svceq	0x00000021
     afc:	0021a410 	eoreq	sl, r1, r0, lsl r4
     b00:	80810f00 	addhi	r0, r1, r0, lsl #30
     b04:	21af4098 			; <UNDEFINED> instruction: 0x21af4098
     b08:	aa0a0000 	bge	280b10 <_umb_stack_size+0x27fb10>
     b0c:	02080001 	andeq	r0, r8, #1
     b10:	0e000000 	cdpeq	0, 0, cr0, cr0, cr0, {0}
     b14:	8083dbd0 	ldrdhi	sp, [r3], r0
     b18:	fffffffe 			; <UNDEFINED> instruction: 0xfffffffe
     b1c:	21bb01ff 			; <UNDEFINED> instruction: 0x21bb01ff
     b20:	8a0c0000 	bhi	300b28 <_umb_stack_size+0x2ffb28>
     b24:	aa00001f 	bge	ba8 <_umb_stack_size-0x458>
     b28:	02080001 	andeq	r0, r8, #1
     b2c:	05000000 	streq	r0, [r0, #-0]
     b30:	e00f052a 	and	r0, pc, sl, lsr #10
     b34:	fe8083db 	mcr2	3, 4, r8, cr0, cr11, {6}
     b38:	ffffffff 			; <UNDEFINED> instruction: 0xffffffff
     b3c:	001fa001 	andseq	sl, pc, r1
     b40:	80810f00 	addhi	r0, r1, r0, lsl #30
     b44:	1fac4098 	svcne	0x00ac4098
	...
     b54:	8f0c0000 	svchi	0x000c0000
     b58:	ac000016 	stcge	0, cr0, [r0], {22}
     b5c:	88080001 	stmdahi	r8, {r0}
     b60:	01000000 	mrseq	r0, (UNDEF: 0)
     b64:	ac0a054b 	cfstr32ge	mvfx0, [sl], {75}	; 0x4b
     b68:	88080001 	stmdahi	r8, {r0}
     b6c:	0e000000 	cdpeq	0, 0, cr0, cr0, cr0, {0}
     b70:	80808080 	addhi	r8, r0, r0, lsl #1
     b74:	0016b502 	andseq	fp, r6, r2, lsl #10
     b78:	01ac0a00 			; <UNDEFINED> instruction: 0x01ac0a00
     b7c:	00880800 	addeq	r0, r8, r0, lsl #16
     b80:	800e0000 	andhi	r0, lr, r0
     b84:	02808c80 	addeq	r8, r0, #128, 24	; 0x8000
     b88:	000016c3 	andeq	r1, r0, r3, asr #13
     b8c:	0001ac0a 	andeq	sl, r1, sl, lsl #24
     b90:	00008808 	andeq	r8, r0, r8, lsl #16
     b94:	d1000e00 	tstle	r0, r0, lsl #28
     b98:	0d000016 	stceq	0, cr0, [r0, #-88]	; 0xffffffa8
     b9c:	00001a33 	andeq	r1, r0, r3, lsr sl
     ba0:	080001ac 	stmdaeq	r0, {r2, r3, r5, r7, r8}
     ba4:	00000050 	andeq	r0, r0, r0, asr r0
     ba8:	22011d07 	andcs	r1, r1, #448	; 0x1c0
     bac:	0001ac0a 	andeq	sl, r1, sl, lsl #24
     bb0:	00005008 	andeq	r5, r0, r8
     bb4:	dbd00e00 	blle	ff4043bc <_umb_estack+0xdf3c63c0>
     bb8:	fffe8083 			; <UNDEFINED> instruction: 0xfffe8083
     bbc:	01ffffff 	ldrsheq	pc, [pc, #255]	; cc3 <_umb_stack_size-0x33d>	; <UNPREDICTABLE>
     bc0:	00001a45 	andeq	r1, r0, r5, asr #20
     bc4:	00214a0c 	eoreq	r4, r1, ip, lsl #20
     bc8:	0001ac00 	andeq	sl, r1, r0, lsl #24
     bcc:	00000408 	andeq	r0, r0, r8, lsl #8
     bd0:	1fe90700 	svcne	0x00e90700
     bd4:	83dbd00f 	bicshi	sp, fp, #15
     bd8:	fffffe80 			; <UNDEFINED> instruction: 0xfffffe80
     bdc:	5a01ffff 	bpl	80be0 <_umb_stack_size+0x7fbe0>
     be0:	0f000021 	svceq	0x00000021
     be4:	00216504 	eoreq	r6, r1, r4, lsl #10
     be8:	01ac0a00 			; <UNDEFINED> instruction: 0x01ac0a00
     bec:	00040800 	andeq	r0, r4, r0, lsl #16
     bf0:	d00e0000 	andle	r0, lr, r0
     bf4:	fe8083db 	mcr2	3, 4, r8, cr0, cr11, {6}
     bf8:	ffffffff 			; <UNDEFINED> instruction: 0xffffffff
     bfc:	00217101 	eoreq	r7, r1, r1, lsl #2
     c00:	1f630c00 	svcne	0x00630c00
     c04:	01ac0000 			; <UNDEFINED> instruction: 0x01ac0000
     c08:	00040800 	andeq	r0, r4, r0, lsl #16
     c0c:	24050000 	strcs	r0, [r5], #-0
     c10:	dbd40f11 	blle	ff50485c <_umb_estack+0xdf4c6860>
     c14:	fffe8083 			; <UNDEFINED> instruction: 0xfffe8083
     c18:	01ffffff 	ldrsheq	pc, [pc, #255]	; d1f <_umb_stack_size-0x2e1>	; <UNPREDICTABLE>
     c1c:	00001f7d 	andeq	r1, r0, sp, ror pc
     c20:	0a000000 	beq	c28 <_umb_stack_size-0x3d8>
     c24:	080001b0 	stmdaeq	r0, {r4, r5, r7, r8}
     c28:	0000004c 	andeq	r0, r0, ip, asr #32
     c2c:	000caa10 	andeq	sl, ip, r0, lsl sl
     c30:	001a5f00 	andseq	r5, sl, r0, lsl #30
     c34:	18f51100 	ldmne	r5!, {r8, ip}^
     c38:	07600000 	strbeq	r0, [r0, -r0]!
     c3c:	eb070000 	bl	1c0c44 <_umb_stack_size+0x1bfc44>
     c40:	92120212 	andsls	r0, r2, #536870913	; 0x20000001
     c44:	90000018 	andls	r0, r0, r8, lsl r0
     c48:	04000007 	streq	r0, [r0], #-7
     c4c:	1a0e0351 	bne	381998 <_umb_stack_size+0x380998>
     c50:	00001820 	andeq	r1, r0, r0, lsr #16
     c54:	000007c0 	andeq	r0, r0, r0, asr #15
     c58:	0c02fc04 	stceq	12, cr15, [r2], {4}
     c5c:	d8140000 	ldmdale	r4, {}	; <UNPREDICTABLE>
     c60:	10000007 	andne	r0, r0, r7
     c64:	00000e9d 	muleq	r0, sp, lr
     c68:	00001a6c 	andeq	r1, r0, ip, ror #20
     c6c:	00218d16 	eoreq	r8, r1, r6, lsl sp
     c70:	00080000 	andeq	r0, r8, r0
     c74:	0ded0700 	stcleq	7, cr0, [sp]
     c78:	000e3d15 	andeq	r3, lr, r5, lsl sp
     c7c:	00219900 	eoreq	r9, r1, r0, lsl #18
     c80:	0e051500 	cfsh32eq	mvfx1, mvfx5, #0
     c84:	21a40000 			; <UNDEFINED> instruction: 0x21a40000
     c88:	c9150000 	ldmdbgt	r5, {}	; <UNPREDICTABLE>
     c8c:	af00000d 	svcge	0x0000000d
     c90:	14000021 	strne	r0, [r0], #-33	; 0xffffffdf
     c94:	00000828 	andeq	r0, r0, r8, lsr #16
     c98:	000d2d10 	andeq	r2, sp, r0, lsl sp
     c9c:	0021bb00 	eoreq	fp, r1, r0, lsl #22
     ca0:	1f8a1600 	svcne	0x008a1600
     ca4:	08500000 	ldmdaeq	r0, {}^	; <UNPREDICTABLE>
     ca8:	2a050000 	bcs	140cb0 <_umb_stack_size+0x13fcb0>
     cac:	0ccd1505 	cfstr64eq	mvdx1, [sp], {5}
     cb0:	1fa00000 	svcne	0x00a00000
     cb4:	8d150000 	ldchi	0, cr0, [r5, #-0]
     cb8:	ac00000d 	stcge	0, cr0, [r0], {13}
     cbc:	0000001f 	andeq	r0, r0, pc, lsl r0
     cc0:	4a160000 	bmi	580cc8 <_umb_stack_size+0x57fcc8>
     cc4:	78000021 	stmdavc	r0, {r0, r5}
     cc8:	07000008 	streq	r0, [r0, -r8]
     ccc:	d11511ef 	tstle	r5, pc, ror #3
     cd0:	5a00000f 	bpl	d14 <_umb_stack_size-0x2ec>
     cd4:	15000021 	strne	r0, [r0, #-33]	; 0xffffffdf
     cd8:	00000f99 	muleq	r0, r9, pc	; <UNPREDICTABLE>
     cdc:	00002165 	andeq	r2, r0, r5, ror #2
     ce0:	0008a014 	andeq	sl, r8, r4, lsl r0
     ce4:	0f391000 	svceq	0x00391000
     ce8:	21710000 	cmncs	r1, r0
     cec:	63160000 	tstvs	r6, #0
     cf0:	c800001f 	stmdagt	r0, {r0, r1, r2, r3, r4}
     cf4:	05000008 	streq	r0, [r0, #-8]
     cf8:	d9151124 	ldmdble	r5, {r2, r5, r8, ip}
     cfc:	7d00000e 	stcvc	0, cr0, [r0, #-56]	; 0xffffffc8
     d00:	0000001f 	andeq	r0, r0, pc, lsl r0
     d04:	00000000 	andeq	r0, r0, r0
     d08:	020a0000 	andeq	r0, sl, #0
     d0c:	32080002 	andcc	r0, r8, #2
     d10:	10000000 	andne	r0, r0, r0
     d14:	00001031 	andeq	r1, r0, r1, lsr r0
     d18:	000016df 	ldrdeq	r1, [r0], -pc	; <UNPREDICTABLE>
     d1c:	0002020a 	andeq	r0, r2, sl, lsl #4
     d20:	00003208 	andeq	r3, r0, r8, lsl #4
     d24:	10441000 	subne	r1, r4, r0
     d28:	16ed0000 	strbtne	r0, [sp], r0
     d2c:	970d0000 	strls	r0, [sp, -r0]
     d30:	0200001a 	andeq	r0, r0, #26
     d34:	32080002 	andcc	r0, r8, #2
     d38:	07000000 	streq	r0, [r0, -r0]
     d3c:	0a0d0126 	beq	3411dc <_umb_stack_size+0x3401dc>
     d40:	08000202 	stmdaeq	r0, {r1, r9}
     d44:	00000032 	andeq	r0, r0, r2, lsr r0
     d48:	00109710 	andseq	r9, r0, r0, lsl r7
     d4c:	001ab400 	andseq	fp, sl, r0, lsl #8
     d50:	02020a00 	andeq	r0, r2, #0, 20
     d54:	00320800 	eorseq	r0, r2, r0, lsl #16
     d58:	b5100000 	ldrlt	r0, [r0, #-0]
     d5c:	c1000010 	tstgt	r0, r0, lsl r0
     d60:	0c00001a 	stceq	0, cr0, [r0], {26}
     d64:	0000218d 	andeq	r2, r0, sp, lsl #3
     d68:	08000204 	stmdaeq	r0, {r2, r9}
     d6c:	00000012 	andeq	r0, r0, r2, lsl r0
     d70:	0f09e007 	svceq	0x0009e007
     d74:	8083dbd0 	ldrdhi	sp, [r3], r0
     d78:	fffffffe 			; <UNDEFINED> instruction: 0xfffffffe
     d7c:	219901ff 			; <UNDEFINED> instruction: 0x219901ff
     d80:	080f0000 	stmdaeq	pc, {}	; <UNPREDICTABLE>
     d84:	000021a4 	andeq	r2, r0, r4, lsr #3
     d88:	0010ce15 	andseq	ip, r0, r5, lsl lr
     d8c:	0021af00 	eoreq	sl, r1, r0, lsl #30
     d90:	02040a00 	andeq	r0, r4, #0, 20
     d94:	00120800 	andseq	r0, r2, r0, lsl #16
     d98:	d00e0000 	andle	r0, lr, r0
     d9c:	fe8083db 	mcr2	3, 4, r8, cr0, cr11, {6}
     da0:	ffffffff 			; <UNDEFINED> instruction: 0xffffffff
     da4:	0021bb01 	eoreq	fp, r1, r1, lsl #22
     da8:	1f8a0c00 	svcne	0x008a0c00
     dac:	02040000 	andeq	r0, r4, #0
     db0:	00120800 	andseq	r0, r2, r0, lsl #16
     db4:	2a050000 	bcs	140dbc <_umb_stack_size+0x13fdbc>
     db8:	dbd80f05 	blle	ff6049d4 <_umb_estack+0xdf5c69d8>
     dbc:	fffe8083 			; <UNDEFINED> instruction: 0xfffe8083
     dc0:	01ffffff 	ldrsheq	pc, [pc, #255]	; ec7 <_umb_stack_size-0x139>	; <UNPREDICTABLE>
     dc4:	00001fa0 	andeq	r1, r0, r0, lsr #31
     dc8:	0010e115 	andseq	lr, r0, r5, lsl r1
     dcc:	001fac00 	andseq	sl, pc, r0, lsl #24
     dd0:	00000000 	andeq	r0, r0, r0
     dd4:	00218d0c 	eoreq	r8, r1, ip, lsl #26
     dd8:	00021600 	andeq	r1, r2, r0, lsl #12
     ddc:	00000408 	andeq	r0, r0, r8, lsl #8
     de0:	09e10700 	stmibeq	r1!, {r8, r9, sl}^
     de4:	83dbd00f 	bicshi	sp, fp, #15
     de8:	fffffe80 			; <UNDEFINED> instruction: 0xfffffe80
     dec:	9901ffff 	stmdbls	r1, {r0, r1, r2, r3, r4, r5, r6, r7, r8, r9, sl, fp, ip, sp, lr, pc}
     df0:	0f000021 	svceq	0x00000021
     df4:	0021a40c 	eoreq	sl, r1, ip, lsl #8
     df8:	80800f00 	addhi	r0, r0, r0, lsl #30
     dfc:	af028080 	svcge	0x00028080
     e00:	0a000021 	beq	e8c <_umb_stack_size-0x174>
     e04:	08000216 	stmdaeq	r0, {r1, r2, r4, r9}
     e08:	00000004 	andeq	r0, r0, r4
     e0c:	83dbd00e 	bicshi	sp, fp, #14
     e10:	fffffe80 			; <UNDEFINED> instruction: 0xfffffe80
     e14:	bb01ffff 	bllt	80e18 <_umb_stack_size+0x7fe18>
     e18:	0c000021 	stceq	0, cr0, [r0], {33}	; 0x21
     e1c:	00001f8a 	andeq	r1, r0, sl, lsl #31
     e20:	08000216 	stmdaeq	r0, {r1, r2, r4, r9}
     e24:	00000004 	andeq	r0, r0, r4
     e28:	0f052a05 	svceq	0x00052a05
     e2c:	8083dbdc 	ldrdhi	sp, [r3], ip
     e30:	fffffffe 			; <UNDEFINED> instruction: 0xfffffffe
     e34:	1fa001ff 	svcne	0x00a001ff
     e38:	800f0000 	andhi	r0, pc, r0
     e3c:	02808080 	addeq	r8, r0, #128	; 0x80
     e40:	00001fac 	andeq	r1, r0, ip, lsr #31
     e44:	0c000000 	stceq	0, cr0, [r0], {-0}
     e48:	0000218d 	andeq	r2, r0, sp, lsl #3
     e4c:	0800021a 	stmdaeq	r0, {r1, r3, r4, r9}
     e50:	0000001a 	andeq	r0, r0, sl, lsl r0
     e54:	0f09e207 	svceq	0x0009e207
     e58:	8083dbd0 	ldrdhi	sp, [r3], r0
     e5c:	fffffffe 			; <UNDEFINED> instruction: 0xfffffffe
     e60:	219901ff 			; <UNDEFINED> instruction: 0x219901ff
     e64:	100f0000 	andne	r0, pc, r0
     e68:	000021a4 	andeq	r2, r0, r4, lsr #3
     e6c:	8c80810f 	stfhid	f0, [r0], {15}
     e70:	21af0280 			; <UNDEFINED> instruction: 0x21af0280
     e74:	1a0a0000 	bne	280e7c <_umb_stack_size+0x27fe7c>
     e78:	1a080002 	bne	200e88 <_umb_stack_size+0x1ffe88>
     e7c:	0e000000 	cdpeq	0, 0, cr0, cr0, cr0, {0}
     e80:	8083dbd0 	ldrdhi	sp, [r3], r0
     e84:	fffffffe 			; <UNDEFINED> instruction: 0xfffffffe
     e88:	21bb01ff 			; <UNDEFINED> instruction: 0x21bb01ff
     e8c:	8a0c0000 	bhi	300e94 <_umb_stack_size+0x2ffe94>
     e90:	1a00001f 	bne	f14 <_umb_stack_size-0xec>
     e94:	1a080002 	bne	200ea4 <_umb_stack_size+0x1ffea4>
     e98:	05000000 	streq	r0, [r0, #-0]
     e9c:	e00f052a 	and	r0, pc, sl, lsr #10
     ea0:	fe8083db 	mcr2	3, 4, r8, cr0, cr11, {6}
     ea4:	ffffffff 			; <UNDEFINED> instruction: 0xffffffff
     ea8:	001fa001 	andseq	sl, pc, r1
     eac:	80810f00 	addhi	r0, r1, r0, lsl #30
     eb0:	ac02808c 	stcge	0, cr8, [r2], {140}	; 0x8c
     eb4:	0000001f 	andeq	r0, r0, pc, lsl r0
	...
     ec0:	0c000000 	stceq	0, cr0, [r0], {-0}
     ec4:	00001ce7 	andeq	r1, r0, r7, ror #25
     ec8:	08000234 	stmdaeq	r0, {r2, r4, r5, r9}
     ecc:	0000007e 	andeq	r0, r0, lr, ror r0
     ed0:	0a055d01 	beq	1582dc <_umb_stack_size+0x1572dc>
     ed4:	08000234 	stmdaeq	r0, {r2, r4, r5, r9}
     ed8:	0000007e 	andeq	r0, r0, lr, ror r0
     edc:	8080800e 	addhi	r8, r0, lr
     ee0:	1d0a0280 	sfmne	f0, 4, [sl, #-512]	; 0xfffffe00
     ee4:	340a0000 	strcc	r0, [sl], #-0
     ee8:	7e080002 	cdpvc	0, 0, cr0, cr8, cr2, {0}
     eec:	1b000000 	blne	ef4 <_umb_stack_size-0x10c>
     ef0:	808c8080 	addhi	r8, ip, r0, lsl #1
     ef4:	001d1702 	andseq	r1, sp, r2, lsl #14
     ef8:	02340a00 	eorseq	r0, r4, #0, 20
     efc:	007e0800 	rsbseq	r0, lr, r0, lsl #16
     f00:	801b0000 	andshi	r0, fp, r0
     f04:	02808c80 	addeq	r8, r0, #128, 24	; 0x8000
     f08:	00001d24 	andeq	r1, r0, r4, lsr #26
     f0c:	0002340a 	andeq	r3, r2, sl, lsl #8
     f10:	00007e08 	andeq	r7, r0, r8, lsl #28
     f14:	80800e00 	addhi	r0, r0, r0, lsl #28
     f18:	31028090 	swpcc	r8, r0, [r2]
     f1c:	0a00001d 	beq	f98 <_umb_stack_size-0x68>
     f20:	08000234 	stmdaeq	r0, {r2, r4, r5, r9}
     f24:	0000007e 	andeq	r0, r0, lr, ror r0
     f28:	3e590117 	mrccc	1, 2, r0, cr9, cr7, {0}
     f2c:	0a00001d 	beq	fa8 <_umb_stack_size-0x58>
     f30:	08000234 	stmdaeq	r0, {r2, r4, r5, r9}
     f34:	0000007e 	andeq	r0, r0, lr, ror r0
     f38:	1d4b000e 	stclne	0, cr0, [fp, #-56]	; 0xffffffc8
     f3c:	340a0000 	strcc	r0, [sl], #-0
     f40:	7e080002 	cdpvc	0, 0, cr0, cr8, cr2, {0}
     f44:	0e000000 	cdpeq	0, 0, cr0, cr0, cr0, {0}
     f48:	001d5801 	andseq	r5, sp, r1, lsl #16
     f4c:	02340a00 	eorseq	r0, r4, #0, 20
     f50:	007e0800 	rsbseq	r0, lr, r0, lsl #16
     f54:	800e0000 	andhi	r0, lr, r0
     f58:	001d6506 	andseq	r6, sp, r6, lsl #10
     f5c:	02340a00 	eorseq	r0, r4, #0, 20
     f60:	007e0800 	rsbseq	r0, lr, r0, lsl #16
     f64:	f4100000 			; <UNDEFINED> instruction: 0xf4100000
     f68:	72000010 	andvc	r0, r0, #16
     f6c:	1100001d 	tstne	r0, sp, lsl r0
     f70:	00001c02 	andeq	r1, r0, r2, lsl #24
     f74:	000008f0 	strdeq	r0, [r0], -r0	; <UNPREDICTABLE>
     f78:	0217db08 	andseq	sp, r7, #8, 22	; 0x2000
     f7c:	001bc612 	andseq	ip, fp, r2, lsl r6
     f80:	00090800 	andeq	r0, r9, r0, lsl #16
     f84:	03510400 	cmpeq	r1, #0, 8
     f88:	1b990d0e 	blne	fe6443c8 <_umb_estack+0xde6063cc>
     f8c:	02340000 	eorseq	r0, r4, #0
     f90:	00040800 	andeq	r0, r4, r0, lsl #16
     f94:	ff040000 			; <UNDEFINED> instruction: 0xff040000
     f98:	5e1c2302 	cdppl	3, 1, cr2, cr12, cr2, {0}
     f9c:	3400001b 	strcc	r0, [r0], #-27	; 0xffffffe5
     fa0:	04080002 	streq	r0, [r8], #-2
     fa4:	04000000 	streq	r0, [r0], #-0
     fa8:	00001ccd 	andeq	r1, r0, sp, asr #25
     fac:	09201400 	stmdbeq	r0!, {sl, ip}
     fb0:	33100000 	tstcc	r0, #0
     fb4:	7f000011 	svcvc	0x00000011
     fb8:	1600001d 			; <UNDEFINED> instruction: 0x1600001d
     fbc:	00001e3a 	andeq	r1, r0, sl, lsr lr
     fc0:	00000938 	andeq	r0, r0, r8, lsr r9
     fc4:	0f11f208 	svceq	0x0011f208
     fc8:	001e6c00 	andseq	r6, lr, r0, lsl #24
     fcc:	09601400 	stmdbeq	r0!, {sl, ip}^
     fd0:	800e0000 	andhi	r0, lr, r0
     fd4:	04808cc8 	streq	r8, [r0], #3272	; 0xcc8
     fd8:	00001e78 	andeq	r1, r0, r8, ror lr
     fdc:	00098814 	andeq	r8, r9, r4, lsl r8
     fe0:	11461000 	mrsne	r1, (UNDEF: 70)
     fe4:	1e850000 	cdpne	0, 8, cr0, cr5, cr0, {0}
     fe8:	6e0a0000 	cdpvs	0, 0, cr0, cr10, cr0, {0}
     fec:	44080002 	strmi	r0, [r8], #-2
     ff0:	17000000 	strne	r0, [r0, -r0]
     ff4:	1e925201 	cdpne	2, 9, cr5, cr2, cr1, {0}
     ff8:	050c0000 	streq	r0, [ip, #-0]
     ffc:	6e000022 	cdpvs	0, 0, cr0, cr0, cr2, {1}
    1000:	44080002 	strmi	r0, [r8], #-2
    1004:	08000000 	stmdaeq	r0, {}	; <UNPREDICTABLE>
    1008:	800f0da0 	andhi	r0, pc, r0, lsr #27
    100c:	04808cc8 	streq	r8, [r0], #3272	; 0xcc8
    1010:	00002211 	andeq	r2, r0, r1, lsl r2
    1014:	273e800f 	ldrcs	r8, [lr, -pc]!
    1018:	18000022 	stmdane	r0, {r1, r5}
    101c:	22325201 	eorscs	r5, r2, #268435456	; 0x10000000
    1020:	6e0a0000 	cdpvs	0, 0, cr0, cr10, cr0, {0}
    1024:	44080002 	strmi	r0, [r8], #-2
    1028:	0e000000 	cdpeq	0, 0, cr0, cr0, cr0, {0}
    102c:	00223e1f 	eoreq	r3, r2, pc, lsl lr
    1030:	026e0a00 	rsbeq	r0, lr, #0, 20
    1034:	00440800 	subeq	r0, r4, r0, lsl #16
    1038:	08170000 	ldmdaeq	r7, {}	; <UNPREDICTABLE>
    103c:	103e8010 	eorsne	r8, lr, r0, lsl r0
    1040:	9f1a01ff 	svcls	0x001a01ff
    1044:	0000224b 	andeq	r2, r0, fp, asr #4
    1048:	00026e0a 	andeq	r6, r2, sl, lsl #28
    104c:	00004408 	andeq	r4, r0, r8, lsl #8
    1050:	11591000 	cmpne	r9, r0
    1054:	22580000 	subscs	r0, r8, #0
    1058:	b0140000 	andslt	r0, r4, r0
    105c:	10000009 	andne	r0, r0, r9
    1060:	000011b1 			; <UNDEFINED> instruction: 0x000011b1
    1064:	00002265 	andeq	r2, r0, r5, ror #4
    1068:	0009d014 	andeq	sp, r9, r4, lsl r0
    106c:	11f11000 	mvnsne	r1, r0
    1070:	22720000 	rsbscs	r0, r2, #0
    1074:	c9160000 	ldmdbgt	r6, {}	; <UNPREDICTABLE>
    1078:	f8000021 			; <UNDEFINED> instruction: 0xf8000021
    107c:	05000009 	streq	r0, [r0, #-9]
    1080:	800f0d4c 	andhi	r0, pc, ip, asr #26
    1084:	04808cc8 	streq	r8, [r0], #3272	; 0xcc8
    1088:	000021d5 	ldrdeq	r2, [r0], -r5
    108c:	e0530118 	subs	r0, r3, r8, lsl r1
    1090:	15000021 	strne	r0, [r0, #-33]	; 0xffffffdf
    1094:	00001233 	andeq	r1, r0, r3, lsr r2
    1098:	000021eb 	andeq	r2, r0, fp, ror #3
    109c:	00214a16 	eoreq	r4, r1, r6, lsl sl
    10a0:	000a2000 	andeq	r2, sl, r0
    10a4:	13330500 	teqne	r3, #0, 10
    10a8:	8cc8800f 	stclhi	0, cr8, [r8], {15}
    10ac:	215a0480 	cmpcs	sl, r0, lsl #9
    10b0:	01180000 	tsteq	r8, r0
    10b4:	00216553 	eoreq	r6, r1, r3, asr r5
    10b8:	0a481400 	beq	12060c0 <_umb_stack_size+0x12050c0>
    10bc:	800e0000 	andhi	r0, lr, r0
    10c0:	04808cc8 	streq	r8, [r0], #3272	; 0xcc8
    10c4:	00002171 	andeq	r2, r0, r1, ror r1
    10c8:	001f6316 	andseq	r6, pc, r6, lsl r3	; <UNPREDICTABLE>
    10cc:	000a7000 	andeq	r7, sl, r0
    10d0:	11240500 			; <UNDEFINED> instruction: 0x11240500
    10d4:	00730618 	rsbseq	r0, r3, r8, lsl r6
    10d8:	9f220071 	svcls	0x00220071
    10dc:	00001f7d 	andeq	r1, r0, sp, ror pc
    10e0:	14000000 	strne	r0, [r0], #-0
    10e4:	00000a98 	muleq	r0, r8, sl
    10e8:	00127510 	andseq	r7, r2, r0, lsl r5
    10ec:	0021f700 	eoreq	pc, r1, r0, lsl #14
    10f0:	218d1600 	orrcs	r1, sp, r0, lsl #12
    10f4:	0ac00000 	beq	ff0010fc <_umb_estack+0xdefc3100>
    10f8:	34050000 	strcc	r0, [r5], #-0
    10fc:	c8800f05 	stmgt	r0, {r0, r2, r8, r9, sl, fp}
    1100:	9904808c 	stmdbls	r4, {r2, r3, r7, pc}
    1104:	18000021 	stmdane	r0, {r0, r5}
    1108:	21a45301 			; <UNDEFINED> instruction: 0x21a45301
    110c:	dd150000 	ldcle	0, cr0, [r5, #-0]
    1110:	af000012 	svcge	0x00000012
    1114:	14000021 	strne	r0, [r0], #-33	; 0xffffffdf
    1118:	00000ae8 	andeq	r0, r0, r8, ror #21
    111c:	8cc8800e 	stclhi	0, cr8, [r8], {14}
    1120:	21bb0480 			; <UNDEFINED> instruction: 0x21bb0480
    1124:	8a160000 	bhi	58112c <_umb_stack_size+0x58012c>
    1128:	1000001f 	andne	r0, r0, pc, lsl r0
    112c:	0500000b 	streq	r0, [r0, #-11]
    1130:	0618052a 	ldreq	r0, [r8], -sl, lsr #10
    1134:	00710073 	rsbseq	r0, r1, r3, ror r0
    1138:	1fa09f22 	svcne	0x00a09f22
    113c:	a9150000 	ldmdbge	r5, {}	; <UNPREDICTABLE>
    1140:	ac000012 	stcge	0, cr0, [r0], {18}
    1144:	0000001f 	andeq	r0, r0, pc, lsl r0
    1148:	00000000 	andeq	r0, r0, r0
    114c:	3b110000 	blcc	441154 <_umb_stack_size+0x440154>
    1150:	38000020 	stmdacc	r0, {r5}
    1154:	0500000b 	streq	r0, [r0, #-11]
    1158:	12021649 	andne	r1, r2, #76546048	; 0x4900000
    115c:	00001fff 	strdeq	r1, [r0], -pc	; <UNPREDICTABLE>
    1160:	00000b50 	andeq	r0, r0, r0, asr fp
    1164:	0e035104 	adfeqs	f5, f3, f4
    1168:	0002ae0a 	andeq	sl, r2, sl, lsl #28
    116c:	00000208 	andeq	r0, r0, r8, lsl #4
    1170:	76051700 	strvc	r1, [r5], -r0, lsl #14
    1174:	9f213300 	svcls	0x00213300
    1178:	00002026 	andeq	r2, r0, r6, lsr #32
    117c:	0020680d 	eoreq	r6, r0, sp, lsl #16
    1180:	0002ae00 	andeq	sl, r2, r0, lsl #28
    1184:	00000208 	andeq	r0, r0, r8, lsl #4
    1188:	02ff0400 	rscseq	r0, pc, #0, 8
    118c:	76051823 	strvc	r1, [r5], -r3, lsr #16
    1190:	9f213300 	svcls	0x00213300
    1194:	00002078 	andeq	r2, r0, r8, ror r0
    1198:	2083010f 	addcs	r0, r3, pc, lsl #2
    119c:	040c0000 	streq	r0, [ip], #-0
    11a0:	ae000021 	cdpge	0, 0, cr0, cr0, cr1, {1}
    11a4:	02080002 	andeq	r0, r8, #2
    11a8:	04000000 	streq	r0, [r0], #-0
    11ac:	05181ccd 	ldreq	r1, [r8, #-3277]	; 0xfffff333
    11b0:	21330076 	teqcs	r3, r6, ror r0
    11b4:	0021159f 	mlaeq	r1, pc, r5, r1	; <UNPREDICTABLE>
    11b8:	21010f00 	tstcs	r1, r0, lsl #30
    11bc:	00000021 	andeq	r0, r0, r1, lsr #32
	...
    11d4:	0c000000 	stceq	0, cr0, [r0], {-0}
    11d8:	0000168f 	andeq	r1, r0, pc, lsl #13
    11dc:	080002c0 	stmdaeq	r0, {r6, r7, r9}
    11e0:	00000068 	andeq	r0, r0, r8, rrx
    11e4:	0a056601 	beq	15a9f0 <_umb_stack_size+0x1599f0>
    11e8:	080002c0 	stmdaeq	r0, {r6, r7, r9}
    11ec:	00000068 	andeq	r0, r0, r8, rrx
    11f0:	8c80800e 	stchi	0, cr8, [r0], {14}
    11f4:	0016b540 	andseq	fp, r6, r0, asr #10
    11f8:	02c00a00 	sbceq	r0, r0, #0, 20
    11fc:	00680800 	rsbeq	r0, r8, r0, lsl #16
    1200:	800e0000 	andhi	r0, lr, r0
    1204:	c3409080 	movtgt	r9, #128	; 0x80
    1208:	0a000016 	beq	1268 <_umb_stack_size+0x268>
    120c:	080002c0 	stmdaeq	r0, {r6, r7, r9}
    1210:	00000068 	andeq	r0, r0, r8, rrx
    1214:	16d1020e 	ldrbne	r0, [r1], lr, lsl #4
    1218:	330d0000 	movwcc	r0, #53248	; 0xd000
    121c:	c000001a 	andgt	r0, r0, sl, lsl r0
    1220:	50080002 	andpl	r0, r8, r2
    1224:	07000000 	streq	r0, [r0, -r0]
    1228:	0a22011d 	beq	8816a4 <_umb_stack_size+0x8806a4>
    122c:	080002c0 	stmdaeq	r0, {r6, r7, r9}
    1230:	00000050 	andeq	r0, r0, r0, asr r0
    1234:	83dbd00e 	bicshi	sp, fp, #14
    1238:	fffffe80 			; <UNDEFINED> instruction: 0xfffffe80
    123c:	4501ffff 	strmi	pc, [r1, #-4095]	; 0xfffff001
    1240:	0c00001a 	stceq	0, cr0, [r0], {26}
    1244:	0000214a 	andeq	r2, r0, sl, asr #2
    1248:	080002c0 	stmdaeq	r0, {r6, r7, r9}
    124c:	00000004 	andeq	r0, r0, r4
    1250:	0f1fe907 	svceq	0x001fe907
    1254:	8083dbd0 	ldrdhi	sp, [r3], r0
    1258:	fffffffe 			; <UNDEFINED> instruction: 0xfffffffe
    125c:	215a01ff 	ldrshcs	r0, [sl, #-31]	; 0xffffffe1
    1260:	040f0000 	streq	r0, [pc], #-0	; 1268 <_umb_stack_size+0x268>
    1264:	00002165 	andeq	r2, r0, r5, ror #2
    1268:	0002c00a 	andeq	ip, r2, sl
    126c:	00000408 	andeq	r0, r0, r8, lsl #8
    1270:	dbd00e00 	blle	ff404a78 <_umb_estack+0xdf3c6a7c>
    1274:	fffe8083 			; <UNDEFINED> instruction: 0xfffe8083
    1278:	01ffffff 	ldrsheq	pc, [pc, #255]	; 137f <_umb_stack_size+0x37f>	; <UNPREDICTABLE>
    127c:	00002171 	andeq	r2, r0, r1, ror r1
    1280:	001f630c 	andseq	r6, pc, ip, lsl #6
    1284:	0002c000 	andeq	ip, r2, r0
    1288:	00000408 	andeq	r0, r0, r8, lsl #8
    128c:	11240500 			; <UNDEFINED> instruction: 0x11240500
    1290:	83dbd40f 	bicshi	sp, fp, #251658240	; 0xf000000
    1294:	fffffe80 			; <UNDEFINED> instruction: 0xfffffe80
    1298:	7d01ffff 	stcvc	15, cr15, [r1, #-1020]	; 0xfffffc04
    129c:	0000001f 	andeq	r0, r0, pc, lsl r0
    12a0:	c40a0000 	strgt	r0, [sl], #-0
    12a4:	4c080002 	stcmi	0, cr0, [r8], {2}
    12a8:	10000000 	andne	r0, r0, r0
    12ac:	00001311 	andeq	r1, r0, r1, lsl r3
    12b0:	00001a5f 	andeq	r1, r0, pc, asr sl
    12b4:	0018f511 	andseq	pc, r8, r1, lsl r5	; <UNPREDICTABLE>
    12b8:	000b6800 	andeq	r6, fp, r0, lsl #16
    12bc:	12eb0700 	rscne	r0, fp, #0, 14
    12c0:	18921202 	ldmne	r2, {r1, r9, ip}
    12c4:	0b980000 	bleq	fe6012cc <_umb_estack+0xde5c32d0>
    12c8:	51040000 	mrspl	r0, (UNDEF: 4)
    12cc:	201a0e03 	andscs	r0, sl, r3, lsl #28
    12d0:	c8000018 	stmdagt	r0, {r3, r4}
    12d4:	0400000b 	streq	r0, [r0], #-11
    12d8:	000c02fc 	strdeq	r0, [ip], -ip
    12dc:	0be01400 	bleq	ff8062e4 <_umb_estack+0xdf7c82e8>
    12e0:	04100000 	ldreq	r0, [r0], #-0
    12e4:	6c000015 	stcvs	0, cr0, [r0], {21}
    12e8:	1600001a 			; <UNDEFINED> instruction: 0x1600001a
    12ec:	0000218d 	andeq	r2, r0, sp, lsl #3
    12f0:	00000c08 	andeq	r0, r0, r8, lsl #24
    12f4:	150ded07 	strne	lr, [sp, #-3335]	; 0xfffff2f9
    12f8:	000014a4 	andeq	r1, r0, r4, lsr #9
    12fc:	00002199 	muleq	r0, r9, r1
    1300:	00146c15 	andseq	r6, r4, r5, lsl ip
    1304:	0021a400 	eoreq	sl, r1, r0, lsl #8
    1308:	14301500 	ldrtne	r1, [r0], #-1280	; 0xfffffb00
    130c:	21af0000 			; <UNDEFINED> instruction: 0x21af0000
    1310:	30140000 	andscc	r0, r4, r0
    1314:	1000000c 	andne	r0, r0, ip
    1318:	00001394 	muleq	r0, r4, r3
    131c:	000021bb 			; <UNDEFINED> instruction: 0x000021bb
    1320:	001f8a16 	andseq	r8, pc, r6, lsl sl	; <UNPREDICTABLE>
    1324:	000c5800 	andeq	r5, ip, r0, lsl #16
    1328:	052a0500 	streq	r0, [sl, #-1280]!	; 0xfffffb00
    132c:	00133415 	andseq	r3, r3, r5, lsl r4
    1330:	001fa000 	andseq	sl, pc, r0
    1334:	13f41500 	mvnsne	r1, #0, 10
    1338:	1fac0000 	svcne	0x00ac0000
    133c:	00000000 	andeq	r0, r0, r0
    1340:	214a1600 	cmpcs	sl, r0, lsl #12
    1344:	0c800000 	stceq	0, cr0, [r0], {0}
    1348:	ef070000 	svc	0x00070000
    134c:	16381511 			; <UNDEFINED> instruction: 0x16381511
    1350:	215a0000 	cmpcs	sl, r0
    1354:	00150000 	andseq	r0, r5, r0
    1358:	65000016 	strvs	r0, [r0, #-22]	; 0xffffffea
    135c:	14000021 	strne	r0, [r0], #-33	; 0xffffffdf
    1360:	00000ca8 	andeq	r0, r0, r8, lsr #25
    1364:	0015a010 	andseq	sl, r5, r0, lsl r0
    1368:	00217100 	eoreq	r7, r1, r0, lsl #2
    136c:	1f631600 	svcne	0x00631600
    1370:	0cd00000 	ldcleq	0, cr0, [r0], {0}
    1374:	24050000 	strcs	r0, [r5], #-0
    1378:	15401511 	strbne	r1, [r0, #-1297]	; 0xfffffaef
    137c:	1f7d0000 	svcne	0x007d0000
	...
    1388:	03160a00 	tsteq	r6, #0, 20
    138c:	00120800 	andseq	r0, r2, r0, lsl #16
    1390:	98100000 	ldmdals	r0, {}	; <UNPREDICTABLE>
    1394:	df000016 	svcle	0x00000016
    1398:	0a000016 	beq	13f8 <_umb_stack_size+0x3f8>
    139c:	08000316 	stmdaeq	r0, {r1, r2, r4, r8, r9}
    13a0:	00000012 	andeq	r0, r0, r2, lsl r0
    13a4:	0016ab10 	andseq	sl, r6, r0, lsl fp
    13a8:	0016ed00 	andseq	lr, r6, r0, lsl #26
    13ac:	1a970d00 	bne	fe5c47b4 <_umb_estack+0xde5867b8>
    13b0:	03160000 	tsteq	r6, #0
    13b4:	00120800 	andseq	r0, r2, r0, lsl #16
    13b8:	26070000 	strcs	r0, [r7], -r0
    13bc:	160a0d01 	strne	r0, [sl], -r1, lsl #26
    13c0:	12080003 	andne	r0, r8, #3
    13c4:	10000000 	andne	r0, r0, r0
    13c8:	000016fa 	strdeq	r1, [r0], -sl
    13cc:	00001ab4 			; <UNDEFINED> instruction: 0x00001ab4
    13d0:	0003160a 	andeq	r1, r3, sl, lsl #12
    13d4:	00001208 	andeq	r1, r0, r8, lsl #4
    13d8:	17181000 	ldrne	r1, [r8, -r0]
    13dc:	1ac10000 	bne	ff0413e4 <_umb_estack+0xdf0033e8>
    13e0:	8d0c0000 	stchi	0, cr0, [ip, #-0]
    13e4:	18000021 	stmdane	r0, {r0, r5}
    13e8:	0a080003 	beq	2013fc <_umb_stack_size+0x2003fc>
    13ec:	07000000 	streq	r0, [r0, -r0]
    13f0:	d00f09e0 	andle	r0, pc, r0, ror #19
    13f4:	fe8083db 	mcr2	3, 4, r8, cr0, cr11, {6}
    13f8:	ffffffff 			; <UNDEFINED> instruction: 0xffffffff
    13fc:	00219901 	eoreq	r9, r1, r1, lsl #18
    1400:	a4080f00 	strge	r0, [r8], #-3840	; 0xfffff100
    1404:	15000021 	strne	r0, [r0, #-33]	; 0xffffffdf
    1408:	00001730 	andeq	r1, r0, r0, lsr r7
    140c:	000021af 	andeq	r2, r0, pc, lsr #3
    1410:	0003180a 	andeq	r1, r3, sl, lsl #16
    1414:	00000a08 	andeq	r0, r0, r8, lsl #20
    1418:	dbd00e00 	blle	ff404c20 <_umb_estack+0xdf3c6c24>
    141c:	fffe8083 			; <UNDEFINED> instruction: 0xfffe8083
    1420:	01ffffff 	ldrsheq	pc, [pc, #255]	; 1527 <_umb_stack_size+0x527>	; <UNPREDICTABLE>
    1424:	000021bb 			; <UNDEFINED> instruction: 0x000021bb
    1428:	001f8a0c 	andseq	r8, pc, ip, lsl #20
    142c:	00031800 	andeq	r1, r3, r0, lsl #16
    1430:	00000a08 	andeq	r0, r0, r8, lsl #20
    1434:	052a0500 	streq	r0, [sl, #-1280]!	; 0xfffffb00
    1438:	83dbd80f 	bicshi	sp, fp, #983040	; 0xf0000
    143c:	fffffe80 			; <UNDEFINED> instruction: 0xfffffe80
    1440:	a001ffff 	strdge	pc, [r1], -pc	; <UNPREDICTABLE>
    1444:	1500001f 	strne	r0, [r0, #-31]	; 0xffffffe1
    1448:	00001743 	andeq	r1, r0, r3, asr #14
    144c:	00001fac 	andeq	r1, r0, ip, lsr #31
    1450:	0c000000 	stceq	0, cr0, [r0], {-0}
    1454:	0000218d 	andeq	r2, r0, sp, lsl #3
    1458:	08000322 	stmdaeq	r0, {r1, r5, r8, r9}
    145c:	00000004 	andeq	r0, r0, r4
    1460:	0f09e107 	svceq	0x0009e107
    1464:	8083dbd0 	ldrdhi	sp, [r3], r0
    1468:	fffffffe 			; <UNDEFINED> instruction: 0xfffffffe
    146c:	219901ff 			; <UNDEFINED> instruction: 0x219901ff
    1470:	0c0f0000 	stceq	0, cr0, [pc], {-0}
    1474:	000021a4 	andeq	r2, r0, r4, lsr #3
    1478:	8c80800f 	stchi	0, cr8, [r0], {15}
    147c:	0021af40 	eoreq	sl, r1, r0, asr #30
    1480:	03220a00 			; <UNDEFINED> instruction: 0x03220a00
    1484:	00040800 	andeq	r0, r4, r0, lsl #16
    1488:	d00e0000 	andle	r0, lr, r0
    148c:	fe8083db 	mcr2	3, 4, r8, cr0, cr11, {6}
    1490:	ffffffff 			; <UNDEFINED> instruction: 0xffffffff
    1494:	0021bb01 	eoreq	fp, r1, r1, lsl #22
    1498:	1f8a0c00 	svcne	0x008a0c00
    149c:	03220000 			; <UNDEFINED> instruction: 0x03220000
    14a0:	00040800 	andeq	r0, r4, r0, lsl #16
    14a4:	2a050000 	bcs	1414ac <_umb_stack_size+0x1404ac>
    14a8:	dbdc0f05 	blle	ff7050c4 <_umb_estack+0xdf6c70c8>
    14ac:	fffe8083 			; <UNDEFINED> instruction: 0xfffe8083
    14b0:	01ffffff 	ldrsheq	pc, [pc, #255]	; 15b7 <_umb_stack_size+0x5b7>	; <UNPREDICTABLE>
    14b4:	00001fa0 	andeq	r1, r0, r0, lsr #31
    14b8:	8c80800f 	stchi	0, cr8, [r0], {15}
    14bc:	001fac40 	andseq	sl, pc, r0, asr #24
    14c0:	00000000 	andeq	r0, r0, r0
    14c4:	00218d0c 	eoreq	r8, r1, ip, lsl #26
    14c8:	00032600 	andeq	r2, r3, r0, lsl #12
    14cc:	00000208 	andeq	r0, r0, r8, lsl #4
    14d0:	09e20700 	stmibeq	r2!, {r8, r9, sl}^
    14d4:	83dbd00f 	bicshi	sp, fp, #15
    14d8:	fffffe80 			; <UNDEFINED> instruction: 0xfffffe80
    14dc:	9901ffff 	stmdbls	r1, {r0, r1, r2, r3, r4, r5, r6, r7, r8, r9, sl, fp, ip, sp, lr, pc}
    14e0:	0f000021 	svceq	0x00000021
    14e4:	0021a410 	eoreq	sl, r1, r0, lsl r4
    14e8:	80830f00 	addhi	r0, r3, r0, lsl #30
    14ec:	21af4090 			; <UNDEFINED> instruction: 0x21af4090
    14f0:	260a0000 	strcs	r0, [sl], -r0
    14f4:	02080003 	andeq	r0, r8, #3
    14f8:	0e000000 	cdpeq	0, 0, cr0, cr0, cr0, {0}
    14fc:	8083dbd0 	ldrdhi	sp, [r3], r0
    1500:	fffffffe 			; <UNDEFINED> instruction: 0xfffffffe
    1504:	21bb01ff 			; <UNDEFINED> instruction: 0x21bb01ff
    1508:	8a0c0000 	bhi	301510 <_umb_stack_size+0x300510>
    150c:	2600001f 			; <UNDEFINED> instruction: 0x2600001f
    1510:	02080003 	andeq	r0, r8, #3
    1514:	05000000 	streq	r0, [r0, #-0]
    1518:	e00f052a 	and	r0, pc, sl, lsr #10
    151c:	fe8083db 	mcr2	3, 4, r8, cr0, cr11, {6}
    1520:	ffffffff 			; <UNDEFINED> instruction: 0xffffffff
    1524:	001fa001 	andseq	sl, pc, r1
    1528:	80830f00 	addhi	r0, r3, r0, lsl #30
    152c:	1fac4090 	svcne	0x00ac4090
	...
    1540:	02000000 	andeq	r0, r0, #0
    1544:	000002ca 	andeq	r0, r0, sl, asr #5
    1548:	00100b02 	andseq	r0, r0, r2, lsl #22
    154c:	10dc0500 	sbcsne	r0, ip, r0, lsl #10
    1550:	01040000 	mrseq	r0, (UNDEF: 4)
    1554:	045f0704 	ldrbeq	r0, [pc], #-1796	; 155c <_umb_stack_size+0x55c>
    1558:	17480000 	strbne	r0, [r8, -r0]
    155c:	00040000 	andeq	r0, r4, r0
    1560:	00000003 	andeq	r0, r0, r3
    1564:	0001fe02 	andeq	pc, r1, r2, lsl #28
    1568:	052e0200 	streq	r0, [lr, #-512]!	; 0xfffffe00
    156c:	79050000 	stmdbvc	r5, {}	; <UNPREDICTABLE>
    1570:	04000005 	streq	r0, [r0], #-5
    1574:	5f070401 	svcpl	0x00070401
    1578:	48000004 	stmdami	r0, {r2}
    157c:	04000017 	streq	r0, [r0], #-23	; 0xffffffe9
    1580:	00000300 	andeq	r0, r0, r0, lsl #6
    1584:	05470000 	strbeq	r0, [r7, #-0]
    1588:	00040000 	andeq	r0, r4, r0
    158c:	00000000 	andeq	r0, r0, r0
    1590:	00001d04 	andeq	r1, r0, r4, lsl #26
    1594:	001c0000 	andseq	r0, ip, r0
    1598:	0000014a 	andeq	r0, r0, sl, asr #2
    159c:	00000750 	andeq	r0, r0, r0, asr r7
    15a0:	000001ba 			; <UNDEFINED> instruction: 0x000001ba
    15a4:	00036002 	andeq	r6, r3, r2
    15a8:	00ba0200 	adcseq	r0, sl, r0, lsl #4
    15ac:	c1020000 	mrsgt	r0, (UNDEF: 2)
    15b0:	05000000 	streq	r0, [r0, #-0]
    15b4:	00000d38 	andeq	r0, r0, r8, lsr sp
    15b8:	0604010c 	streq	r0, [r4], -ip, lsl #2
    15bc:	00001134 	andeq	r1, r0, r4, lsr r1
    15c0:	0000004e 	andeq	r0, r0, lr, asr #32
    15c4:	07030404 	streq	r0, [r3, -r4, lsl #8]
    15c8:	00000d01 	andeq	r0, r0, r1, lsl #26
    15cc:	00002131 	andeq	r2, r0, r1, lsr r1
    15d0:	00030004 	andeq	r0, r3, r4
    15d4:	000cf505 	andeq	pc, ip, r5, lsl #10
    15d8:	04010800 	streq	r0, [r1], #-2048	; 0xfffff800
    15dc:	000cb207 	andeq	fp, ip, r7, lsl #4
    15e0:	00213100 	eoreq	r3, r1, r0, lsl #2
    15e4:	03000400 	movweq	r0, #1024	; 0x400
    15e8:	000cc507 	andeq	ip, ip, r7, lsl #10
    15ec:	00003500 	andeq	r3, r0, r0, lsl #10
    15f0:	03040100 	movweq	r0, #16640	; 0x4100
    15f4:	000cdc07 	andeq	sp, ip, r7, lsl #24
    15f8:	00005300 	andeq	r5, r0, r0, lsl #6
    15fc:	03050100 	movweq	r0, #20736	; 0x5100
    1600:	00000000 	andeq	r0, r0, r0
    1604:	0001fe02 	andeq	pc, r1, r2, lsl #28
    1608:	052e0200 	streq	r0, [lr, #-512]!	; 0xfffffe00
    160c:	79050000 	stmdbvc	r5, {}	; <UNPREDICTABLE>
    1610:	04000005 	streq	r0, [r0], #-5
    1614:	5f060401 	svcpl	0x00060401
    1618:	c2000004 	andgt	r0, r0, #4
    161c:	04000001 	streq	r0, [r0], #-1
    1620:	3b1e0300 	blcc	782228 <_umb_stack_size+0x781228>
    1624:	6c000005 	stcvs	0, cr0, [r0], {5}
    1628:	01000006 	tsteq	r0, r6
    162c:	01cf1fbb 	strheq	r1, [pc, #251]	; 172f <_umb_stack_size+0x72f>
    1630:	1e000000 	cdpne	0, 0, cr0, cr0, cr0, {0}
    1634:	00000abb 			; <UNDEFINED> instruction: 0x00000abb
    1638:	00000aec 	andeq	r0, r0, ip, ror #21
    163c:	cf1fcc01 	svcgt	0x001fcc01
    1640:	00000001 	andeq	r0, r0, r1
    1644:	000b8f20 	andeq	r8, fp, r0, lsr #30
    1648:	000bca00 	andeq	ip, fp, r0, lsl #20
    164c:	c2e70100 	rscgt	r0, r7, #0, 2
    1650:	1f000000 	svcne	0x00000000
    1654:	000001cf 	andeq	r0, r0, pc, asr #3
    1658:	0da41e00 	stceq	14, cr1, [r4]
    165c:	0ddd0000 	ldcleq	0, cr0, [sp]
    1660:	d6010000 	strle	r0, [r1], -r0
    1664:	0001cf1f 	andeq	ip, r1, pc, lsl pc
    1668:	05041f00 	streq	r1, [r4, #-3840]	; 0xfffff100
    166c:	00000000 	andeq	r0, r0, r0
    1670:	0005a602 	andeq	sl, r5, r2, lsl #12
    1674:	05af2100 	streq	r2, [pc, #256]!	; 177c <_umb_stack_size+0x77c>
    1678:	06560000 	ldrbeq	r0, [r6], -r0
    167c:	07010000 	streq	r0, [r1, -r0]
    1680:	83220101 			; <UNDEFINED> instruction: 0x83220101
    1684:	01000005 	tsteq	r0, r5
    1688:	01cf0107 	biceq	r0, pc, r7, lsl #2
    168c:	21000000 	mrscs	r0, (UNDEF: 0)
    1690:	00000bda 	ldrdeq	r0, [r0], -sl
    1694:	00000c83 	andeq	r0, r0, r3, lsl #25
    1698:	01010e01 	tsteq	r1, r1, lsl #28
    169c:	00058322 	andeq	r8, r5, r2, lsr #6
    16a0:	010e0100 	mrseq	r0, (UNDEF: 30)
    16a4:	000001cf 	andeq	r0, r0, pc, asr #3
    16a8:	000ca022 	andeq	sl, ip, r2, lsr #32
    16ac:	010e0100 	mrseq	r0, (UNDEF: 30)
    16b0:	000004f7 	strdeq	r0, [r0], -r7
    16b4:	0d482423 	cfstrdeq	mvd2, [r8, #-140]	; 0xffffff74
    16b8:	01040000 	mrseq	r0, (UNDEF: 4)
    16bc:	21310110 	teqcs	r1, r0, lsl r1
    16c0:	24230000 	strtcs	r0, [r3], #-0
    16c4:	00000d5c 	andeq	r0, r0, ip, asr sp
    16c8:	01110104 	tsteq	r1, r4, lsl #2
    16cc:	00002131 	andeq	r2, r0, r1, lsr r1
    16d0:	0ce22423 	cfstrdeq	mvd2, [r2], #140	; 0x8c
    16d4:	01010000 	mrseq	r0, (UNDEF: 1)
    16d8:	00c20113 	sbceq	r0, r2, r3, lsl r1
    16dc:	24230000 	strtcs	r0, [r3], #-0
    16e0:	00000588 	andeq	r0, r0, r8, lsl #11
    16e4:	011d0101 	tsteq	sp, r1, lsl #2
    16e8:	000000c2 	andeq	r0, r0, r2, asr #1
    16ec:	0d712523 	cfldr64eq	mvdx2, [r1, #-140]!	; 0xffffff74
    16f0:	01040000 	mrseq	r0, (UNDEF: 4)
    16f4:	017b011e 	cmneq	fp, lr, lsl r1
	...
    1700:	0df60500 	cfldr64eq	mvdx0, [r6]
    1704:	010c0000 	mrseq	r0, (UNDEF: 12)
    1708:	0d830704 	stceq	7, cr0, [r3, #16]
    170c:	21310000 	teqcs	r1, r0
    1710:	00040000 	andeq	r0, r4, r0
    1714:	0d8d0703 	stceq	7, cr0, [sp, #12]
    1718:	21310000 	teqcs	r1, r0
    171c:	04040000 	streq	r0, [r4], #-0
    1720:	0d980703 	ldceq	7, cr0, [r8, #12]
    1724:	00c20000 	sbceq	r0, r2, r0
    1728:	08010000 	stmdaeq	r1, {}	; <UNPREDICTABLE>
    172c:	0d9c0703 	ldceq	7, cr0, [ip, #12]
    1730:	00c20000 	sbceq	r0, r2, r0
    1734:	09010000 	stmdbeq	r1, {}	; <UNPREDICTABLE>
    1738:	0d9f0703 	ldceq	7, cr0, [pc, #12]	; 174c <_umb_stack_size+0x74c>
    173c:	00c20000 	sbceq	r0, r2, r0
    1740:	0a010000 	beq	41748 <_umb_stack_size+0x40748>
    1744:	00000003 	andeq	r0, r0, r3
    1748:	00213126 	eoreq	r3, r1, r6, lsr #2
    174c:	00053200 	andeq	r3, r5, r0, lsl #4
    1750:	00000000 	andeq	r0, r0, r0
    1754:	00882700 	addeq	r2, r8, r0, lsl #14
    1758:	056a0000 	strbeq	r0, [sl, #-0]!
    175c:	00000000 	andeq	r0, r0, r0
    1760:	9c280000 	stcls	0, cr0, [r8], #-0
    1764:	01000000 	mrseq	r0, (UNDEF: 0)
    1768:	00058329 	andeq	r8, r5, r9, lsr #6
    176c:	cfbb0100 	svcgt	0x00bb0100
    1770:	23000001 	movwcs	r0, #1
    1774:	0005022a 	andeq	r0, r5, sl, lsr #4
    1778:	bd010400 	cfstrslt	mvf0, [r1, #-0]
    177c:	000001c2 	andeq	r0, r0, r2, asr #3
    1780:	05882b23 	streq	r2, [r8, #2851]	; 0xb23
    1784:	01010000 	mrseq	r0, (UNDEF: 1)
    1788:	0000c2be 			; <UNDEFINED> instruction: 0x0000c2be
    178c:	932a2300 			; <UNDEFINED> instruction: 0x932a2300
    1790:	01000005 	tsteq	r0, r5
    1794:	0235c001 	eorseq	ip, r5, #1
    1798:	2b230000 	blcs	8c17a0 <_umb_stack_size+0x8c07a0>
    179c:	00001151 	andeq	r1, r0, r1, asr r1
    17a0:	c2c00101 	sbcgt	r0, r0, #1073741824	; 0x40000000
	...
    17ac:	00036702 	andeq	r6, r3, r2, lsl #14
    17b0:	05980200 	ldreq	r0, [r8, #512]	; 0x200
    17b4:	9c020000 	stcls	0, cr0, [r2], {-0}
    17b8:	05000005 	streq	r0, [r0, #-5]
    17bc:	000007c4 	andeq	r0, r0, r4, asr #15
    17c0:	2c010102 	stfcss	f0, [r1], {2}
    17c4:	000000c2 	andeq	r0, r0, r2, asr #1
    17c8:	000005a2 	andeq	r0, r0, r2, lsr #11
    17cc:	0010ed07 	andseq	lr, r0, r7, lsl #26
    17d0:	0000c200 	andeq	ip, r0, r0, lsl #4
    17d4:	01000100 	mrseq	r0, (UNDEF: 16)
    17d8:	0010fa07 	andseq	pc, r0, r7, lsl #20
    17dc:	0000c200 	andeq	ip, r0, r0, lsl #4
    17e0:	01010100 	mrseq	r0, (UNDEF: 17)
    17e4:	02000000 	andeq	r0, r0, #0
    17e8:	00000671 	andeq	r0, r0, r1, ror r6
    17ec:	00067502 	andeq	r7, r6, r2, lsl #10
    17f0:	067b0200 	ldrbteq	r0, [fp], -r0, lsl #4
    17f4:	852d0000 	strhi	r0, [sp, #-0]!
    17f8:	e7000006 	str	r0, [r0, -r6]
    17fc:	02000006 	andeq	r0, r0, #6
    1800:	04650720 	strbteq	r0, [r5], #-1824	; 0xfffff8e0
    1804:	22010000 	andcs	r0, r1, #0
    1808:	00000583 	andeq	r0, r0, r3, lsl #11
    180c:	6c072002 	stcvs	0, cr2, [r7], {2}
    1810:	22000004 	andcs	r0, r0, #4
    1814:	000006f3 	strdeq	r0, [r0], -r3
    1818:	6c072002 	stcvs	0, cr2, [r7], {2}
    181c:	00000004 	andeq	r0, r0, r4
    1820:	0006852d 	andeq	r8, r6, sp, lsr #10
    1824:	0006e700 	andeq	lr, r6, r0, lsl #14
    1828:	07200200 	streq	r0, [r0, -r0, lsl #4]!
    182c:	00000465 	andeq	r0, r0, r5, ror #8
    1830:	05832201 	streq	r2, [r3, #513]	; 0x201
    1834:	20020000 	andcs	r0, r2, r0
    1838:	00046c07 	andeq	r6, r4, r7, lsl #24
    183c:	06f32200 	ldrbteq	r2, [r3], r0, lsl #4
    1840:	20020000 	andcs	r0, r2, r0
    1844:	00046c07 	andeq	r6, r4, r7, lsl #24
    1848:	00000000 	andeq	r0, r0, r0
    184c:	05930200 	ldreq	r0, [r3, #512]	; 0x200
    1850:	9c020000 	stcls	0, cr0, [r2], {-0}
    1854:	02000005 	andeq	r0, r0, #5
    1858:	000006f9 	strdeq	r0, [r0], -r9
    185c:	0007022d 	andeq	r0, r7, sp, lsr #4
    1860:	00077f00 	andeq	r7, r7, r0, lsl #30
    1864:	02fb0300 	rscseq	r0, fp, #0, 6
    1868:	000003cb 	andeq	r0, r0, fp, asr #7
    186c:	00c22c01 	sbceq	r2, r2, r1, lsl #24
    1870:	04680000 	strbteq	r0, [r8], #-0
    1874:	83220000 			; <UNDEFINED> instruction: 0x83220000
    1878:	03000005 	movweq	r0, #5
    187c:	047902fb 	ldrbteq	r0, [r9], #-763	; 0xfffffd05
    1880:	24230000 	strtcs	r0, [r3], #-0
    1884:	000007ce 	andeq	r0, r0, lr, asr #15
    1888:	02fd0301 	rscseq	r0, sp, #67108864	; 0x4000000
    188c:	000000c2 	andeq	r0, r0, r2, asr #1
    1890:	022d0000 	eoreq	r0, sp, #0
    1894:	7f000007 	svcvc	0x00000007
    1898:	03000007 	movweq	r0, #7
    189c:	03cb02fb 	biceq	r0, fp, #-1342177265	; 0xb000000f
    18a0:	2c010000 	stccs	0, cr0, [r1], {-0}
    18a4:	000000c2 	andeq	r0, r0, r2, asr #1
    18a8:	00000468 	andeq	r0, r0, r8, ror #8
    18ac:	00058322 	andeq	r8, r5, r2, lsr #6
    18b0:	02fb0300 	rscseq	r0, fp, #0, 6
    18b4:	00000479 	andeq	r0, r0, r9, ror r4
    18b8:	07ce2423 	strbeq	r2, [lr, r3, lsr #8]
    18bc:	03010000 	movweq	r0, #4096	; 0x1000
    18c0:	00c202fd 	strdeq	r0, [r2], #45	; 0x2d
    18c4:	00000000 	andeq	r0, r0, r0
    18c8:	07d20200 	ldrbeq	r0, [r2, r0, lsl #4]
    18cc:	dd2d0000 	stcle	0, cr0, [sp, #-0]
    18d0:	84000007 	strhi	r0, [r0], #-7
    18d4:	03000007 	movweq	r0, #7
    18d8:	03cb0350 	biceq	r0, fp, #80, 6	; 0x40000001
    18dc:	2c010000 	stccs	0, cr0, [r1], {-0}
    18e0:	000000c2 	andeq	r0, r0, r2, asr #1
    18e4:	000007db 	ldrdeq	r0, [r0], -fp
    18e8:	00058322 	andeq	r8, r5, r2, lsr #6
    18ec:	03500300 	cmpeq	r0, #0, 6
    18f0:	00000479 	andeq	r0, r0, r9, ror r4
    18f4:	07dd2d00 	ldrbeq	r2, [sp, r0, lsl #26]
    18f8:	07840000 	streq	r0, [r4, r0]
    18fc:	50030000 	andpl	r0, r3, r0
    1900:	0003cb03 	andeq	ip, r3, r3, lsl #22
    1904:	c22c0100 	eorgt	r0, ip, #0, 2
    1908:	db000000 	blle	1910 <_umb_stack_size+0x910>
    190c:	22000007 	andcs	r0, r0, #7
    1910:	00000583 	andeq	r0, r0, r3, lsl #11
    1914:	79035003 	stmdbvc	r3, {r0, r1, ip, lr}
    1918:	00000004 	andeq	r0, r0, r4
    191c:	0a3e0200 	beq	f82124 <_umb_stack_size+0xf81124>
    1920:	482e0000 	stmdami	lr!, {}	; <UNPREDICTABLE>
    1924:	a300000a 	movwge	r0, #10
    1928:	0300000a 	movweq	r0, #10
    192c:	0000c2cb 	andeq	ip, r0, fp, asr #5
    1930:	ed2f0100 	stfs	f0, [pc, #-0]	; 1938 <_umb_stack_size+0x938>
    1934:	03000010 	movweq	r0, #16
    1938:	0000c2cb 	andeq	ip, r0, fp, asr #5
    193c:	0d9d2900 	vldreq.16	s4, [sp]	; <UNPREDICTABLE>
    1940:	cb030000 	blgt	c1948 <_umb_stack_size+0xc0948>
    1944:	00000486 	andeq	r0, r0, r6, lsl #9
    1948:	00000000 	andeq	r0, r0, r0
    194c:	00078d02 	andeq	r8, r7, r2, lsl #26
    1950:	07a20500 	streq	r0, [r2, r0, lsl #10]!
    1954:	01020000 	mrseq	r0, (UNDEF: 2)
    1958:	03d83001 	bicseq	r3, r8, #1
    195c:	c2310000 	eorsgt	r0, r1, #0
    1960:	01000000 	mrseq	r0, (UNDEF: 0)
    1964:	33003200 	movwcc	r3, #512	; 0x200
    1968:	00000794 	muleq	r0, r4, r7
    196c:	000003fc 	strdeq	r0, [r0], -ip
    1970:	32000001 	andcc	r0, r0, #1
    1974:	07993301 	ldreq	r3, [r9, r1, lsl #6]
    1978:	040e0000 	streq	r0, [lr], #-0
    197c:	00010000 	andeq	r0, r1, r0
    1980:	94050000 	strls	r0, [r5], #-0
    1984:	02000007 	andeq	r0, r0, #7
    1988:	c22c0101 	eorgt	r0, ip, #1073741824	; 0x40000000
    198c:	68000000 	stmdavs	r0, {}	; <UNPREDICTABLE>
    1990:	00000004 	andeq	r0, r0, r4
    1994:	00079905 	andeq	r9, r7, r5, lsl #18
    1998:	01010200 	mrseq	r0, R9_usr
    199c:	0000c22c 	andeq	ip, r0, ip, lsr #4
    19a0:	00046800 	andeq	r6, r4, r0, lsl #16
    19a4:	079e0700 	ldreq	r0, [lr, r0, lsl #14]
    19a8:	00c20000 	sbceq	r0, r2, r0
    19ac:	01010000 	mrseq	r0, (UNDEF: 1)
    19b0:	00000001 	andeq	r0, r0, r1
    19b4:	00114c02 	andseq	r4, r1, r2, lsl #24
    19b8:	07d20200 	ldrbeq	r0, [r2, r0, lsl #4]
    19bc:	e6340000 	ldrt	r0, [r4], -r0
    19c0:	2c000009 	stccs	0, cr0, [r0], {9}
    19c4:	0400000a 	streq	r0, [r0], #-10
    19c8:	00c20230 	sbceq	r0, r2, r0, lsr r2
    19cc:	35010000 	strcc	r0, [r1, #-0]
    19d0:	00000583 	andeq	r0, r0, r3, lsl #11
    19d4:	c2023004 	andgt	r3, r2, #4
    19d8:	35000000 	strcc	r0, [r0, #-0]
    19dc:	00000a3a 	andeq	r0, r0, sl, lsr sl
    19e0:	c2023004 	andgt	r3, r2, #4
    19e4:	00000000 	andeq	r0, r0, r0
    19e8:	08000000 	stmdaeq	r0, {}	; <UNPREDICTABLE>
    19ec:	000006ea 	andeq	r0, r0, sl, ror #13
    19f0:	c2260102 	eorgt	r0, r6, #-2147483648	; 0x80000000
    19f4:	ef000000 	svc	0x00000000
    19f8:	00000006 	andeq	r0, r0, r6
    19fc:	27000000 	strcs	r0, [r0, -r0]
    1a00:	00000235 	andeq	r0, r0, r5, lsr r2
    1a04:	000007ad 	andeq	r0, r0, sp, lsr #15
    1a08:	00000000 	andeq	r0, r0, r0
    1a0c:	000ab508 	andeq	fp, sl, r8, lsl #10
    1a10:	28040700 	stmdacs	r4, {r8, r9, sl}
    1a14:	000000ad 	andeq	r0, r0, sp, lsr #1
    1a18:	05832901 	streq	r2, [r3, #2305]	; 0x901
    1a1c:	cc010000 	stcgt	0, cr0, [r1], {-0}
    1a20:	000001cf 	andeq	r0, r0, pc, asr #3
    1a24:	05022a23 	streq	r2, [r2, #-2595]	; 0xfffff5dd
    1a28:	01040000 	mrseq	r0, (UNDEF: 4)
    1a2c:	0001c2ce 	andeq	ip, r1, lr, asr #5
    1a30:	28000000 	stmdacs	r0, {}	; <UNPREDICTABLE>
    1a34:	000000be 	strheq	r0, [r0], -lr
    1a38:	05832901 	streq	r2, [r3, #2305]	; 0x901
    1a3c:	e7010000 	str	r0, [r1, -r0]
    1a40:	000001cf 	andeq	r0, r0, pc, asr #3
    1a44:	05022a23 	streq	r2, [r2, #-2595]	; 0xfffff5dd
    1a48:	01040000 	mrseq	r0, (UNDEF: 4)
    1a4c:	0001c2e8 	andeq	ip, r1, r8, ror #5
    1a50:	882b2300 	stmdahi	fp!, {r8, r9, sp}
    1a54:	01000005 	tsteq	r0, r5
    1a58:	00c2e901 	sbceq	lr, r2, r1, lsl #18
    1a5c:	2a230000 	bcs	8c1a64 <_umb_stack_size+0x8c0a64>
    1a60:	00000593 	muleq	r0, r3, r5
    1a64:	35eb0101 	strbcc	r0, [fp, #257]!	; 0x101
    1a68:	23000002 	movwcs	r0, #2
    1a6c:	0011512b 	andseq	r5, r1, fp, lsr #2
    1a70:	eb010100 	bl	41e78 <_umb_stack_size+0x40e78>
    1a74:	000000c2 	andeq	r0, r0, r2, asr #1
    1a78:	00000000 	andeq	r0, r0, r0
    1a7c:	002d2700 	eoreq	r2, sp, r0, lsl #14
    1a80:	0d180000 	ldceq	0, cr0, [r8, #-0]
    1a84:	00000000 	andeq	r0, r0, r0
    1a88:	7b270000 	blvc	9c1a90 <_umb_stack_size+0x9c0a90>
    1a8c:	eb000001 	bl	1a98 <_umb_stack_size+0xa98>
    1a90:	0000000d 	andeq	r0, r0, sp
    1a94:	28000000 	stmdacs	r0, {}	; <UNPREDICTABLE>
    1a98:	000000d3 	ldrdeq	r0, [r0], -r3
    1a9c:	05832901 	streq	r2, [r3, #2305]	; 0x901
    1aa0:	d6010000 	strle	r0, [r1], -r0
    1aa4:	000001cf 	andeq	r0, r0, pc, asr #3
    1aa8:	000d7c29 	andeq	r7, sp, r9, lsr #24
    1aac:	04d60100 	ldrbeq	r0, [r6], #256	; 0x100
    1ab0:	23000005 	movwcs	r0, #5
    1ab4:	0005022a 	andeq	r0, r5, sl, lsr #4
    1ab8:	d8010400 	stmdale	r1, {sl}
    1abc:	000001c2 	andeq	r0, r0, r2, asr #3
    1ac0:	0d8d2b23 	vstreq	d2, [sp, #140]	; 0x8c
    1ac4:	01040000 	mrseq	r0, (UNDEF: 4)
    1ac8:	002131dd 	ldrdeq	r3, [r1], -sp	; <UNPREDICTABLE>
    1acc:	00000000 	andeq	r0, r0, r0
    1ad0:	0003ce00 	andeq	ip, r3, r0, lsl #28
    1ad4:	00000400 	andeq	r0, r0, r0, lsl #8
    1ad8:	04000000 	streq	r0, [r0], #-0
    1adc:	0000001d 	andeq	r0, r0, sp, lsl r0
    1ae0:	02001c00 	andeq	r1, r0, #0, 24
    1ae4:	70000002 	andvc	r0, r0, r2
    1ae8:	80000008 	andhi	r0, r0, r8
    1aec:	02000002 	andeq	r0, r0, #2
    1af0:	00000360 	andeq	r0, r0, r0, ror #6
    1af4:	0000ba02 	andeq	fp, r0, r2, lsl #20
    1af8:	00c10200 	sbceq	r0, r1, r0, lsl #4
    1afc:	38050000 	stmdacc	r5, {}	; <UNPREDICTABLE>
    1b00:	0c00000d 	stceq	0, cr0, [r0], {13}
    1b04:	34060401 	strcc	r0, [r6], #-1025	; 0xfffffbff
    1b08:	4e000011 	mcrmi	0, 0, r0, cr0, cr1, {0}
    1b0c:	04000000 	streq	r0, [r0], #-0
    1b10:	01070304 	tsteq	r7, r4, lsl #6
    1b14:	3100000d 	tstcc	r0, sp
    1b18:	04000021 	streq	r0, [r0], #-33	; 0xffffffdf
    1b1c:	05000300 	streq	r0, [r0, #-768]	; 0xfffffd00
    1b20:	00000cf5 	strdeq	r0, [r0], -r5
    1b24:	07040108 	streq	r0, [r4, -r8, lsl #2]
    1b28:	00000cb2 			; <UNDEFINED> instruction: 0x00000cb2
    1b2c:	00002131 	andeq	r2, r0, r1, lsr r1
    1b30:	07030004 	streq	r0, [r3, -r4]
    1b34:	00000cc5 	andeq	r0, r0, r5, asr #25
    1b38:	00000035 	andeq	r0, r0, r5, lsr r0
    1b3c:	07030401 	streq	r0, [r3, -r1, lsl #8]
    1b40:	00000cdc 	ldrdeq	r0, [r0], -ip
    1b44:	00000053 	andeq	r0, r0, r3, asr r0
    1b48:	00030501 	andeq	r0, r3, r1, lsl #10
    1b4c:	02000000 	andeq	r0, r0, #0
    1b50:	00000367 	andeq	r0, r0, r7, ror #6
    1b54:	00114c02 	andseq	r4, r1, r2, lsl #24
    1b58:	0e060200 	cdpeq	2, 0, cr0, cr6, cr0, {0}
    1b5c:	0f340000 	svceq	0x00340000
    1b60:	2c00000e 	stccs	0, cr0, [r0], {14}
    1b64:	0100000a 	tsteq	r0, sl
    1b68:	21310230 	teqcs	r1, r0, lsr r2
    1b6c:	35010000 	strcc	r0, [r1, #-0]
    1b70:	00000583 	andeq	r0, r0, r3, lsl #11
    1b74:	31023001 	tstcc	r2, r1
    1b78:	35000021 	strcc	r0, [r0, #-33]	; 0xffffffdf
    1b7c:	00000a3a 	andeq	r0, r0, sl, lsr sl
    1b80:	31023001 	tstcc	r2, r1
    1b84:	00000021 	andeq	r0, r0, r1, lsr #32
    1b88:	93020000 	movwls	r0, #8192	; 0x2000
    1b8c:	02000005 	andeq	r0, r0, #5
    1b90:	0000059c 	muleq	r0, ip, r5
    1b94:	000e5602 	andeq	r5, lr, r2, lsl #12
    1b98:	0e602e00 	cdpeq	14, 6, cr2, cr0, cr0, {0}
    1b9c:	0aa30000 	beq	fe8c1ba4 <_umb_estack+0xde883ba8>
    1ba0:	cb020000 	blgt	81ba8 <_umb_stack_size+0x80ba8>
    1ba4:	00002131 	andeq	r2, r0, r1, lsr r1
    1ba8:	10ed2f01 	rscne	r2, sp, r1, lsl #30
    1bac:	cb020000 	blgt	81bb4 <_umb_stack_size+0x80bb4>
    1bb0:	00002131 	andeq	r2, r0, r1, lsr r1
    1bb4:	000d9d2f 	andeq	r9, sp, pc, lsr #26
    1bb8:	0ccb0200 	sfmeq	f0, 2, [fp], {0}
    1bbc:	0000001a 	andeq	r0, r0, sl, lsl r0
    1bc0:	06f90200 	ldrbteq	r0, [r9], r0, lsl #4
    1bc4:	bc2d0000 	stclt	0, cr0, [sp], #-0
    1bc8:	3900000e 	stmdbcc	r0, {r1, r2, r3}
    1bcc:	0200000f 	andeq	r0, r0, #15
    1bd0:	016002fb 	strdeq	r0, [r0, #-43]!	; 0xffffffd5
    1bd4:	2c010000 	stccs	0, cr0, [r1], {-0}
    1bd8:	00002131 	andeq	r2, r0, r1, lsr r1
    1bdc:	00000468 	andeq	r0, r0, r8, ror #8
    1be0:	00058322 	andeq	r8, r5, r2, lsr #6
    1be4:	02fb0200 	rscseq	r0, fp, #0, 4
    1be8:	000001fa 	strdeq	r0, [r0], -sl
    1bec:	07ce2423 	strbeq	r2, [lr, r3, lsr #8]
    1bf0:	02040000 	andeq	r0, r4, #0
    1bf4:	213102fd 	teqcs	r1, sp	; <illegal shifter operand>
    1bf8:	00000000 	andeq	r0, r0, r0
    1bfc:	07d20200 	ldrbeq	r0, [r2, r0, lsl #4]
    1c00:	762d0000 	strtvc	r0, [sp], -r0
    1c04:	3e00000f 	cdpcc	0, 0, cr0, cr0, cr15, {0}
    1c08:	0200000f 	andeq	r0, r0, #15
    1c0c:	01600350 	cmneq	r0, r0, asr r3
    1c10:	2c010000 	stccs	0, cr0, [r1], {-0}
    1c14:	00002131 	andeq	r2, r0, r1, lsr r1
    1c18:	000007db 	ldrdeq	r0, [r0], -fp
    1c1c:	00058322 	andeq	r8, r5, r2, lsr #6
    1c20:	03500200 	cmpeq	r0, #0, 4
    1c24:	000001fa 	strdeq	r0, [r0], -sl
    1c28:	00000000 	andeq	r0, r0, r0
    1c2c:	00078d02 	andeq	r8, r7, r2, lsl #26
    1c30:	0f480500 	svceq	0x00480500
    1c34:	01080000 	mrseq	r0, (UNDEF: 8)
    1c38:	016d3004 	cmneq	sp, r4
    1c3c:	31310000 	teqcc	r1, r0
    1c40:	04000021 	streq	r0, [r0], #-33	; 0xffffffdf
    1c44:	33003200 	movwcc	r3, #512	; 0x200
    1c48:	00000794 	muleq	r0, r4, r7
    1c4c:	00000191 	muleq	r0, r1, r1
    1c50:	32000004 	andcc	r0, r0, #4
    1c54:	07993301 	ldreq	r3, [r9, r1, lsl #6]
    1c58:	01a30000 			; <UNDEFINED> instruction: 0x01a30000
    1c5c:	00040000 	andeq	r0, r4, r0
    1c60:	94050000 	strls	r0, [r5], #-0
    1c64:	08000007 	stmdaeq	r0, {r0, r1, r2}
    1c68:	312c0401 			; <UNDEFINED> instruction: 0x312c0401
    1c6c:	68000021 	stmdavs	r0, {r0, r5}
    1c70:	00000004 	andeq	r0, r0, r4
    1c74:	00079905 	andeq	r9, r7, r5, lsl #18
    1c78:	04010800 	streq	r0, [r1], #-2048	; 0xfffff800
    1c7c:	0021312c 	eoreq	r3, r1, ip, lsr #2
    1c80:	00046800 	andeq	r6, r4, r0, lsl #16
    1c84:	079e0700 	ldreq	r0, [lr, r0, lsl #14]
    1c88:	21310000 	teqcs	r1, r0
    1c8c:	04040000 	streq	r0, [r4], #-0
    1c90:	00000001 	andeq	r0, r0, r1
    1c94:	00059802 	andeq	r9, r5, r2, lsl #16
    1c98:	059c0200 	ldreq	r0, [ip, #512]	; 0x200
    1c9c:	6b050000 	blvs	141ca4 <_umb_stack_size+0x140ca4>
    1ca0:	0800000f 	stmdaeq	r0, {r0, r1, r2, r3}
    1ca4:	312c0401 			; <UNDEFINED> instruction: 0x312c0401
    1ca8:	a2000021 	andge	r0, r0, #33	; 0x21
    1cac:	07000005 	streq	r0, [r0, -r5]
    1cb0:	000010ed 	andeq	r1, r0, sp, ror #1
    1cb4:	00002131 	andeq	r2, r0, r1, lsr r1
    1cb8:	07010004 	streq	r0, [r1, -r4]
    1cbc:	000010fa 	strdeq	r1, [r0], -sl
    1cc0:	00002131 	andeq	r2, r0, r1, lsr r1
    1cc4:	00010404 	andeq	r0, r1, r4, lsl #8
    1cc8:	27000000 	strcs	r0, [r0, -r0]
    1ccc:	000001cd 	andeq	r0, r0, sp, asr #3
    1cd0:	00000f54 	andeq	r0, r0, r4, asr pc
    1cd4:	00000000 	andeq	r0, r0, r0
    1cd8:	0002ca02 	andeq	ip, r2, r2, lsl #20
    1cdc:	100b0200 	andne	r0, fp, r0, lsl #4
    1ce0:	10020000 	andne	r0, r2, r0
    1ce4:	36000010 			; <UNDEFINED> instruction: 0x36000010
    1ce8:	00001019 	andeq	r1, r0, r9, lsl r0
    1cec:	00000c83 	andeq	r0, r0, r3, lsl #25
    1cf0:	2901b803 	stmdbcs	r1, {r0, r1, fp, ip, sp, pc}
    1cf4:	00000583 	andeq	r0, r0, r3, lsl #11
    1cf8:	0348b803 	movteq	fp, #34819	; 0x8803
    1cfc:	a0290000 	eorge	r0, r9, r0
    1d00:	0300000c 	movweq	r0, #12
    1d04:	000355b8 			; <UNDEFINED> instruction: 0x000355b8
    1d08:	e72b2300 	str	r2, [fp, -r0, lsl #6]!
    1d0c:	04000010 	streq	r0, [r0], #-16
    1d10:	2131bf03 	teqcs	r1, r3, lsl #30
    1d14:	2a230000 	bcs	8c1d1c <_umb_stack_size+0x8c0d1c>
    1d18:	000010f3 	strdeq	r1, [r0], -r3
    1d1c:	62c00304 	sbcvs	r0, r0, #4, 6	; 0x10000000
    1d20:	23000003 	movwcs	r0, #3
    1d24:	0011022a 	andseq	r0, r1, sl, lsr #4
    1d28:	c1030400 	tstgt	r3, r0, lsl #8
    1d2c:	00000362 	andeq	r0, r0, r2, ror #6
    1d30:	110f2b23 	tstne	pc, r3, lsr #22
    1d34:	03040000 	movweq	r0, #16384	; 0x4000
    1d38:	002131c2 	eoreq	r3, r1, r2, asr #3
    1d3c:	482b2300 	stmdami	fp!, {r8, r9, sp}
    1d40:	0400000d 	streq	r0, [r0], #-13
    1d44:	2131c503 	teqcs	r1, r3, lsl #10
    1d48:	2b230000 	blcs	8c1d50 <_umb_stack_size+0x8c0d50>
    1d4c:	00001119 	andeq	r1, r0, r9, lsl r1
    1d50:	c2ce0301 	sbcgt	r0, lr, #67108864	; 0x4000000
    1d54:	23000000 	movwcs	r0, #0
    1d58:	0011252b 	andseq	r2, r1, fp, lsr #10
    1d5c:	d7030400 	strle	r0, [r3, -r0, lsl #8]
    1d60:	00002131 	andeq	r2, r0, r1, lsr r1
    1d64:	11412b23 	cmpne	r1, r3, lsr #22
    1d68:	03040000 	movweq	r0, #16384	; 0x4000
    1d6c:	002131d8 	ldrdeq	r3, [r1], -r8	; <UNPREDICTABLE>
    1d70:	932a2300 			; <UNDEFINED> instruction: 0x932a2300
    1d74:	04000005 	streq	r0, [r0], #-5
    1d78:	01cddb03 	biceq	sp, sp, r3, lsl #22
    1d7c:	2b230000 	blcs	8c1d84 <_umb_stack_size+0x8c0d84>
    1d80:	00001150 	andeq	r1, r0, r0, asr r1
    1d84:	31db0304 	bicscc	r0, fp, r4, lsl #6
    1d88:	23000021 	movwcs	r0, #33	; 0x21
    1d8c:	0011532b 	andseq	r5, r1, fp, lsr #6
    1d90:	de030400 	cfcpysle	mvf0, mvf3
    1d94:	00002131 	andeq	r2, r0, r1, lsr r1
    1d98:	11642b23 	cmnne	r4, r3, lsr #22
    1d9c:	03040000 	movweq	r0, #16384	; 0x4000
    1da0:	002131df 	ldrdeq	r3, [r1], -pc	; <UNPREDICTABLE>
    1da4:	f12b2300 			; <UNDEFINED> instruction: 0xf12b2300
    1da8:	01000011 	tsteq	r0, r1, lsl r0
    1dac:	00c2e103 	sbceq	lr, r2, r3, lsl #2
    1db0:	2b230000 	blcs	8c1db8 <_umb_stack_size+0x8c0db8>
    1db4:	00001175 	andeq	r1, r0, r5, ror r1
    1db8:	c2e20301 	rscgt	r0, r2, #67108864	; 0x4000000
    1dbc:	23000000 	movwcs	r0, #0
    1dc0:	00117b2b 	andseq	r7, r1, fp, lsr #22
    1dc4:	e3030100 	movw	r0, #12544	; 0x3100
    1dc8:	000000c2 	andeq	r0, r0, r2, asr #1
	...
    1ddc:	10dc0500 	sbcsne	r0, ip, r0, lsl #10
    1de0:	01040000 	mrseq	r0, (UNDEF: 4)
    1de4:	045f0704 	ldrbeq	r0, [pc], #-1796	; 1dec <_umb_stack_size+0xdec>
    1de8:	17480000 	strbne	r0, [r8, -r0]
    1dec:	00040000 	andeq	r0, r4, r0
    1df0:	11841e03 	orrne	r1, r4, r3, lsl #28
    1df4:	11d00000 	bicsne	r0, r0, r0
    1df8:	91030000 	mrsls	r0, (UNDEF: 3)
    1dfc:	0003481f 	andeq	r4, r3, pc, lsl r8
    1e00:	00c23700 	sbceq	r3, r2, r0, lsl #14
    1e04:	c2370000 	eorsgt	r0, r7, #0
    1e08:	37000000 	strcc	r0, [r0, -r0]
    1e0c:	000000c2 	andeq	r0, r0, r2, asr #1
    1e10:	0000c237 	andeq	ip, r0, r7, lsr r2
    1e14:	00000000 	andeq	r0, r0, r0
    1e18:	030c2700 	movweq	r2, #50944	; 0xc700
    1e1c:	10c80000 	sbcne	r0, r8, r0
    1e20:	00000000 	andeq	r0, r0, r0
    1e24:	2d270000 	stccs	0, cr0, [r7, #-0]
    1e28:	18000000 	stmdane	r0, {}	; <UNPREDICTABLE>
    1e2c:	0000000d 	andeq	r0, r0, sp
    1e30:	08000000 	stmdaeq	r0, {}	; <UNPREDICTABLE>
    1e34:	000010fe 	strdeq	r1, [r0], -lr
    1e38:	20280405 	eorcs	r0, r8, r5, lsl #8
    1e3c:	01000003 	tsteq	r0, r3
    1e40:	00058329 	andeq	r8, r5, r9, lsr #6
    1e44:	48910300 	ldmmi	r1, {r8, r9}
    1e48:	2f000003 	svccs	0x00000003
    1e4c:	000011ea 	andeq	r1, r0, sl, ror #3
    1e50:	00c29103 	sbceq	r9, r2, r3, lsl #2
    1e54:	752f0000 	strvc	r0, [pc, #-0]!	; 1e5c <_umb_stack_size+0xe5c>
    1e58:	03000011 	movweq	r0, #17
    1e5c:	0000c291 	muleq	r0, r1, r2
    1e60:	117b2f00 	cmnne	fp, r0, lsl #30
    1e64:	91030000 	mrsls	r0, (UNDEF: 3)
    1e68:	000000c2 	andeq	r0, r0, r2, asr #1
    1e6c:	0011192f 	andseq	r1, r1, pc, lsr #18
    1e70:	c2910300 	addsgt	r0, r1, #0, 6
    1e74:	23000000 	movwcs	r0, #0
    1e78:	0005022b 	andeq	r0, r5, fp, lsr #4
    1e7c:	93030400 	movwls	r0, #13312	; 0x3400
    1e80:	00001748 	andeq	r1, r0, r8, asr #14
    1e84:	11f92b23 	mvnsne	r2, r3, lsr #22
    1e88:	03040000 	movweq	r0, #16384	; 0x4000
    1e8c:	00213195 	mlaeq	r1, r5, r1, r3
    1e90:	0a2b2300 	beq	acaa98 <_umb_stack_size+0xac9a98>
    1e94:	04000012 	streq	r0, [r0], #-18	; 0xffffffee
    1e98:	21319d03 	teqcs	r1, r3, lsl #26
    1e9c:	00000000 	andeq	r0, r0, r0
    1ea0:	94000000 	strls	r0, [r0], #-0
    1ea4:	04000000 	streq	r0, [r0], #-0
    1ea8:	00000000 	andeq	r0, r0, r0
    1eac:	00010400 	andeq	r0, r1, r0, lsl #8
    1eb0:	1c000000 	stcne	0, cr0, [r0], {-0}
    1eb4:	0002d200 	andeq	sp, r2, r0, lsl #4
    1eb8:	00094600 	andeq	r4, r9, r0, lsl #12
    1ebc:	00033200 	andeq	r3, r3, r0, lsl #4
    1ec0:	01000000 	mrseq	r0, (UNDEF: 0)
    1ec4:	00000208 	andeq	r0, r0, r8, lsl #4
    1ec8:	03670200 	cmneq	r7, #0, 4
    1ecc:	6c020000 	stcvs	0, cr0, [r2], {-0}
    1ed0:	02000003 	andeq	r0, r0, #3
    1ed4:	000010f0 	strdeq	r1, [r0], -r0
    1ed8:	0000c238 	andeq	ip, r0, r8, lsr r2
    1edc:	00038a00 	andeq	r8, r3, r0, lsl #20
    1ee0:	04010100 	streq	r0, [r1], #-256	; 0xffffff00
    1ee4:	00000370 	andeq	r0, r0, r0, ror r3
    1ee8:	03750400 	cmneq	r5, #0, 8
    1eec:	04010000 	streq	r0, [r1], #-0
    1ef0:	0000037b 	andeq	r0, r0, fp, ror r3
    1ef4:	03820402 	orreq	r0, r2, #33554432	; 0x2000000
    1ef8:	00030000 	andeq	r0, r3, r0
    1efc:	00c23800 	sbceq	r3, r2, r0, lsl #16
    1f00:	038a0000 	orreq	r0, sl, #0
    1f04:	01010000 	mrseq	r0, (UNDEF: 1)
    1f08:	00037004 	andeq	r7, r3, r4
    1f0c:	75040000 	strvc	r0, [r4, #-0]
    1f10:	01000003 	tsteq	r0, r3
    1f14:	00037b04 	andeq	r7, r3, r4, lsl #22
    1f18:	00000200 	andeq	r0, r0, r0, lsl #4
    1f1c:	03600200 	cmneq	r0, #0, 4
    1f20:	1d020000 	stcne	0, cr0, [r2, #-0]
    1f24:	39000014 	stmdbcc	r0, {r2, r4}
    1f28:	08010000 	stmdaeq	r1, {}	; <UNPREDICTABLE>
    1f2c:	00000002 	andeq	r0, r0, r2
    1f30:	14375701 	ldrtne	r5, [r7], #-1793	; 0xfffff8ff
    1f34:	2c010000 	stccs	0, cr0, [r1], {-0}
    1f38:	23000000 	movwcs	r0, #0
    1f3c:	04000004 	streq	r0, [r0], #-4
    1f40:	00000000 	andeq	r0, r0, r0
    1f44:	001d0400 	andseq	r0, sp, r0, lsl #8
    1f48:	1c000000 	stcne	0, cr0, [r0], {-0}
    1f4c:	00039400 	andeq	r9, r3, r0, lsl #8
    1f50:	00098e00 	andeq	r8, r9, r0, lsl #28
    1f54:	00041600 	andeq	r1, r4, r0, lsl #12
    1f58:	03670200 	cmneq	r7, #0, 4
    1f5c:	64020000 	strvs	r0, [r2], #-0
    1f60:	2d000004 	stccs	0, cr0, [r0, #-16]
    1f64:	0000046a 	andeq	r0, r0, sl, ror #8
    1f68:	0000049a 	muleq	r0, sl, r4
    1f6c:	f606cc01 			; <UNDEFINED> instruction: 0xf606cc01
    1f70:	01000001 	tsteq	r0, r1
    1f74:	0001f63a 	andeq	pc, r1, sl, lsr r6	; <UNPREDICTABLE>
    1f78:	00046800 	andeq	r6, r4, r0, lsl #16
    1f7c:	04ad2200 	strteq	r2, [sp], #512	; 0x200
    1f80:	cc010000 	stcgt	0, cr0, [r1], {-0}
    1f84:	0001fd06 	andeq	pc, r1, r6, lsl #26
    1f88:	723b0000 	eorsvc	r0, fp, #0
    1f8c:	a3000008 	movwge	r0, #8
    1f90:	01000008 	tsteq	r0, r8
    1f94:	3a01071c 	bcc	43c0c <_umb_stack_size+0x42c0c>
    1f98:	000001f6 	strdeq	r0, [r0], -r6
    1f9c:	00000468 	andeq	r0, r0, r8, ror #8
    1fa0:	0008b722 	andeq	fp, r8, r2, lsr #14
    1fa4:	071c0100 	ldreq	r0, [ip, -r0, lsl #2]
    1fa8:	00000405 	andeq	r0, r0, r5, lsl #8
    1fac:	0004ad22 	andeq	sl, r4, r2, lsr #26
    1fb0:	071c0100 	ldreq	r0, [ip, -r0, lsl #2]
    1fb4:	000001f6 	strdeq	r0, [r0], -r6
    1fb8:	98020000 	stmdals	r2, {}	; <UNPREDICTABLE>
    1fbc:	02000005 	andeq	r0, r0, #5
    1fc0:	0000059c 	muleq	r0, ip, r5
    1fc4:	0012c705 	andseq	ip, r2, r5, lsl #14
    1fc8:	02010400 	andeq	r0, r1, #0, 8
    1fcc:	0004123a 	andeq	r1, r4, sl, lsr r2
    1fd0:	0005a200 	andeq	sl, r5, r0, lsl #4
    1fd4:	10ed0600 	rscne	r0, sp, r0, lsl #12
    1fd8:	04120000 	ldreq	r0, [r2], #-0
    1fdc:	00020000 	andeq	r0, r2, r0
    1fe0:	10fa0601 	rscsne	r0, sl, r1, lsl #12
    1fe4:	04120000 	ldreq	r0, [r2], #-0
    1fe8:	02020000 	andeq	r0, r2, #0
    1fec:	00000001 	andeq	r0, r0, r1
    1ff0:	00059302 	andeq	r9, r5, r2, lsl #6
    1ff4:	059c0200 	ldreq	r0, [ip, #512]	; 0x200
    1ff8:	f9020000 			; <UNDEFINED> instruction: 0xf9020000
    1ffc:	2d000006 	stccs	0, cr0, [r0, #-24]	; 0xffffffe8
    2000:	00001218 	andeq	r1, r0, r8, lsl r2
    2004:	00001295 	muleq	r0, r5, r2
    2008:	5c02fb03 			; <UNDEFINED> instruction: 0x5c02fb03
    200c:	01000001 	tsteq	r0, r1
    2010:	0004123a 	andeq	r1, r4, sl, lsr r2
    2014:	00046800 	andeq	r6, r4, r0, lsl #16
    2018:	05832200 	streq	r2, [r3, #512]	; 0x200
    201c:	fb030000 	blx	c2026 <_umb_stack_size+0xc1026>
    2020:	00041902 	andeq	r1, r4, r2, lsl #18
    2024:	ce252300 	cdpgt	3, 2, cr2, cr5, cr0, {0}
    2028:	02000007 	andeq	r0, r0, #7
    202c:	1202fd03 	andne	pc, r2, #3, 26	; 0xc0
    2030:	00000004 	andeq	r0, r0, r4
    2034:	d2020000 	andle	r0, r2, #0
    2038:	2d000007 	stccs	0, cr0, [r0, #-28]	; 0xffffffe4
    203c:	000012d2 	ldrdeq	r1, [r0], -r2
    2040:	0000129a 	muleq	r0, sl, r2
    2044:	5c035003 	stcpl	0, cr5, [r3], {3}
    2048:	01000001 	tsteq	r0, r1
    204c:	0004123a 	andeq	r1, r4, sl, lsr r2
    2050:	0007db00 	andeq	sp, r7, r0, lsl #22
    2054:	05832200 	streq	r2, [r3, #512]	; 0x200
    2058:	50030000 	andpl	r0, r3, r0
    205c:	00041903 	andeq	r1, r4, r3, lsl #18
    2060:	02000000 	andeq	r0, r0, #0
    2064:	000013b7 			; <UNDEFINED> instruction: 0x000013b7
    2068:	0013c13c 	andseq	ip, r3, ip, lsr r1
    206c:	000aa300 	andeq	sl, sl, r0, lsl #6
    2070:	12cb0300 	sbcne	r0, fp, #0, 6
    2074:	01000004 	tsteq	r0, r4
    2078:	0010ed29 	andseq	lr, r0, r9, lsr #26
    207c:	12cb0300 	sbcne	r0, fp, #0, 6
    2080:	2f000004 	svccs	0x00000004
    2084:	00000d9d 	muleq	r0, sp, sp
    2088:	1a0ccb03 	bne	334c9c <_umb_stack_size+0x333c9c>
    208c:	00000000 	andeq	r0, r0, r0
    2090:	8d020000 	stchi	0, cr0, [r2, #-0]
    2094:	05000007 	streq	r0, [r0, #-7]
    2098:	000012a4 	andeq	r1, r0, r4, lsr #5
    209c:	30020104 	andcc	r0, r2, r4, lsl #2
    20a0:	00000169 	andeq	r0, r0, r9, ror #2
    20a4:	0004123d 	andeq	r1, r4, sp, lsr r2
    20a8:	32000200 	andcc	r0, r0, #0, 4
    20ac:	07943300 	ldreq	r3, [r4, r0, lsl #6]
    20b0:	018d0000 	orreq	r0, sp, r0
    20b4:	00020000 	andeq	r0, r2, r0
    20b8:	33013200 	movwcc	r3, #4608	; 0x1200
    20bc:	00000799 	muleq	r0, r9, r7
    20c0:	0000019f 	muleq	r0, pc, r1	; <UNPREDICTABLE>
    20c4:	00000002 	andeq	r0, r0, r2
    20c8:	00079405 	andeq	r9, r7, r5, lsl #8
    20cc:	02010400 	andeq	r0, r1, #0, 8
    20d0:	0004123a 	andeq	r1, r4, sl, lsr r2
    20d4:	00046800 	andeq	r6, r4, r0, lsl #16
    20d8:	99050000 	stmdbls	r5, {}	; <UNPREDICTABLE>
    20dc:	04000007 	streq	r0, [r0], #-7
    20e0:	123a0201 	eorsne	r0, sl, #268435456	; 0x10000000
    20e4:	68000004 	stmdavs	r0, {r2}
    20e8:	06000004 	streq	r0, [r0], -r4
    20ec:	0000079e 	muleq	r0, lr, r7
    20f0:	00000412 	andeq	r0, r0, r2, lsl r4
    20f4:	00010202 	andeq	r0, r1, r2, lsl #4
    20f8:	4c020000 	stcmi	0, cr0, [r2], {-0}
    20fc:	02000011 	andeq	r0, r0, #17
    2100:	00001367 	andeq	r1, r0, r7, ror #6
    2104:	0013702d 	andseq	r7, r3, sp, lsr #32
    2108:	000a2c00 	andeq	r2, sl, r0, lsl #24
    210c:	02300400 	eorseq	r0, r0, #0, 8
    2110:	00000412 	andeq	r0, r0, r2, lsl r4
    2114:	05832201 	streq	r2, [r3, #513]	; 0x201
    2118:	30040000 	andcc	r0, r4, r0
    211c:	00041202 	andeq	r1, r4, r2, lsl #4
    2120:	0a3a2200 	beq	e8a928 <_umb_stack_size+0xe89928>
    2124:	30040000 	andcc	r0, r4, r0
    2128:	00041202 	andeq	r1, r4, r2, lsl #4
    212c:	00000000 	andeq	r0, r0, r0
    2130:	04b80800 	ldrteq	r0, [r8], #2048	; 0x800
    2134:	04070000 	streq	r0, [r7], #-0
    2138:	0001f627 	andeq	pc, r1, r7, lsr #12
    213c:	0004b100 	andeq	fp, r4, r0, lsl #2
    2140:	00000000 	andeq	r0, r0, r0
    2144:	04540200 	ldrbeq	r0, [r4], #-512	; 0xfffffe00
    2148:	bc3e0000 	ldclt	0, cr0, [lr], #-0
    214c:	f4000004 	vst4.8	{d0-d3}, [r0], r4
    2150:	02000004 	andeq	r0, r0, #4
    2154:	0001f622 	andeq	pc, r1, r2, lsr #12
    2158:	02290100 	eoreq	r0, r9, #0, 2
    215c:	02000005 	andeq	r0, r0, #5
    2160:	0001fd22 	andeq	pc, r1, r2, lsr #26
    2164:	11ff2900 	mvnsne	r2, r0, lsl #18
    2168:	22020000 	andcs	r0, r2, #0
    216c:	000001f6 	strdeq	r0, [r0], -r6
    2170:	05142a23 	ldreq	r2, [r4, #-2595]	; 0xfffff5dd
    2174:	02040000 	andeq	r0, r4, #0
    2178:	0001f623 	andeq	pc, r1, r3, lsr #12
    217c:	282a2300 	stmdacs	sl!, {r8, r9, sp}
    2180:	04000005 	streq	r0, [r0], #-5
    2184:	01f62402 	mvnseq	r2, r2, lsl #8
    2188:	00000000 	andeq	r0, r0, r0
    218c:	08c43600 	stmiaeq	r4, {r9, sl, ip, sp}^
    2190:	08fd0000 	ldmeq	sp!, {}^	; <UNPREDICTABLE>
    2194:	28020000 	stmdacs	r2, {}	; <UNPREDICTABLE>
    2198:	05022901 	streq	r2, [r2, #-2305]	; 0xfffff6ff
    219c:	28020000 	stmdacs	r2, {}	; <UNPREDICTABLE>
    21a0:	000001fd 	strdeq	r0, [r0], -sp
    21a4:	0011ff29 	andseq	pc, r1, r9, lsr #30
    21a8:	f6280200 			; <UNDEFINED> instruction: 0xf6280200
    21ac:	29000001 	stmdbcs	r0, {r0}
    21b0:	00000528 	andeq	r0, r0, r8, lsr #10
    21b4:	01f62802 	mvnseq	r2, r2, lsl #16
    21b8:	2a230000 	bcs	8c21c0 <_umb_stack_size+0x8c11c0>
    21bc:	00000514 	andeq	r0, r0, r4, lsl r5
    21c0:	f6290204 			; <UNDEFINED> instruction: 0xf6290204
    21c4:	00000001 	andeq	r0, r0, r1
    21c8:	090c3600 	stmdbeq	ip, {r9, sl, ip, sp}
    21cc:	09490000 	stmdbeq	r9, {}^	; <UNPREDICTABLE>
    21d0:	32020000 	andcc	r0, r2, #0
    21d4:	05022901 	streq	r2, [r2, #-2305]	; 0xfffff6ff
    21d8:	32020000 	andcc	r0, r2, #0
    21dc:	000001fd 	strdeq	r0, [r0], -sp
    21e0:	0011ff29 	andseq	pc, r1, r9, lsr #30
    21e4:	f6320200 			; <UNDEFINED> instruction: 0xf6320200
    21e8:	2f000001 	svccs	0x00000001
    21ec:	00000958 	andeq	r0, r0, r8, asr r9
    21f0:	00c23202 	sbceq	r3, r2, r2, lsl #4
    21f4:	2a230000 	bcs	8c21fc <_umb_stack_size+0x8c11fc>
    21f8:	0000095c 	andeq	r0, r0, ip, asr r9
    21fc:	f6330204 			; <UNDEFINED> instruction: 0xf6330204
    2200:	00000001 	andeq	r0, r0, r1
    2204:	09643600 	stmdbeq	r4!, {r9, sl, ip, sp}^
    2208:	09a30000 	stmibeq	r3!, {}	; <UNPREDICTABLE>
    220c:	44020000 	strmi	r0, [r2], #-0
    2210:	05022901 	streq	r2, [r2, #-2305]	; 0xfffff6ff
    2214:	44020000 	strmi	r0, [r2], #-0
    2218:	000001fd 	strdeq	r0, [r0], -sp
    221c:	0011ff29 	andseq	pc, r1, r9, lsr #30
    2220:	f6440200 			; <UNDEFINED> instruction: 0xf6440200
    2224:	29000001 	stmdbcs	r0, {r0}
    2228:	00000960 	andeq	r0, r0, r0, ror #18
    222c:	04124402 	ldreq	r4, [r2], #-1026	; 0xfffffbfe
    2230:	13290000 			; <UNDEFINED> instruction: 0x13290000
    2234:	02000012 	andeq	r0, r0, #18
    2238:	0001f644 	andeq	pc, r1, r4, asr #12
    223c:	bc2a2300 	stclt	3, cr2, [sl], #-0
    2240:	02000009 	andeq	r0, r0, #9
    2244:	04124602 	ldreq	r4, [r2], #-1538	; 0xfffff9fe
    2248:	2a230000 	bcs	8c2250 <_umb_stack_size+0x8c1250>
    224c:	000009c7 	andeq	r0, r0, r7, asr #19
    2250:	12470202 	subne	r0, r7, #536870912	; 0x20000000
    2254:	23000004 	movwcs	r0, #4
    2258:	0005932a 	andeq	r9, r5, sl, lsr #6
    225c:	49020200 	stmdbmi	r2, {r9}
    2260:	00000089 	andeq	r0, r0, r9, lsl #1
    2264:	09d32a23 	ldmibeq	r3, {r0, r1, r5, r9, fp, sp}^
    2268:	02020000 	andeq	r0, r2, #0
    226c:	00041249 	andeq	r1, r4, r9, asr #4
    2270:	dd2b2300 	stcle	3, cr2, [fp, #-0]
    2274:	01000009 	tsteq	r0, r9
    2278:	00c24b02 	sbceq	r4, r2, r2, lsl #22
	...
    2284:	000af336 	andeq	pc, sl, r6, lsr r3	; <UNPREDICTABLE>
    2288:	000b2e00 	andeq	r2, fp, r0, lsl #28
    228c:	012d0200 			; <UNDEFINED> instruction: 0x012d0200
    2290:	00050229 	andeq	r0, r5, r9, lsr #4
    2294:	fd2d0200 	stc2	2, cr0, [sp, #-0]
    2298:	29000001 	stmdbcs	r0, {r0}
    229c:	000011ff 	strdeq	r1, [r0], -pc	; <UNPREDICTABLE>
    22a0:	01f62d02 	mvnseq	r2, r2, lsl #26
    22a4:	582f0000 	stmdapl	pc!, {}	; <UNPREDICTABLE>
    22a8:	02000009 	andeq	r0, r0, #9
    22ac:	0000c22d 	andeq	ip, r0, sp, lsr #4
    22b0:	5c2a2300 	stcpl	3, cr2, [sl], #-0
    22b4:	04000009 	streq	r0, [r0], #-9
    22b8:	01f62e02 	mvnseq	r2, r2, lsl #28
    22bc:	00000000 	andeq	r0, r0, r0
    22c0:	000b3f36 	andeq	r3, fp, r6, lsr pc
    22c4:	000b7c00 	andeq	r7, fp, r0, lsl #24
    22c8:	01370200 	teqeq	r7, r0, lsl #4
    22cc:	00050229 	andeq	r0, r5, r9, lsr #4
    22d0:	fd370200 	ldc2	2, cr0, [r7, #-0]
    22d4:	29000001 	stmdbcs	r0, {r0}
    22d8:	000011ff 	strdeq	r1, [r0], -pc	; <UNPREDICTABLE>
    22dc:	01f63702 	mvnseq	r3, r2, lsl #14
    22e0:	60290000 	eorvs	r0, r9, r0
    22e4:	02000009 	andeq	r0, r0, #9
    22e8:	00041237 	andeq	r1, r4, r7, lsr r2
    22ec:	12132900 	andsne	r2, r3, #0, 18
    22f0:	37020000 	strcc	r0, [r2, -r0]
    22f4:	000001f6 	strdeq	r0, [r0], -r6
    22f8:	09bc2a23 	ldmibeq	ip!, {r0, r1, r5, r9, fp, sp}
    22fc:	02020000 	andeq	r0, r2, #0
    2300:	00041239 	andeq	r1, r4, r9, lsr r2
    2304:	c72a2300 	strgt	r2, [sl, -r0, lsl #6]!
    2308:	02000009 	andeq	r0, r0, #9
    230c:	04123a02 	ldreq	r3, [r2], #-2562	; 0xfffff5fe
    2310:	2a230000 	bcs	8c2318 <_umb_stack_size+0x8c1318>
    2314:	00000593 	muleq	r0, r3, r5
    2318:	893c0202 	ldmdbhi	ip!, {r1, r9}
    231c:	23000000 	movwcs	r0, #0
    2320:	0009d32a 	andeq	sp, r9, sl, lsr #6
    2324:	3c020200 	sfmcc	f0, 4, [r2], {-0}
    2328:	00000412 	andeq	r0, r0, r2, lsl r4
    232c:	09dd2b23 	ldmibeq	sp, {r0, r1, r5, r8, r9, fp, sp}^
    2330:	02010000 	andeq	r0, r1, #0
    2334:	0000c23e 	andeq	ip, r0, lr, lsr r2
	...
    2340:	0001f627 	andeq	pc, r1, r7, lsr #12
    2344:	0008bb00 	andeq	fp, r8, r0, lsl #22
    2348:	00000000 	andeq	r0, r0, r0
    234c:	09b80800 	ldmibeq	r8!, {fp}
    2350:	02070000 	andeq	r0, r7, #0
    2354:	00008927 	andeq	r8, r0, r7, lsr #18
    2358:	0012b000 	andseq	fp, r2, r0
    235c:	00000000 	andeq	r0, r0, r0
	...

Disassembly of section .debug_aranges:

00000000 <.debug_aranges>:
   0:	0000001c 	andeq	r0, r0, ip, lsl r0
   4:	00000002 	andeq	r0, r0, r2
   8:	00040000 	andeq	r0, r4, r0
   c:	ffffffff 			; <UNDEFINED> instruction: 0xffffffff
  10:	08000088 	stmdaeq	r0, {r3, r7}
  14:	000002a6 	andeq	r0, r0, r6, lsr #5
	...
  20:	0000001c 	andeq	r0, r0, ip, lsl r0
  24:	1ea30002 	cdpne	0, 10, cr0, cr3, cr2, {0}
  28:	00040000 	andeq	r0, r4, r0
  2c:	ffffffff 			; <UNDEFINED> instruction: 0xffffffff
  30:	08010000 	stmdaeq	r1, {}	; <UNPREDICTABLE>
  34:	00000002 	andeq	r0, r0, r2
	...

Disassembly of section .debug_ranges:

00000000 <.debug_ranges>:
   0:	00000010 	andeq	r0, r0, r0, lsl r0
   4:	00000026 	andeq	r0, r0, r6, lsr #32
   8:	00000056 	andeq	r0, r0, r6, asr r0
   c:	0000005a 	andeq	r0, r0, sl, asr r0
  10:	00000060 	andeq	r0, r0, r0, rrx
  14:	00000064 	andeq	r0, r0, r4, rrx
  18:	00000068 	andeq	r0, r0, r8, rrx
  1c:	0000006a 	andeq	r0, r0, sl, rrx
  20:	00000072 	andeq	r0, r0, r2, ror r0
  24:	00000076 	andeq	r0, r0, r6, ror r0
  28:	0000007c 	andeq	r0, r0, ip, ror r0
  2c:	0000007e 	andeq	r0, r0, lr, ror r0
  30:	00000084 	andeq	r0, r0, r4, lsl #1
  34:	00000088 	andeq	r0, r0, r8, lsl #1
	...
  40:	00000010 	andeq	r0, r0, r0, lsl r0
  44:	00000026 	andeq	r0, r0, r6, lsr #32
  48:	00000056 	andeq	r0, r0, r6, asr r0
  4c:	0000005a 	andeq	r0, r0, sl, asr r0
  50:	00000060 	andeq	r0, r0, r0, rrx
  54:	00000064 	andeq	r0, r0, r4, rrx
  58:	00000068 	andeq	r0, r0, r8, rrx
  5c:	0000006a 	andeq	r0, r0, sl, rrx
  60:	00000072 	andeq	r0, r0, r2, ror r0
  64:	00000076 	andeq	r0, r0, r6, ror r0
  68:	0000007c 	andeq	r0, r0, ip, ror r0
  6c:	0000007e 	andeq	r0, r0, lr, ror r0
  70:	00000084 	andeq	r0, r0, r4, lsl #1
  74:	00000088 	andeq	r0, r0, r8, lsl #1
	...
  80:	00000056 	andeq	r0, r0, r6, asr r0
  84:	00000058 	andeq	r0, r0, r8, asr r0
  88:	00000074 	andeq	r0, r0, r4, ror r0
  8c:	00000076 	andeq	r0, r0, r6, ror r0
  90:	00000086 	andeq	r0, r0, r6, lsl #1
  94:	00000088 	andeq	r0, r0, r8, lsl #1
	...
  a0:	00000056 	andeq	r0, r0, r6, asr r0
  a4:	00000058 	andeq	r0, r0, r8, asr r0
  a8:	00000074 	andeq	r0, r0, r4, ror r0
  ac:	00000076 	andeq	r0, r0, r6, ror r0
  b0:	00000086 	andeq	r0, r0, r6, lsl #1
  b4:	00000088 	andeq	r0, r0, r8, lsl #1
	...
  c0:	00000056 	andeq	r0, r0, r6, asr r0
  c4:	00000058 	andeq	r0, r0, r8, asr r0
  c8:	00000074 	andeq	r0, r0, r4, ror r0
  cc:	00000076 	andeq	r0, r0, r6, ror r0
  d0:	00000086 	andeq	r0, r0, r6, lsl #1
  d4:	00000088 	andeq	r0, r0, r8, lsl #1
	...
  e0:	00000026 	andeq	r0, r0, r6, lsr #32
  e4:	00000056 	andeq	r0, r0, r6, asr r0
  e8:	0000005a 	andeq	r0, r0, sl, asr r0
  ec:	00000060 	andeq	r0, r0, r0, rrx
  f0:	00000064 	andeq	r0, r0, r4, rrx
  f4:	00000068 	andeq	r0, r0, r8, rrx
  f8:	0000006a 	andeq	r0, r0, sl, rrx
  fc:	00000072 	andeq	r0, r0, r2, ror r0
 100:	00000076 	andeq	r0, r0, r6, ror r0
 104:	0000007c 	andeq	r0, r0, ip, ror r0
 108:	0000007e 	andeq	r0, r0, lr, ror r0
 10c:	00000084 	andeq	r0, r0, r4, lsl #1
 110:	00000088 	andeq	r0, r0, r8, lsl #1
 114:	00000094 	muleq	r0, r4, r0
	...
 120:	00000026 	andeq	r0, r0, r6, lsr #32
 124:	0000002a 	andeq	r0, r0, sl, lsr #32
 128:	00000032 	andeq	r0, r0, r2, lsr r0
 12c:	00000038 	andeq	r0, r0, r8, lsr r0
 130:	00000040 	andeq	r0, r0, r0, asr #32
 134:	00000046 	andeq	r0, r0, r6, asr #32
 138:	0000004e 	andeq	r0, r0, lr, asr #32
 13c:	00000054 	andeq	r0, r0, r4, asr r0
 140:	00000064 	andeq	r0, r0, r4, rrx
 144:	00000068 	andeq	r0, r0, r8, rrx
 148:	00000076 	andeq	r0, r0, r6, ror r0
 14c:	0000007a 	andeq	r0, r0, sl, ror r0
 150:	00000088 	andeq	r0, r0, r8, lsl #1
 154:	0000008c 	andeq	r0, r0, ip, lsl #1
	...
 160:	00000026 	andeq	r0, r0, r6, lsr #32
 164:	0000002a 	andeq	r0, r0, sl, lsr #32
 168:	00000032 	andeq	r0, r0, r2, lsr r0
 16c:	00000038 	andeq	r0, r0, r8, lsr r0
 170:	00000040 	andeq	r0, r0, r0, asr #32
 174:	00000046 	andeq	r0, r0, r6, asr #32
 178:	0000004e 	andeq	r0, r0, lr, asr #32
 17c:	00000054 	andeq	r0, r0, r4, asr r0
 180:	00000064 	andeq	r0, r0, r4, rrx
 184:	00000068 	andeq	r0, r0, r8, rrx
 188:	00000076 	andeq	r0, r0, r6, ror r0
 18c:	0000007a 	andeq	r0, r0, sl, ror r0
 190:	00000088 	andeq	r0, r0, r8, lsl #1
 194:	0000008c 	andeq	r0, r0, ip, lsl #1
	...
 1a0:	00000026 	andeq	r0, r0, r6, lsr #32
 1a4:	0000002a 	andeq	r0, r0, sl, lsr #32
 1a8:	00000032 	andeq	r0, r0, r2, lsr r0
 1ac:	00000038 	andeq	r0, r0, r8, lsr r0
 1b0:	00000040 	andeq	r0, r0, r0, asr #32
 1b4:	00000046 	andeq	r0, r0, r6, asr #32
 1b8:	0000004e 	andeq	r0, r0, lr, asr #32
 1bc:	00000054 	andeq	r0, r0, r4, asr r0
 1c0:	00000064 	andeq	r0, r0, r4, rrx
 1c4:	00000068 	andeq	r0, r0, r8, rrx
 1c8:	00000076 	andeq	r0, r0, r6, ror r0
 1cc:	0000007a 	andeq	r0, r0, sl, ror r0
 1d0:	00000088 	andeq	r0, r0, r8, lsl #1
 1d4:	0000008c 	andeq	r0, r0, ip, lsl #1
	...
 1e0:	0000002a 	andeq	r0, r0, sl, lsr #32
 1e4:	00000032 	andeq	r0, r0, r2, lsr r0
 1e8:	00000038 	andeq	r0, r0, r8, lsr r0
 1ec:	00000040 	andeq	r0, r0, r0, asr #32
 1f0:	00000046 	andeq	r0, r0, r6, asr #32
 1f4:	0000004e 	andeq	r0, r0, lr, asr #32
 1f8:	00000054 	andeq	r0, r0, r4, asr r0
 1fc:	00000056 	andeq	r0, r0, r6, asr r0
 200:	0000005a 	andeq	r0, r0, sl, asr r0
 204:	00000060 	andeq	r0, r0, r0, rrx
 208:	0000006a 	andeq	r0, r0, sl, rrx
 20c:	00000072 	andeq	r0, r0, r2, ror r0
 210:	0000007a 	andeq	r0, r0, sl, ror r0
 214:	0000007c 	andeq	r0, r0, ip, ror r0
 218:	0000007e 	andeq	r0, r0, lr, ror r0
 21c:	00000084 	andeq	r0, r0, r4, lsl #1
 220:	0000008c 	andeq	r0, r0, ip, lsl #1
 224:	00000094 	muleq	r0, r4, r0
	...
 230:	0000002a 	andeq	r0, r0, sl, lsr #32
 234:	00000032 	andeq	r0, r0, r2, lsr r0
 238:	00000038 	andeq	r0, r0, r8, lsr r0
 23c:	00000040 	andeq	r0, r0, r0, asr #32
 240:	00000046 	andeq	r0, r0, r6, asr #32
 244:	0000004e 	andeq	r0, r0, lr, asr #32
 248:	00000054 	andeq	r0, r0, r4, asr r0
 24c:	00000056 	andeq	r0, r0, r6, asr r0
 250:	0000005a 	andeq	r0, r0, sl, asr r0
 254:	00000060 	andeq	r0, r0, r0, rrx
 258:	0000006a 	andeq	r0, r0, sl, rrx
 25c:	00000072 	andeq	r0, r0, r2, ror r0
 260:	0000007a 	andeq	r0, r0, sl, ror r0
 264:	0000007c 	andeq	r0, r0, ip, ror r0
 268:	0000007e 	andeq	r0, r0, lr, ror r0
 26c:	00000084 	andeq	r0, r0, r4, lsl #1
 270:	0000008c 	andeq	r0, r0, ip, lsl #1
 274:	00000094 	muleq	r0, r4, r0
	...
 280:	0000002a 	andeq	r0, r0, sl, lsr #32
 284:	00000032 	andeq	r0, r0, r2, lsr r0
 288:	00000038 	andeq	r0, r0, r8, lsr r0
 28c:	00000040 	andeq	r0, r0, r0, asr #32
 290:	00000046 	andeq	r0, r0, r6, asr #32
 294:	0000004e 	andeq	r0, r0, lr, asr #32
 298:	00000054 	andeq	r0, r0, r4, asr r0
 29c:	00000056 	andeq	r0, r0, r6, asr r0
 2a0:	0000005a 	andeq	r0, r0, sl, asr r0
 2a4:	00000060 	andeq	r0, r0, r0, rrx
 2a8:	0000006a 	andeq	r0, r0, sl, rrx
 2ac:	00000072 	andeq	r0, r0, r2, ror r0
 2b0:	0000007a 	andeq	r0, r0, sl, ror r0
 2b4:	0000007c 	andeq	r0, r0, ip, ror r0
 2b8:	0000007e 	andeq	r0, r0, lr, ror r0
 2bc:	00000084 	andeq	r0, r0, r4, lsl #1
 2c0:	0000008c 	andeq	r0, r0, ip, lsl #1
 2c4:	00000094 	muleq	r0, r4, r0
	...
 2d0:	0000002a 	andeq	r0, r0, sl, lsr #32
 2d4:	00000032 	andeq	r0, r0, r2, lsr r0
 2d8:	00000038 	andeq	r0, r0, r8, lsr r0
 2dc:	00000040 	andeq	r0, r0, r0, asr #32
 2e0:	00000046 	andeq	r0, r0, r6, asr #32
 2e4:	0000004e 	andeq	r0, r0, lr, asr #32
 2e8:	00000054 	andeq	r0, r0, r4, asr r0
 2ec:	00000056 	andeq	r0, r0, r6, asr r0
 2f0:	0000005a 	andeq	r0, r0, sl, asr r0
 2f4:	00000060 	andeq	r0, r0, r0, rrx
 2f8:	0000006a 	andeq	r0, r0, sl, rrx
 2fc:	00000072 	andeq	r0, r0, r2, ror r0
 300:	0000007a 	andeq	r0, r0, sl, ror r0
 304:	0000007c 	andeq	r0, r0, ip, ror r0
 308:	0000007e 	andeq	r0, r0, lr, ror r0
 30c:	00000084 	andeq	r0, r0, r4, lsl #1
 310:	0000008c 	andeq	r0, r0, ip, lsl #1
 314:	00000094 	muleq	r0, r4, r0
	...
 320:	0000002a 	andeq	r0, r0, sl, lsr #32
 324:	00000032 	andeq	r0, r0, r2, lsr r0
 328:	00000038 	andeq	r0, r0, r8, lsr r0
 32c:	00000040 	andeq	r0, r0, r0, asr #32
 330:	00000046 	andeq	r0, r0, r6, asr #32
 334:	0000004e 	andeq	r0, r0, lr, asr #32
 338:	00000054 	andeq	r0, r0, r4, asr r0
 33c:	00000056 	andeq	r0, r0, r6, asr r0
 340:	0000005a 	andeq	r0, r0, sl, asr r0
 344:	00000060 	andeq	r0, r0, r0, rrx
 348:	0000006a 	andeq	r0, r0, sl, rrx
 34c:	00000072 	andeq	r0, r0, r2, ror r0
 350:	0000007a 	andeq	r0, r0, sl, ror r0
 354:	0000007c 	andeq	r0, r0, ip, ror r0
 358:	0000007e 	andeq	r0, r0, lr, ror r0
 35c:	00000084 	andeq	r0, r0, r4, lsl #1
 360:	0000008c 	andeq	r0, r0, ip, lsl #1
 364:	00000094 	muleq	r0, r4, r0
	...
 370:	0000002a 	andeq	r0, r0, sl, lsr #32
 374:	00000032 	andeq	r0, r0, r2, lsr r0
 378:	00000038 	andeq	r0, r0, r8, lsr r0
 37c:	00000040 	andeq	r0, r0, r0, asr #32
 380:	00000046 	andeq	r0, r0, r6, asr #32
 384:	0000004e 	andeq	r0, r0, lr, asr #32
 388:	00000054 	andeq	r0, r0, r4, asr r0
 38c:	00000056 	andeq	r0, r0, r6, asr r0
 390:	0000005a 	andeq	r0, r0, sl, asr r0
 394:	00000060 	andeq	r0, r0, r0, rrx
 398:	0000006a 	andeq	r0, r0, sl, rrx
 39c:	00000072 	andeq	r0, r0, r2, ror r0
 3a0:	0000007a 	andeq	r0, r0, sl, ror r0
 3a4:	0000007c 	andeq	r0, r0, ip, ror r0
 3a8:	0000007e 	andeq	r0, r0, lr, ror r0
 3ac:	00000084 	andeq	r0, r0, r4, lsl #1
 3b0:	0000008c 	andeq	r0, r0, ip, lsl #1
 3b4:	00000094 	muleq	r0, r4, r0
	...
 3c0:	0000002a 	andeq	r0, r0, sl, lsr #32
 3c4:	00000032 	andeq	r0, r0, r2, lsr r0
 3c8:	00000038 	andeq	r0, r0, r8, lsr r0
 3cc:	00000040 	andeq	r0, r0, r0, asr #32
 3d0:	00000046 	andeq	r0, r0, r6, asr #32
 3d4:	0000004e 	andeq	r0, r0, lr, asr #32
 3d8:	00000054 	andeq	r0, r0, r4, asr r0
 3dc:	00000056 	andeq	r0, r0, r6, asr r0
 3e0:	0000005a 	andeq	r0, r0, sl, asr r0
 3e4:	00000060 	andeq	r0, r0, r0, rrx
 3e8:	0000006a 	andeq	r0, r0, sl, rrx
 3ec:	00000072 	andeq	r0, r0, r2, ror r0
 3f0:	0000007a 	andeq	r0, r0, sl, ror r0
 3f4:	0000007c 	andeq	r0, r0, ip, ror r0
 3f8:	0000007e 	andeq	r0, r0, lr, ror r0
 3fc:	00000084 	andeq	r0, r0, r4, lsl #1
 400:	0000008c 	andeq	r0, r0, ip, lsl #1
 404:	00000094 	muleq	r0, r4, r0
	...
 410:	0000002a 	andeq	r0, r0, sl, lsr #32
 414:	0000002c 	andeq	r0, r0, ip, lsr #32
 418:	00000038 	andeq	r0, r0, r8, lsr r0
 41c:	0000003a 	andeq	r0, r0, sl, lsr r0
 420:	00000046 	andeq	r0, r0, r6, asr #32
 424:	00000048 	andeq	r0, r0, r8, asr #32
 428:	00000054 	andeq	r0, r0, r4, asr r0
 42c:	00000056 	andeq	r0, r0, r6, asr r0
 430:	0000006a 	andeq	r0, r0, sl, rrx
 434:	0000006c 	andeq	r0, r0, ip, rrx
 438:	0000007a 	andeq	r0, r0, sl, ror r0
 43c:	0000007c 	andeq	r0, r0, ip, ror r0
 440:	0000008c 	andeq	r0, r0, ip, lsl #1
 444:	0000008e 	andeq	r0, r0, lr, lsl #1
	...
 450:	0000002a 	andeq	r0, r0, sl, lsr #32
 454:	0000002c 	andeq	r0, r0, ip, lsr #32
 458:	00000038 	andeq	r0, r0, r8, lsr r0
 45c:	0000003a 	andeq	r0, r0, sl, lsr r0
 460:	00000046 	andeq	r0, r0, r6, asr #32
 464:	00000048 	andeq	r0, r0, r8, asr #32
 468:	00000054 	andeq	r0, r0, r4, asr r0
 46c:	00000056 	andeq	r0, r0, r6, asr r0
 470:	0000006a 	andeq	r0, r0, sl, rrx
 474:	0000006c 	andeq	r0, r0, ip, rrx
 478:	0000007a 	andeq	r0, r0, sl, ror r0
 47c:	0000007c 	andeq	r0, r0, ip, ror r0
 480:	0000008c 	andeq	r0, r0, ip, lsl #1
 484:	0000008e 	andeq	r0, r0, lr, lsl #1
	...
 490:	0000002a 	andeq	r0, r0, sl, lsr #32
 494:	0000002c 	andeq	r0, r0, ip, lsr #32
 498:	00000038 	andeq	r0, r0, r8, lsr r0
 49c:	0000003a 	andeq	r0, r0, sl, lsr r0
 4a0:	00000046 	andeq	r0, r0, r6, asr #32
 4a4:	00000048 	andeq	r0, r0, r8, asr #32
 4a8:	00000054 	andeq	r0, r0, r4, asr r0
 4ac:	00000056 	andeq	r0, r0, r6, asr r0
 4b0:	0000006a 	andeq	r0, r0, sl, rrx
 4b4:	0000006c 	andeq	r0, r0, ip, rrx
 4b8:	0000007a 	andeq	r0, r0, sl, ror r0
 4bc:	0000007c 	andeq	r0, r0, ip, ror r0
 4c0:	0000008c 	andeq	r0, r0, ip, lsl #1
 4c4:	0000008e 	andeq	r0, r0, lr, lsl #1
	...
 4d0:	0000002c 	andeq	r0, r0, ip, lsr #32
 4d4:	00000032 	andeq	r0, r0, r2, lsr r0
 4d8:	0000003a 	andeq	r0, r0, sl, lsr r0
 4dc:	00000040 	andeq	r0, r0, r0, asr #32
 4e0:	00000048 	andeq	r0, r0, r8, asr #32
 4e4:	0000004e 	andeq	r0, r0, lr, asr #32
 4e8:	0000005a 	andeq	r0, r0, sl, asr r0
 4ec:	00000060 	andeq	r0, r0, r0, rrx
 4f0:	0000006c 	andeq	r0, r0, ip, rrx
 4f4:	00000072 	andeq	r0, r0, r2, ror r0
 4f8:	0000007e 	andeq	r0, r0, lr, ror r0
 4fc:	00000084 	andeq	r0, r0, r4, lsl #1
 500:	0000008e 	andeq	r0, r0, lr, lsl #1
 504:	00000094 	muleq	r0, r4, r0
	...
 510:	00000030 	andeq	r0, r0, r0, lsr r0
 514:	00000032 	andeq	r0, r0, r2, lsr r0
 518:	0000003e 	andeq	r0, r0, lr, lsr r0
 51c:	00000040 	andeq	r0, r0, r0, asr #32
 520:	0000004c 	andeq	r0, r0, ip, asr #32
 524:	0000004e 	andeq	r0, r0, lr, asr #32
 528:	0000005e 	andeq	r0, r0, lr, asr r0
 52c:	00000060 	andeq	r0, r0, r0, rrx
 530:	00000070 	andeq	r0, r0, r0, ror r0
 534:	00000072 	andeq	r0, r0, r2, ror r0
 538:	00000082 	andeq	r0, r0, r2, lsl #1
 53c:	00000084 	andeq	r0, r0, r4, lsl #1
 540:	00000092 	muleq	r0, r2, r0
 544:	00000094 	muleq	r0, r4, r0
	...
 550:	00000030 	andeq	r0, r0, r0, lsr r0
 554:	00000032 	andeq	r0, r0, r2, lsr r0
 558:	0000003e 	andeq	r0, r0, lr, lsr r0
 55c:	00000040 	andeq	r0, r0, r0, asr #32
 560:	0000004c 	andeq	r0, r0, ip, asr #32
 564:	0000004e 	andeq	r0, r0, lr, asr #32
 568:	0000005e 	andeq	r0, r0, lr, asr r0
 56c:	00000060 	andeq	r0, r0, r0, rrx
 570:	00000070 	andeq	r0, r0, r0, ror r0
 574:	00000072 	andeq	r0, r0, r2, ror r0
 578:	00000082 	andeq	r0, r0, r2, lsl #1
 57c:	00000084 	andeq	r0, r0, r4, lsl #1
 580:	00000092 	muleq	r0, r2, r0
 584:	00000094 	muleq	r0, r4, r0
	...
 590:	00000030 	andeq	r0, r0, r0, lsr r0
 594:	00000032 	andeq	r0, r0, r2, lsr r0
 598:	0000003e 	andeq	r0, r0, lr, lsr r0
 59c:	00000040 	andeq	r0, r0, r0, asr #32
 5a0:	0000004c 	andeq	r0, r0, ip, asr #32
 5a4:	0000004e 	andeq	r0, r0, lr, asr #32
 5a8:	0000005e 	andeq	r0, r0, lr, asr r0
 5ac:	00000060 	andeq	r0, r0, r0, rrx
 5b0:	00000070 	andeq	r0, r0, r0, ror r0
 5b4:	00000072 	andeq	r0, r0, r2, ror r0
 5b8:	00000082 	andeq	r0, r0, r2, lsl #1
 5bc:	00000084 	andeq	r0, r0, r4, lsl #1
 5c0:	00000092 	muleq	r0, r2, r0
 5c4:	00000094 	muleq	r0, r4, r0
	...
 5d0:	000000b6 	strheq	r0, [r0], -r6
 5d4:	000000b8 	strheq	r0, [r0], -r8
 5d8:	000000be 	strheq	r0, [r0], -lr
 5dc:	000000c6 	andeq	r0, r0, r6, asr #1
 5e0:	000000d0 	ldrdeq	r0, [r0], -r0	; <UNPREDICTABLE>
 5e4:	000000d4 	ldrdeq	r0, [r0], -r4
 5e8:	000000e0 	andeq	r0, r0, r0, ror #1
 5ec:	000000e4 	andeq	r0, r0, r4, ror #1
 5f0:	000000f0 	strdeq	r0, [r0], -r0	; <UNPREDICTABLE>
 5f4:	000000f4 	strdeq	r0, [r0], -r4
	...
 600:	000000b6 	strheq	r0, [r0], -r6
 604:	000000b8 	strheq	r0, [r0], -r8
 608:	000000be 	strheq	r0, [r0], -lr
 60c:	000000c6 	andeq	r0, r0, r6, asr #1
 610:	000000d0 	ldrdeq	r0, [r0], -r0	; <UNPREDICTABLE>
 614:	000000d4 	ldrdeq	r0, [r0], -r4
 618:	000000e0 	andeq	r0, r0, r0, ror #1
 61c:	000000e4 	andeq	r0, r0, r4, ror #1
 620:	000000f0 	strdeq	r0, [r0], -r0	; <UNPREDICTABLE>
 624:	000000f4 	strdeq	r0, [r0], -r4
	...
 630:	000000b6 	strheq	r0, [r0], -r6
 634:	000000b8 	strheq	r0, [r0], -r8
 638:	000000be 	strheq	r0, [r0], -lr
 63c:	000000c0 	andeq	r0, r0, r0, asr #1
	...
 648:	000000c6 	andeq	r0, r0, r6, asr #1
 64c:	000000d0 	ldrdeq	r0, [r0], -r0	; <UNPREDICTABLE>
 650:	000000d6 	ldrdeq	r0, [r0], -r6
 654:	000000e0 	andeq	r0, r0, r0, ror #1
 658:	000000e6 	andeq	r0, r0, r6, ror #1
 65c:	000000f0 	strdeq	r0, [r0], -r0	; <UNPREDICTABLE>
 660:	000000f6 	strdeq	r0, [r0], -r6
 664:	00000102 	andeq	r0, r0, r2, lsl #2
	...
 670:	000000c6 	andeq	r0, r0, r6, asr #1
 674:	000000ca 	andeq	r0, r0, sl, asr #1
 678:	000000d6 	ldrdeq	r0, [r0], -r6
 67c:	000000da 	ldrdeq	r0, [r0], -sl
 680:	000000e6 	andeq	r0, r0, r6, ror #1
 684:	000000ea 	andeq	r0, r0, sl, ror #1
 688:	000000f6 	strdeq	r0, [r0], -r6
 68c:	000000fa 	strdeq	r0, [r0], -sl
	...
 698:	000000c6 	andeq	r0, r0, r6, asr #1
 69c:	000000ca 	andeq	r0, r0, sl, asr #1
 6a0:	000000d6 	ldrdeq	r0, [r0], -r6
 6a4:	000000da 	ldrdeq	r0, [r0], -sl
 6a8:	000000e6 	andeq	r0, r0, r6, ror #1
 6ac:	000000ea 	andeq	r0, r0, sl, ror #1
 6b0:	000000f6 	strdeq	r0, [r0], -r6
 6b4:	000000fa 	strdeq	r0, [r0], -sl
	...
 6c0:	000000c6 	andeq	r0, r0, r6, asr #1
 6c4:	000000ca 	andeq	r0, r0, sl, asr #1
 6c8:	000000d6 	ldrdeq	r0, [r0], -r6
 6cc:	000000da 	ldrdeq	r0, [r0], -sl
 6d0:	000000e6 	andeq	r0, r0, r6, ror #1
 6d4:	000000ea 	andeq	r0, r0, sl, ror #1
 6d8:	000000f6 	strdeq	r0, [r0], -r6
 6dc:	000000fa 	strdeq	r0, [r0], -sl
	...
 6e8:	000000ca 	andeq	r0, r0, sl, asr #1
 6ec:	000000cc 	andeq	r0, r0, ip, asr #1
 6f0:	000000da 	ldrdeq	r0, [r0], -sl
 6f4:	000000dc 	ldrdeq	r0, [r0], -ip
 6f8:	000000ea 	andeq	r0, r0, sl, ror #1
 6fc:	000000ec 	andeq	r0, r0, ip, ror #1
 700:	000000fa 	strdeq	r0, [r0], -sl
 704:	000000fc 	strdeq	r0, [r0], -ip
	...
 710:	000000ca 	andeq	r0, r0, sl, asr #1
 714:	000000cc 	andeq	r0, r0, ip, asr #1
 718:	000000da 	ldrdeq	r0, [r0], -sl
 71c:	000000dc 	ldrdeq	r0, [r0], -ip
 720:	000000ea 	andeq	r0, r0, sl, ror #1
 724:	000000ec 	andeq	r0, r0, ip, ror #1
 728:	000000fa 	strdeq	r0, [r0], -sl
 72c:	000000fc 	strdeq	r0, [r0], -ip
	...
 738:	000000ca 	andeq	r0, r0, sl, asr #1
 73c:	000000cc 	andeq	r0, r0, ip, asr #1
 740:	000000da 	ldrdeq	r0, [r0], -sl
 744:	000000dc 	ldrdeq	r0, [r0], -ip
 748:	000000ea 	andeq	r0, r0, sl, ror #1
 74c:	000000ec 	andeq	r0, r0, ip, ror #1
 750:	000000fa 	strdeq	r0, [r0], -sl
 754:	000000fc 	strdeq	r0, [r0], -ip
	...
 760:	00000128 	andeq	r0, r0, r8, lsr #2
 764:	0000012a 	andeq	r0, r0, sl, lsr #2
 768:	00000130 	andeq	r0, r0, r0, lsr r1
 76c:	00000138 	andeq	r0, r0, r8, lsr r1
 770:	00000142 	andeq	r0, r0, r2, asr #2
 774:	00000146 	andeq	r0, r0, r6, asr #2
 778:	00000152 	andeq	r0, r0, r2, asr r1
 77c:	00000156 	andeq	r0, r0, r6, asr r1
 780:	00000162 	andeq	r0, r0, r2, ror #2
 784:	00000166 	andeq	r0, r0, r6, ror #2
	...
 790:	00000128 	andeq	r0, r0, r8, lsr #2
 794:	0000012a 	andeq	r0, r0, sl, lsr #2
 798:	00000130 	andeq	r0, r0, r0, lsr r1
 79c:	00000138 	andeq	r0, r0, r8, lsr r1
 7a0:	00000142 	andeq	r0, r0, r2, asr #2
 7a4:	00000146 	andeq	r0, r0, r6, asr #2
 7a8:	00000152 	andeq	r0, r0, r2, asr r1
 7ac:	00000156 	andeq	r0, r0, r6, asr r1
 7b0:	00000162 	andeq	r0, r0, r2, ror #2
 7b4:	00000166 	andeq	r0, r0, r6, ror #2
	...
 7c0:	00000128 	andeq	r0, r0, r8, lsr #2
 7c4:	0000012a 	andeq	r0, r0, sl, lsr #2
 7c8:	00000130 	andeq	r0, r0, r0, lsr r1
 7cc:	00000132 	andeq	r0, r0, r2, lsr r1
	...
 7d8:	00000138 	andeq	r0, r0, r8, lsr r1
 7dc:	00000142 	andeq	r0, r0, r2, asr #2
 7e0:	00000148 	andeq	r0, r0, r8, asr #2
 7e4:	00000152 	andeq	r0, r0, r2, asr r1
 7e8:	00000158 	andeq	r0, r0, r8, asr r1
 7ec:	00000162 	andeq	r0, r0, r2, ror #2
 7f0:	00000168 	andeq	r0, r0, r8, ror #2
 7f4:	00000174 	andeq	r0, r0, r4, ror r1
	...
 800:	00000138 	andeq	r0, r0, r8, lsr r1
 804:	0000013c 	andeq	r0, r0, ip, lsr r1
 808:	00000148 	andeq	r0, r0, r8, asr #2
 80c:	0000014c 	andeq	r0, r0, ip, asr #2
 810:	00000158 	andeq	r0, r0, r8, asr r1
 814:	0000015c 	andeq	r0, r0, ip, asr r1
 818:	00000168 	andeq	r0, r0, r8, ror #2
 81c:	0000016c 	andeq	r0, r0, ip, ror #2
	...
 828:	00000138 	andeq	r0, r0, r8, lsr r1
 82c:	0000013c 	andeq	r0, r0, ip, lsr r1
 830:	00000148 	andeq	r0, r0, r8, asr #2
 834:	0000014c 	andeq	r0, r0, ip, asr #2
 838:	00000158 	andeq	r0, r0, r8, asr r1
 83c:	0000015c 	andeq	r0, r0, ip, asr r1
 840:	00000168 	andeq	r0, r0, r8, ror #2
 844:	0000016c 	andeq	r0, r0, ip, ror #2
	...
 850:	00000138 	andeq	r0, r0, r8, lsr r1
 854:	0000013c 	andeq	r0, r0, ip, lsr r1
 858:	00000148 	andeq	r0, r0, r8, asr #2
 85c:	0000014c 	andeq	r0, r0, ip, asr #2
 860:	00000158 	andeq	r0, r0, r8, asr r1
 864:	0000015c 	andeq	r0, r0, ip, asr r1
 868:	00000168 	andeq	r0, r0, r8, ror #2
 86c:	0000016c 	andeq	r0, r0, ip, ror #2
	...
 878:	0000013c 	andeq	r0, r0, ip, lsr r1
 87c:	0000013e 	andeq	r0, r0, lr, lsr r1
 880:	0000014c 	andeq	r0, r0, ip, asr #2
 884:	0000014e 	andeq	r0, r0, lr, asr #2
 888:	0000015c 	andeq	r0, r0, ip, asr r1
 88c:	0000015e 	andeq	r0, r0, lr, asr r1
 890:	0000016c 	andeq	r0, r0, ip, ror #2
 894:	0000016e 	andeq	r0, r0, lr, ror #2
	...
 8a0:	0000013c 	andeq	r0, r0, ip, lsr r1
 8a4:	0000013e 	andeq	r0, r0, lr, lsr r1
 8a8:	0000014c 	andeq	r0, r0, ip, asr #2
 8ac:	0000014e 	andeq	r0, r0, lr, asr #2
 8b0:	0000015c 	andeq	r0, r0, ip, asr r1
 8b4:	0000015e 	andeq	r0, r0, lr, asr r1
 8b8:	0000016c 	andeq	r0, r0, ip, ror #2
 8bc:	0000016e 	andeq	r0, r0, lr, ror #2
	...
 8c8:	0000013c 	andeq	r0, r0, ip, lsr r1
 8cc:	0000013e 	andeq	r0, r0, lr, lsr r1
 8d0:	0000014c 	andeq	r0, r0, ip, asr #2
 8d4:	0000014e 	andeq	r0, r0, lr, asr #2
 8d8:	0000015c 	andeq	r0, r0, ip, asr r1
 8dc:	0000015e 	andeq	r0, r0, lr, asr r1
 8e0:	0000016c 	andeq	r0, r0, ip, ror #2
 8e4:	0000016e 	andeq	r0, r0, lr, ror #2
	...
 8f0:	000001ac 	andeq	r0, r0, ip, lsr #3
 8f4:	000001b0 			; <UNDEFINED> instruction: 0x000001b0
 8f8:	000001b4 			; <UNDEFINED> instruction: 0x000001b4
 8fc:	000001ba 			; <UNDEFINED> instruction: 0x000001ba
	...
 908:	000001ac 	andeq	r0, r0, ip, lsr #3
 90c:	000001b0 			; <UNDEFINED> instruction: 0x000001b0
 910:	000001b4 			; <UNDEFINED> instruction: 0x000001b4
 914:	000001ba 			; <UNDEFINED> instruction: 0x000001ba
	...
 920:	000001b0 			; <UNDEFINED> instruction: 0x000001b0
 924:	000001b4 			; <UNDEFINED> instruction: 0x000001b4
 928:	000001ba 			; <UNDEFINED> instruction: 0x000001ba
 92c:	0000022a 	andeq	r0, r0, sl, lsr #4
	...
 938:	000001be 			; <UNDEFINED> instruction: 0x000001be
 93c:	000001c6 	andeq	r0, r0, r6, asr #3
 940:	000001ca 	andeq	r0, r0, sl, asr #3
 944:	000001d0 	ldrdeq	r0, [r0], -r0	; <UNPREDICTABLE>
 948:	000001da 	ldrdeq	r0, [r0], -sl
 94c:	000001de 	ldrdeq	r0, [r0], -lr
 950:	000001e2 	andeq	r0, r0, r2, ror #3
 954:	0000022a 	andeq	r0, r0, sl, lsr #4
	...
 960:	000001be 			; <UNDEFINED> instruction: 0x000001be
 964:	000001c6 	andeq	r0, r0, r6, asr #3
 968:	000001ca 	andeq	r0, r0, sl, asr #3
 96c:	000001d0 	ldrdeq	r0, [r0], -r0	; <UNPREDICTABLE>
 970:	000001da 	ldrdeq	r0, [r0], -sl
 974:	000001de 	ldrdeq	r0, [r0], -lr
 978:	000001e2 	andeq	r0, r0, r2, ror #3
 97c:	0000022a 	andeq	r0, r0, sl, lsr #4
	...
 988:	000001be 			; <UNDEFINED> instruction: 0x000001be
 98c:	000001c6 	andeq	r0, r0, r6, asr #3
 990:	000001ca 	andeq	r0, r0, sl, asr #3
 994:	000001d0 	ldrdeq	r0, [r0], -r0	; <UNPREDICTABLE>
 998:	000001da 	ldrdeq	r0, [r0], -sl
 99c:	000001de 	ldrdeq	r0, [r0], -lr
 9a0:	000001e2 	andeq	r0, r0, r2, ror #3
 9a4:	0000022a 	andeq	r0, r0, sl, lsr #4
	...
 9b0:	000001e6 	andeq	r0, r0, r6, ror #3
 9b4:	00000214 	andeq	r0, r0, r4, lsl r2
 9b8:	00000218 	andeq	r0, r0, r8, lsl r2
 9bc:	00000226 	andeq	r0, r0, r6, lsr #4
 9c0:	00000228 	andeq	r0, r0, r8, lsr #4
 9c4:	0000022a 	andeq	r0, r0, sl, lsr #4
	...
 9d0:	000001ec 	andeq	r0, r0, ip, ror #3
 9d4:	000001f8 	strdeq	r0, [r0], -r8
 9d8:	000001fe 	strdeq	r0, [r0], -lr
 9dc:	00000206 	andeq	r0, r0, r6, lsl #4
 9e0:	0000020c 	andeq	r0, r0, ip, lsl #4
 9e4:	00000214 	andeq	r0, r0, r4, lsl r2
 9e8:	0000021e 	andeq	r0, r0, lr, lsl r2
 9ec:	00000226 	andeq	r0, r0, r6, lsr #4
	...
 9f8:	000001ec 	andeq	r0, r0, ip, ror #3
 9fc:	000001f8 	strdeq	r0, [r0], -r8
 a00:	000001fe 	strdeq	r0, [r0], -lr
 a04:	00000206 	andeq	r0, r0, r6, lsl #4
 a08:	0000020c 	andeq	r0, r0, ip, lsl #4
 a0c:	00000214 	andeq	r0, r0, r4, lsl r2
 a10:	0000021e 	andeq	r0, r0, lr, lsl r2
 a14:	00000226 	andeq	r0, r0, r6, lsr #4
	...
 a20:	000001ec 	andeq	r0, r0, ip, ror #3
 a24:	000001f2 	strdeq	r0, [r0], -r2
 a28:	000001fe 	strdeq	r0, [r0], -lr
 a2c:	00000202 	andeq	r0, r0, r2, lsl #4
 a30:	0000020c 	andeq	r0, r0, ip, lsl #4
 a34:	00000210 	andeq	r0, r0, r0, lsl r2
 a38:	0000021e 	andeq	r0, r0, lr, lsl r2
 a3c:	00000222 	andeq	r0, r0, r2, lsr #4
	...
 a48:	000001ec 	andeq	r0, r0, ip, ror #3
 a4c:	000001f2 	strdeq	r0, [r0], -r2
 a50:	000001fe 	strdeq	r0, [r0], -lr
 a54:	00000202 	andeq	r0, r0, r2, lsl #4
 a58:	0000020c 	andeq	r0, r0, ip, lsl #4
 a5c:	00000210 	andeq	r0, r0, r0, lsl r2
 a60:	0000021e 	andeq	r0, r0, lr, lsl r2
 a64:	00000222 	andeq	r0, r0, r2, lsr #4
	...
 a70:	000001ec 	andeq	r0, r0, ip, ror #3
 a74:	000001f2 	strdeq	r0, [r0], -r2
 a78:	000001fe 	strdeq	r0, [r0], -lr
 a7c:	00000202 	andeq	r0, r0, r2, lsl #4
 a80:	0000020c 	andeq	r0, r0, ip, lsl #4
 a84:	00000210 	andeq	r0, r0, r0, lsl r2
 a88:	0000021e 	andeq	r0, r0, lr, lsl r2
 a8c:	00000222 	andeq	r0, r0, r2, lsr #4
	...
 a98:	000001f2 	strdeq	r0, [r0], -r2
 a9c:	000001f8 	strdeq	r0, [r0], -r8
 aa0:	00000202 	andeq	r0, r0, r2, lsl #4
 aa4:	00000206 	andeq	r0, r0, r6, lsl #4
 aa8:	00000210 	andeq	r0, r0, r0, lsl r2
 aac:	00000214 	andeq	r0, r0, r4, lsl r2
 ab0:	00000222 	andeq	r0, r0, r2, lsr #4
 ab4:	00000226 	andeq	r0, r0, r6, lsr #4
	...
 ac0:	000001f6 	strdeq	r0, [r0], -r6
 ac4:	000001f8 	strdeq	r0, [r0], -r8
 ac8:	00000204 	andeq	r0, r0, r4, lsl #4
 acc:	00000206 	andeq	r0, r0, r6, lsl #4
 ad0:	00000212 	andeq	r0, r0, r2, lsl r2
 ad4:	00000214 	andeq	r0, r0, r4, lsl r2
 ad8:	00000224 	andeq	r0, r0, r4, lsr #4
 adc:	00000226 	andeq	r0, r0, r6, lsr #4
	...
 ae8:	000001f6 	strdeq	r0, [r0], -r6
 aec:	000001f8 	strdeq	r0, [r0], -r8
 af0:	00000204 	andeq	r0, r0, r4, lsl #4
 af4:	00000206 	andeq	r0, r0, r6, lsl #4
 af8:	00000212 	andeq	r0, r0, r2, lsl r2
 afc:	00000214 	andeq	r0, r0, r4, lsl r2
 b00:	00000224 	andeq	r0, r0, r4, lsr #4
 b04:	00000226 	andeq	r0, r0, r6, lsr #4
	...
 b10:	000001f6 	strdeq	r0, [r0], -r6
 b14:	000001f8 	strdeq	r0, [r0], -r8
 b18:	00000204 	andeq	r0, r0, r4, lsl #4
 b1c:	00000206 	andeq	r0, r0, r6, lsl #4
 b20:	00000212 	andeq	r0, r0, r2, lsl r2
 b24:	00000214 	andeq	r0, r0, r4, lsl r2
 b28:	00000224 	andeq	r0, r0, r4, lsr #4
 b2c:	00000226 	andeq	r0, r0, r6, lsr #4
	...
 b38:	00000214 	andeq	r0, r0, r4, lsl r2
 b3c:	00000218 	andeq	r0, r0, r8, lsl r2
 b40:	00000226 	andeq	r0, r0, r6, lsr #4
 b44:	00000228 	andeq	r0, r0, r8, lsr #4
	...
 b50:	00000214 	andeq	r0, r0, r4, lsl r2
 b54:	00000218 	andeq	r0, r0, r8, lsl r2
 b58:	00000226 	andeq	r0, r0, r6, lsr #4
 b5c:	00000228 	andeq	r0, r0, r8, lsr #4
	...
 b68:	0000023c 	andeq	r0, r0, ip, lsr r2
 b6c:	0000023e 	andeq	r0, r0, lr, lsr r2
 b70:	00000244 	andeq	r0, r0, r4, asr #4
 b74:	0000024c 	andeq	r0, r0, ip, asr #4
 b78:	00000256 	andeq	r0, r0, r6, asr r2
 b7c:	0000025a 	andeq	r0, r0, sl, asr r2
 b80:	00000266 	andeq	r0, r0, r6, ror #4
 b84:	0000026a 	andeq	r0, r0, sl, ror #4
 b88:	00000276 	andeq	r0, r0, r6, ror r2
 b8c:	0000027a 	andeq	r0, r0, sl, ror r2
	...
 b98:	0000023c 	andeq	r0, r0, ip, lsr r2
 b9c:	0000023e 	andeq	r0, r0, lr, lsr r2
 ba0:	00000244 	andeq	r0, r0, r4, asr #4
 ba4:	0000024c 	andeq	r0, r0, ip, asr #4
 ba8:	00000256 	andeq	r0, r0, r6, asr r2
 bac:	0000025a 	andeq	r0, r0, sl, asr r2
 bb0:	00000266 	andeq	r0, r0, r6, ror #4
 bb4:	0000026a 	andeq	r0, r0, sl, ror #4
 bb8:	00000276 	andeq	r0, r0, r6, ror r2
 bbc:	0000027a 	andeq	r0, r0, sl, ror r2
	...
 bc8:	0000023c 	andeq	r0, r0, ip, lsr r2
 bcc:	0000023e 	andeq	r0, r0, lr, lsr r2
 bd0:	00000244 	andeq	r0, r0, r4, asr #4
 bd4:	00000246 	andeq	r0, r0, r6, asr #4
	...
 be0:	0000024c 	andeq	r0, r0, ip, asr #4
 be4:	00000256 	andeq	r0, r0, r6, asr r2
 be8:	0000025c 	andeq	r0, r0, ip, asr r2
 bec:	00000266 	andeq	r0, r0, r6, ror #4
 bf0:	0000026c 	andeq	r0, r0, ip, ror #4
 bf4:	00000276 	andeq	r0, r0, r6, ror r2
 bf8:	0000027c 	andeq	r0, r0, ip, ror r2
 bfc:	00000288 	andeq	r0, r0, r8, lsl #5
	...
 c08:	0000024c 	andeq	r0, r0, ip, asr #4
 c0c:	00000250 	andeq	r0, r0, r0, asr r2
 c10:	0000025c 	andeq	r0, r0, ip, asr r2
 c14:	00000260 	andeq	r0, r0, r0, ror #4
 c18:	0000026c 	andeq	r0, r0, ip, ror #4
 c1c:	00000270 	andeq	r0, r0, r0, ror r2
 c20:	0000027c 	andeq	r0, r0, ip, ror r2
 c24:	00000280 	andeq	r0, r0, r0, lsl #5
	...
 c30:	0000024c 	andeq	r0, r0, ip, asr #4
 c34:	00000250 	andeq	r0, r0, r0, asr r2
 c38:	0000025c 	andeq	r0, r0, ip, asr r2
 c3c:	00000260 	andeq	r0, r0, r0, ror #4
 c40:	0000026c 	andeq	r0, r0, ip, ror #4
 c44:	00000270 	andeq	r0, r0, r0, ror r2
 c48:	0000027c 	andeq	r0, r0, ip, ror r2
 c4c:	00000280 	andeq	r0, r0, r0, lsl #5
	...
 c58:	0000024c 	andeq	r0, r0, ip, asr #4
 c5c:	00000250 	andeq	r0, r0, r0, asr r2
 c60:	0000025c 	andeq	r0, r0, ip, asr r2
 c64:	00000260 	andeq	r0, r0, r0, ror #4
 c68:	0000026c 	andeq	r0, r0, ip, ror #4
 c6c:	00000270 	andeq	r0, r0, r0, ror r2
 c70:	0000027c 	andeq	r0, r0, ip, ror r2
 c74:	00000280 	andeq	r0, r0, r0, lsl #5
	...
 c80:	00000250 	andeq	r0, r0, r0, asr r2
 c84:	00000252 	andeq	r0, r0, r2, asr r2
 c88:	00000260 	andeq	r0, r0, r0, ror #4
 c8c:	00000262 	andeq	r0, r0, r2, ror #4
 c90:	00000270 	andeq	r0, r0, r0, ror r2
 c94:	00000272 	andeq	r0, r0, r2, ror r2
 c98:	00000280 	andeq	r0, r0, r0, lsl #5
 c9c:	00000282 	andeq	r0, r0, r2, lsl #5
	...
 ca8:	00000250 	andeq	r0, r0, r0, asr r2
 cac:	00000252 	andeq	r0, r0, r2, asr r2
 cb0:	00000260 	andeq	r0, r0, r0, ror #4
 cb4:	00000262 	andeq	r0, r0, r2, ror #4
 cb8:	00000270 	andeq	r0, r0, r0, ror r2
 cbc:	00000272 	andeq	r0, r0, r2, ror r2
 cc0:	00000280 	andeq	r0, r0, r0, lsl #5
 cc4:	00000282 	andeq	r0, r0, r2, lsl #5
	...
 cd0:	00000250 	andeq	r0, r0, r0, asr r2
 cd4:	00000252 	andeq	r0, r0, r2, asr r2
 cd8:	00000260 	andeq	r0, r0, r0, ror #4
 cdc:	00000262 	andeq	r0, r0, r2, ror #4
 ce0:	00000270 	andeq	r0, r0, r0, ror r2
 ce4:	00000272 	andeq	r0, r0, r2, ror r2
 ce8:	00000280 	andeq	r0, r0, r0, lsl #5
 cec:	00000282 	andeq	r0, r0, r2, lsl #5
	...

Disassembly of section .debug_str:

00000000 <.debug_str>:
       0:	6e616c63 	cdpvs	12, 6, cr6, cr1, cr3, {3}
       4:	4c4c2067 	mcrrmi	0, 6, r2, ip, cr7
       8:	28204d56 	stmdacs	r0!, {r1, r2, r4, r6, r8, sl, fp, lr}
       c:	74737572 	ldrbtvc	r7, [r3], #-1394	; 0xfffffa8e
      10:	65762063 	ldrbvs	r2, [r6, #-99]!	; 0xffffff9d
      14:	6f697372 	svcvs	0x00697372
      18:	2e31206e 	cdpcs	0, 3, cr2, cr1, cr14, {3}
      1c:	302e3638 	eorcc	r3, lr, r8, lsr r6
      20:	67696e2d 	strbvs	r6, [r9, -sp, lsr #28]!
      24:	796c7468 	stmdbvc	ip!, {r3, r5, r6, sl, ip, sp, lr}^
      28:	32392820 	eorscc	r2, r9, #32, 16	; 0x200000
      2c:	65646562 	strbvs	r6, [r4, #-1378]!	; 0xfffffa9e
      30:	20633161 	rsbcs	r3, r3, r1, ror #2
      34:	35323032 	ldrcc	r3, [r2, #-50]!	; 0xffffffce
      38:	2d32302d 	ldccs	0, cr3, [r2, #-180]!	; 0xffffff4c
      3c:	29293131 	stmdbcs	r9!, {r0, r4, r5, r8, ip, sp}
      40:	63727300 	cmnvs	r2, #0, 6
      44:	69616d2f 	stmdbvs	r1!, {r0, r1, r2, r3, r5, r8, sl, fp, sp, lr}^
      48:	73722e6e 	cmnvc	r2, #1760	; 0x6e0
      4c:	622f402f 	eorvs	r4, pc, #47	; 0x2f
      50:	2e746f6f 	cdpcs	15, 7, cr6, cr4, cr15, {3}
      54:	30346665 	eorscc	r6, r4, r5, ror #12
      58:	33613766 	cmncc	r1, #26738688	; 0x1980000
      5c:	30333766 	eorscc	r3, r3, r6, ror #14
      60:	34313430 	ldrtcc	r3, [r1], #-1072	; 0xfffffbd0
      64:	7567632d 	strbvc	r6, [r7, #-813]!	; 0xfffffcd3
      68:	2f00302e 	svccs	0x0000302e
      6c:	656d6f68 	strbvs	r6, [sp, #-3944]!	; 0xfffff098
      70:	6574732f 	ldrbvs	r7, [r4, #-815]!	; 0xfffffcd1
      74:	6f6e6166 	svcvs	0x006e6166
      78:	7365442f 	cmnvc	r5, #788529152	; 0x2f000000
      7c:	706f746b 	rsbvc	r7, pc, fp, ror #8
      80:	726f572f 	rsbvc	r5, pc, #12320768	; 0xbc0000
      84:	72502f6b 	subsvc	r2, r0, #428	; 0x1ac
      88:	63656a6f 	cmnvs	r5, #454656	; 0x6f000
      8c:	752f7374 	strvc	r7, [pc, #-884]!	; fffffd20 <_umb_estack+0xdffc1d24>
      90:	6172626d 	cmnvs	r2, sp, ror #4
      94:	6372732f 	cmnvs	r2, #-1140850688	; 0xbc000000
      98:	7261682f 	rsbvc	r6, r1, #3080192	; 0x2f0000
      9c:	72617764 	rsbvc	r7, r1, #100, 14	; 0x1900000
      a0:	6c702f65 	ldclvs	15, cr2, [r0], #-404	; 0xfffffe6c
      a4:	6f667461 	svcvs	0x00667461
      a8:	732f6d72 			; <UNDEFINED> instruction: 0x732f6d72
      ac:	32336d74 	eorscc	r6, r3, #116, 26	; 0x1d00
      b0:	3235356c 	eorscc	r3, r5, #108, 10	; 0x1b000000
      b4:	6f6f622f 	svcvs	0x006f622f
      b8:	6f630074 	svcvs	0x00630074
      bc:	6e6f6d6d 	cdpvs	13, 6, cr6, cr15, cr13, {3}
      c0:	6d656d00 	stclvs	13, cr6, [r5, #-0]
      c4:	5f79726f 	svcpl	0x0079726f
      c8:	6f79616c 	svcvs	0x0079616c
      cc:	52007475 	andpl	r7, r0, #1962934272	; 0x75000000
      d0:	4f646165 	svcmi	0x00646165
      d4:	00796c6e 	rsbseq	r6, r9, lr, ror #24
      d8:	64616552 	strbtvs	r6, [r1], #-1362	; 0xfffffaae
      dc:	74697257 	strbtvc	r7, [r9], #-599	; 0xfffffda9
      e0:	65520065 	ldrbvs	r0, [r2, #-101]	; 0xffffff9b
      e4:	78456461 	stmdavc	r5, {r0, r5, r6, sl, sp, lr}^
      e8:	74756365 	ldrbtvc	r6, [r5], #-869	; 0xfffffc9b
      ec:	656c6261 	strbvs	r6, [ip, #-609]!	; 0xfffffd9f
      f0:	6d654d00 	stclvs	13, cr4, [r5, #-0]
      f4:	4279726f 	rsbsmi	r7, r9, #-268435450	; 0xf0000006
      f8:	6b636f6c 	blvs	18dbeb0 <_umb_stack_size+0x18daeb0>
      fc:	65636341 	strbvs	r6, [r3, #-833]!	; 0xfffffcbf
     100:	74417373 	strbvc	r7, [r1], #-883	; 0xfffffc8d
     104:	62697274 	rsbvs	r7, r9, #116, 4	; 0x40000007
     108:	00657475 	rsbeq	r7, r5, r5, ror r4
     10c:	72746e55 	rsbsvc	r6, r4, #1360	; 0x550
     110:	65747375 	ldrbvs	r7, [r4, #-885]!	; 0xfffffc8b
     114:	72540064 	subsvc	r0, r4, #100	; 0x64
     118:	65747375 	ldrbvs	r7, [r4, #-885]!	; 0xfffffc8b
     11c:	72540064 	subsvc	r0, r4, #100	; 0x64
     120:	65747375 	ldrbvs	r7, [r4, #-885]!	; 0xfffffc8b
     124:	74614764 	strbtvc	r4, [r1], #-1892	; 0xfffff89c
     128:	79617765 	stmdbvc	r1!, {r0, r2, r5, r6, r8, r9, sl, ip, sp, lr}^
     12c:	6d654d00 	stclvs	13, cr4, [r5, #-0]
     130:	4279726f 	rsbsmi	r7, r9, #-268435450	; 0xf0000006
     134:	6b636f6c 	blvs	18dbeec <_umb_stack_size+0x18daeec>
     138:	75636553 	strbvc	r6, [r3, #-1363]!	; 0xfffffaad
     13c:	79746972 	ldmdbvc	r4!, {r1, r4, r5, r6, r8, fp, sp, lr}^
     140:	72747441 	rsbsvc	r7, r4, #1090519040	; 0x41000000
     144:	74756269 	ldrbtvc	r6, [r5], #-617	; 0xfffffd97
     148:	682f0065 	stmdavs	pc!, {r0, r2, r5, r6}	; <UNPREDICTABLE>
     14c:	2f656d6f 	svccs	0x00656d6f
     150:	66657473 			; <UNDEFINED> instruction: 0x66657473
     154:	2f6f6e61 	svccs	0x006f6e61
     158:	6b736544 	blvs	1cd9670 <_umb_stack_size+0x1cd8670>
     15c:	2f706f74 	svccs	0x00706f74
     160:	6b726f57 	blvs	1c9bec4 <_umb_stack_size+0x1c9aec4>
     164:	6f72502f 	svcvs	0x0072502f
     168:	7463656a 	strbtvc	r6, [r3], #-1386	; 0xfffffa96
     16c:	6d752f73 	ldclvs	15, cr2, [r5, #-460]!	; 0xfffffe34
     170:	2f617262 	svccs	0x00617262
     174:	2f637273 	svccs	0x00637273
     178:	64726168 	ldrbtvs	r6, [r2], #-360	; 0xfffffe98
     17c:	65726177 	ldrbvs	r6, [r2, #-375]!	; 0xfffffe89
     180:	6372612f 	cmnvs	r2, #-1073741813	; 0xc000000b
     184:	65746968 	ldrbvs	r6, [r4, #-2408]!	; 0xfffff698
     188:	72757463 	rsbsvc	r7, r5, #1660944384	; 0x63000000
     18c:	72612f65 	rsbvc	r2, r1, #404	; 0x194
     190:	72732f6d 	rsbsvc	r2, r3, #436	; 0x1b4
     194:	696c2f63 	stmdbvs	ip!, {r0, r1, r5, r6, r8, r9, sl, fp, sp}^
     198:	73722e62 	cmnvc	r2, #1568	; 0x620
     19c:	612f402f 			; <UNDEFINED> instruction: 0x612f402f
     1a0:	632e6d72 			; <UNDEFINED> instruction: 0x632e6d72
     1a4:	62376639 	eorsvs	r6, r7, #59768832	; 0x3900000
     1a8:	32376530 	eorscc	r6, r7, #48, 10	; 0xc000000
     1ac:	33656235 	cmncc	r5, #1342177283	; 0x50000003
     1b0:	2d653036 	stclcs	0, cr3, [r5, #-216]!	; 0xffffff28
     1b4:	2e756763 	cdpcs	7, 7, cr6, cr5, cr3, {3}
     1b8:	682f0030 	stmdavs	pc!, {r4, r5}	; <UNPREDICTABLE>
     1bc:	2f656d6f 	svccs	0x00656d6f
     1c0:	66657473 			; <UNDEFINED> instruction: 0x66657473
     1c4:	2f6f6e61 	svccs	0x006f6e61
     1c8:	6b736544 	blvs	1cd96e0 <_umb_stack_size+0x1cd86e0>
     1cc:	2f706f74 	svccs	0x00706f74
     1d0:	6b726f57 	blvs	1c9bf34 <_umb_stack_size+0x1c9af34>
     1d4:	6f72502f 	svcvs	0x0072502f
     1d8:	7463656a 	strbtvc	r6, [r3], #-1386	; 0xfffffa96
     1dc:	6d752f73 	ldclvs	15, cr2, [r5, #-460]!	; 0xfffffe34
     1e0:	2f617262 	svccs	0x00617262
     1e4:	2f637273 	svccs	0x00637273
     1e8:	64726168 	ldrbtvs	r6, [r2], #-360	; 0xfffffe98
     1ec:	65726177 	ldrbvs	r6, [r2, #-375]!	; 0xfffffe89
     1f0:	6372612f 	cmnvs	r2, #-1073741813	; 0xc000000b
     1f4:	65746968 	ldrbvs	r6, [r4, #-2408]!	; 0xfffff698
     1f8:	72757463 	rsbsvc	r7, r5, #1660944384	; 0x63000000
     1fc:	72612f65 	rsbvc	r2, r1, #404	; 0x194
     200:	682f006d 	stmdavs	pc!, {r0, r2, r3, r5, r6}	; <UNPREDICTABLE>
     204:	2f656d6f 	svccs	0x00656d6f
     208:	66657473 			; <UNDEFINED> instruction: 0x66657473
     20c:	2f6f6e61 	svccs	0x006f6e61
     210:	6b736544 	blvs	1cd9728 <_umb_stack_size+0x1cd8728>
     214:	2f706f74 	svccs	0x00706f74
     218:	6b726f57 	blvs	1c9bf7c <_umb_stack_size+0x1c9af7c>
     21c:	6f72502f 	svcvs	0x0072502f
     220:	7463656a 	strbtvc	r6, [r3], #-1386	; 0xfffffa96
     224:	6d752f73 	ldclvs	15, cr2, [r5, #-460]!	; 0xfffffe34
     228:	2f617262 	svccs	0x00617262
     22c:	2f637273 	svccs	0x00637273
     230:	64726168 	ldrbtvs	r6, [r2], #-360	; 0xfffffe98
     234:	65726177 	ldrbvs	r6, [r2, #-375]!	; 0xfffffe89
     238:	616c702f 	cmnvs	ip, pc, lsr #32
     23c:	726f6674 	rsbvc	r6, pc, #116, 12	; 0x7400000
     240:	74732f6d 	ldrbtvc	r2, [r3], #-3949	; 0xfffff093
     244:	6c32336d 	ldcvs	3, cr3, [r2], #-436	; 0xfffffe4c
     248:	2f323535 	svccs	0x00323535
     24c:	76697264 	strbtvc	r7, [r9], -r4, ror #4
     250:	2f737265 	svccs	0x00737265
     254:	2f637273 	svccs	0x00637273
     258:	2e62696c 	vnmulcs.f16	s13, s4, s25	; <UNPREDICTABLE>
     25c:	402f7372 	eormi	r7, pc, r2, ror r3	; <UNPREDICTABLE>
     260:	6972642f 	ldmdbvs	r2!, {r0, r1, r2, r3, r5, sl, sp, lr}^
     264:	73726576 	cmnvc	r2, #494927872	; 0x1d800000
     268:	3736642e 	ldrcc	r6, [r6, -lr, lsr #8]!
     26c:	66323933 			; <UNDEFINED> instruction: 0x66323933
     270:	30303464 	eorscc	r3, r0, r4, ror #8
     274:	34343832 	ldrtcc	r3, [r4], #-2098	; 0xfffff7ce
     278:	67632d36 			; <UNDEFINED> instruction: 0x67632d36
     27c:	00302e75 	eorseq	r2, r0, r5, ror lr
     280:	6d6f682f 	stclvs	8, cr6, [pc, #-188]!	; 1cc <_umb_stack_size-0xe34>
     284:	74732f65 	ldrbtvc	r2, [r3], #-3941	; 0xfffff09b
     288:	6e616665 	cdpvs	6, 6, cr6, cr1, cr5, {3}
     28c:	65442f6f 	strbvs	r2, [r4, #-3951]	; 0xfffff091
     290:	6f746b73 	svcvs	0x00746b73
     294:	6f572f70 	svcvs	0x00572f70
     298:	502f6b72 	eorpl	r6, pc, r2, ror fp	; <UNPREDICTABLE>
     29c:	656a6f72 	strbvs	r6, [sl, #-3954]!	; 0xfffff08e
     2a0:	2f737463 	svccs	0x00737463
     2a4:	72626d75 	rsbvc	r6, r2, #7488	; 0x1d40
     2a8:	72732f61 	rsbsvc	r2, r3, #388	; 0x184
     2ac:	61682f63 	cmnvs	r8, r3, ror #30
     2b0:	61776472 	cmnvs	r7, r2, ror r4
     2b4:	702f6572 	eorvc	r6, pc, r2, ror r5	; <UNPREDICTABLE>
     2b8:	6674616c 	ldrbtvs	r6, [r4], -ip, ror #2
     2bc:	2f6d726f 	svccs	0x006d726f
     2c0:	336d7473 	cmncc	sp, #1929379840	; 0x73000000
     2c4:	35356c32 	ldrcc	r6, [r5, #-3122]!	; 0xfffff3ce
     2c8:	72642f32 	rsbvc	r2, r4, #50, 30	; 0xc8
     2cc:	72657669 	rsbvc	r7, r5, #110100480	; 0x6900000
     2d0:	682f0073 	stmdavs	pc!, {r0, r1, r4, r5, r6}	; <UNPREDICTABLE>
     2d4:	2f656d6f 	svccs	0x00656d6f
     2d8:	66657473 			; <UNDEFINED> instruction: 0x66657473
     2dc:	2f6f6e61 	svccs	0x006f6e61
     2e0:	6b736544 	blvs	1cd97f8 <_umb_stack_size+0x1cd87f8>
     2e4:	2f706f74 	svccs	0x00706f74
     2e8:	6b726f57 	blvs	1c9c04c <_umb_stack_size+0x1c9b04c>
     2ec:	6f72502f 	svcvs	0x0072502f
     2f0:	7463656a 	strbtvc	r6, [r3], #-1386	; 0xfffffa96
     2f4:	6d752f73 	ldclvs	15, cr2, [r5, #-460]!	; 0xfffffe34
     2f8:	2f617262 	svccs	0x00617262
     2fc:	2f637273 	svccs	0x00637273
     300:	6e72656b 	cdpvs	5, 7, cr6, cr2, cr11, {3}
     304:	732f6c65 			; <UNDEFINED> instruction: 0x732f6c65
     308:	6c2f6372 	stcvs	3, cr6, [pc], #-456	; 148 <_umb_stack_size-0xeb8>
     30c:	722e6269 	eorvc	r6, lr, #-1879048186	; 0x90000006
     310:	2f402f73 	svccs	0x00402f73
     314:	6e72656b 	cdpvs	5, 7, cr6, cr2, cr11, {3}
     318:	352e6c65 	strcc	r6, [lr, #-3173]!	; 0xfffff39b
     31c:	65306136 	ldrvs	r6, [r0, #-310]!	; 0xfffffeca
     320:	64386665 	ldrtvs	r6, [r8], #-1637	; 0xfffff99b
     324:	35616130 	strbcc	r6, [r1, #-304]!	; 0xfffffed0
     328:	2d366566 	cfldr32cs	mvfx6, [r6, #-408]!	; 0xfffffe68
     32c:	2e756763 	cdpcs	7, 7, cr6, cr5, cr3, {3}
     330:	682f0030 	stmdavs	pc!, {r4, r5}	; <UNPREDICTABLE>
     334:	2f656d6f 	svccs	0x00656d6f
     338:	66657473 			; <UNDEFINED> instruction: 0x66657473
     33c:	2f6f6e61 	svccs	0x006f6e61
     340:	6b736544 	blvs	1cd9858 <_umb_stack_size+0x1cd8858>
     344:	2f706f74 	svccs	0x00706f74
     348:	6b726f57 	blvs	1c9c0ac <_umb_stack_size+0x1c9b0ac>
     34c:	6f72502f 	svcvs	0x0072502f
     350:	7463656a 	strbtvc	r6, [r3], #-1386	; 0xfffffa96
     354:	6d752f73 	ldclvs	15, cr2, [r5, #-460]!	; 0xfffffe34
     358:	2f617262 	svccs	0x00617262
     35c:	2f637273 	svccs	0x00637273
     360:	6e72656b 	cdpvs	5, 7, cr6, cr2, cr11, {3}
     364:	63006c65 	movwvs	r6, #3173	; 0xc65
     368:	0065726f 	rsbeq	r7, r5, pc, ror #4
     36c:	00746d66 	rsbseq	r6, r4, r6, ror #26
     370:	7466654c 	strbtvc	r6, [r6], #-1356	; 0xfffffab4
     374:	67695200 	strbvs	r5, [r9, -r0, lsl #4]!
     378:	43007468 	movwmi	r7, #1128	; 0x468
     37c:	65746e65 	ldrbvs	r6, [r4, #-3685]!	; 0xfffff19b
     380:	6e550072 	mrcvs	0, 2, r0, cr5, cr2, {3}
     384:	776f6e6b 	strbvc	r6, [pc, -fp, ror #28]!
     388:	6c41006e 	mcrrvs	0, 6, r0, r1, cr14
     38c:	6d6e6769 	stclvs	7, cr6, [lr, #-420]!	; 0xfffffe5c
     390:	00746e65 	rsbseq	r6, r4, r5, ror #28
     394:	6d6f682f 	stclvs	8, cr6, [pc, #-188]!	; 2e0 <_umb_stack_size-0xd20>
     398:	74732f65 	ldrbtvc	r2, [r3], #-3941	; 0xfffff09b
     39c:	6e616665 	cdpvs	6, 6, cr6, cr1, cr5, {3}
     3a0:	65442f6f 	strbvs	r2, [r4, #-3951]	; 0xfffff091
     3a4:	6f746b73 	svcvs	0x00746b73
     3a8:	6f572f70 	svcvs	0x00572f70
     3ac:	502f6b72 	eorpl	r6, pc, r2, ror fp	; <UNPREDICTABLE>
     3b0:	656a6f72 	strbvs	r6, [sl, #-3954]!	; 0xfffff08e
     3b4:	2f737463 	svccs	0x00737463
     3b8:	72626d75 	rsbvc	r6, r2, #7488	; 0x1d40
     3bc:	72732f61 	rsbsvc	r2, r3, #388	; 0x184
     3c0:	61682f63 	cmnvs	r8, r3, ror #30
     3c4:	61776472 	cmnvs	r7, r2, ror r4
     3c8:	632f6572 			; <UNDEFINED> instruction: 0x632f6572
     3cc:	6f6d6d6f 	svcvs	0x006d6d6f
     3d0:	65702f6e 	ldrbvs	r2, [r0, #-3950]!	; 0xfffff092
     3d4:	68706972 	ldmdavs	r0!, {r1, r4, r5, r6, r8, fp, sp, lr}^
     3d8:	6c617265 	sfmvs	f7, 2, [r1], #-404	; 0xfffffe6c
     3dc:	6765725f 			; <UNDEFINED> instruction: 0x6765725f
     3e0:	72732f73 	rsbsvc	r2, r3, #460	; 0x1cc
     3e4:	696c2f63 	stmdbvs	ip!, {r0, r1, r5, r6, r8, r9, sl, fp, sp}^
     3e8:	73722e62 	cmnvc	r2, #1568	; 0x620
     3ec:	702f402f 	eorvc	r4, pc, pc, lsr #32
     3f0:	70697265 	rsbvc	r7, r9, r5, ror #4
     3f4:	61726568 	cmnvs	r2, r8, ror #10
     3f8:	65725f6c 	ldrbvs	r5, [r2, #-3948]!	; 0xfffff094
     3fc:	382e7367 	stmdacc	lr!, {r0, r1, r2, r5, r6, r8, r9, ip, sp, lr}
     400:	63373337 	teqvs	r7, #-603979776	; 0xdc000000
     404:	33613662 	cmncc	r1, #102760448	; 0x6200000
     408:	35343333 	ldrcc	r3, [r4, #-819]!	; 0xfffffccd
     40c:	2d373139 	ldfcss	f3, [r7, #-228]!	; 0xffffff1c
     410:	2e756763 	cdpcs	7, 7, cr6, cr5, cr3, {3}
     414:	682f0030 	stmdavs	pc!, {r4, r5}	; <UNPREDICTABLE>
     418:	2f656d6f 	svccs	0x00656d6f
     41c:	66657473 			; <UNDEFINED> instruction: 0x66657473
     420:	2f6f6e61 	svccs	0x006f6e61
     424:	6b736544 	blvs	1cd993c <_umb_stack_size+0x1cd893c>
     428:	2f706f74 	svccs	0x00706f74
     42c:	6b726f57 	blvs	1c9c190 <_umb_stack_size+0x1c9b190>
     430:	6f72502f 	svcvs	0x0072502f
     434:	7463656a 	strbtvc	r6, [r3], #-1386	; 0xfffffa96
     438:	6d752f73 	ldclvs	15, cr2, [r5, #-460]!	; 0xfffffe34
     43c:	2f617262 	svccs	0x00617262
     440:	2f637273 	svccs	0x00637273
     444:	64726168 	ldrbtvs	r6, [r2], #-360	; 0xfffffe98
     448:	65726177 	ldrbvs	r6, [r2, #-375]!	; 0xfffffe89
     44c:	6d6f632f 	stclvs	3, cr6, [pc, #-188]!	; 398 <_umb_stack_size-0xc68>
     450:	2f6e6f6d 	svccs	0x006e6f6d
     454:	69726570 	ldmdbvs	r2!, {r4, r5, r6, r8, sl, sp, lr}^
     458:	72656870 	rsbvc	r6, r5, #112, 16	; 0x700000
     45c:	725f6c61 	subsvc	r6, pc, #24832	; 0x6100
     460:	00736765 	rsbseq	r6, r3, r5, ror #14
     464:	00727470 	rsbseq	r7, r2, r0, ror r4
     468:	5a5f0054 	bpl	17c05c0 <_umb_stack_size+0x17bf5c0>
     46c:	6f63344e 	svcvs	0x0063344e
     470:	70336572 	eorsvc	r6, r3, r2, ror r5
     474:	33317274 	teqcc	r1, #116, 4	; 0x40000007
     478:	64616572 	strbtvs	r6, [r1], #-1394	; 0xfffffa8e
     47c:	6c6f765f 	stclvs	6, cr7, [pc], #-380	; 308 <_umb_stack_size-0xcf8>
     480:	6c697461 	cfstrdvs	mvd7, [r9], #-388	; 0xfffffe7c
     484:	68373165 	ldmdavs	r7!, {r0, r2, r5, r6, r8, ip, sp}
     488:	39326431 	ldmdbcc	r2!, {r0, r4, r5, sl, sp, lr}
     48c:	36316635 			; <UNDEFINED> instruction: 0x36316635
     490:	33346162 	teqcc	r4, #-2147483624	; 0x80000018
     494:	32316537 	eorscc	r6, r1, #230686720	; 0xdc00000
     498:	65720045 	ldrbvs	r0, [r2, #-69]!	; 0xffffffbb
     49c:	765f6461 	ldrbvc	r6, [pc], -r1, ror #8
     4a0:	74616c6f 	strbtvc	r6, [r1], #-3183	; 0xfffff391
     4a4:	3c656c69 	stclcc	12, cr6, [r5], #-420	; 0xfffffe5c
     4a8:	3e323375 	mrccc	3, 1, r3, cr2, cr5, {3}
     4ac:	63727300 	cmnvs	r2, #0, 6
     4b0:	6f632a00 	svcvs	0x00632a00
     4b4:	2074736e 	rsbscs	r7, r4, lr, ror #6
     4b8:	00323375 	eorseq	r3, r2, r5, ror r3
     4bc:	314e5a5f 	cmpcc	lr, pc, asr sl
     4c0:	72657035 	rsbvc	r7, r5, #53	; 0x35
     4c4:	65687069 	strbvs	r7, [r8, #-105]!	; 0xffffff97
     4c8:	5f6c6172 	svcpl	0x006c6172
     4cc:	73676572 	cmnvc	r7, #478150656	; 0x1c800000
     4d0:	65723331 	ldrbvs	r3, [r2, #-817]!	; 0xfffffccf
     4d4:	725f6461 	subsvc	r6, pc, #1627389952	; 0x61000000
     4d8:	73696765 	cmnvc	r9, #26476544	; 0x1940000
     4dc:	31726574 	cmncc	r2, r4, ror r5
     4e0:	35306837 	ldrcc	r6, [r0, #-2103]!	; 0xfffff7c9
     4e4:	32663862 	rsbcc	r3, r6, #6422528	; 0x620000
     4e8:	34636336 	strbtcc	r6, [r3], #-822	; 0xfffffcca
     4ec:	34613436 	strbtcc	r3, [r1], #-1078	; 0xfffffbca
     4f0:	00456335 	subeq	r6, r5, r5, lsr r3
     4f4:	64616572 	strbtvs	r6, [r1], #-1394	; 0xfffffa8e
     4f8:	6765725f 			; <UNDEFINED> instruction: 0x6765725f
     4fc:	65747369 	ldrbvs	r7, [r4, #-873]!	; 0xfffffc97
     500:	65720072 	ldrbvs	r0, [r2, #-114]!	; 0xffffff8e
     504:	625f7367 	subsvs	r7, pc, #-1677721599	; 0x9c000001
     508:	5f657361 	svcpl	0x00657361
     50c:	72646461 	rsbvc	r6, r4, #1627389952	; 0x61000000
     510:	00737365 	rsbseq	r7, r3, r5, ror #6
     514:	73676572 	cmnvc	r7, #478150656	; 0x1c800000
     518:	7361625f 	cmnvc	r1, #-268435451	; 0xf0000005
     51c:	64615f65 	strbtvs	r5, [r1], #-3941	; 0xfffff09b
     520:	73657264 	cmnvc	r5, #100, 4	; 0x40000006
     524:	00755f73 	rsbseq	r5, r5, r3, ror pc
     528:	756c6176 	strbvc	r6, [ip, #-374]!	; 0xfffffe8a
     52c:	61730065 	cmnvs	r3, r5, rrx
     530:	6d260075 	stcvs	0, cr0, [r6, #-468]!	; 0xfffffe2c
     534:	75207475 	strvc	r7, [r0, #-1141]!	; 0xfffffb8b
     538:	5f003233 	svcpl	0x00003233
     53c:	61334e5a 	teqvs	r3, sl, asr lr
     540:	73336d72 	teqvc	r3, #7296	; 0x1c80
     544:	53397561 	teqpl	r9, #406847488	; 0x18400000
     548:	72447561 	subvc	r7, r4, #406847488	; 0x18400000
     54c:	72657669 	rsbvc	r7, r5, #110100480	; 0x6900000
     550:	696e6934 	stmdbvs	lr!, {r2, r4, r5, r8, fp, sp, lr}^
     554:	68373174 	ldmdavs	r7!, {r2, r4, r5, r6, r8, ip, sp}
     558:	31326361 	teqcc	r2, r1, ror #6
     55c:	34303131 	ldrtcc	r3, [r0], #-305	; 0xfffffecf
     560:	64656639 	strbtvs	r6, [r5], #-1593	; 0xfffff9c7
     564:	64643630 	strbtvs	r3, [r4], #-1584	; 0xfffff9d0
     568:	6d260045 	stcvs	0, cr0, [r6, #-276]!	; 0xfffffeec
     56c:	61207475 			; <UNDEFINED> instruction: 0x61207475
     570:	3a3a6d72 	bcc	e9bb40 <_umb_stack_size+0xe9ab40>
     574:	3a756173 	bcc	1d58b48 <_umb_stack_size+0x1d57b48>
     578:	7561533a 	strbvc	r5, [r1, #-826]!	; 0xfffffcc6
     57c:	76697244 	strbtvc	r7, [r9], -r4, asr #4
     580:	73007265 	movwvc	r7, #613	; 0x265
     584:	00666c65 	rsbeq	r6, r6, r5, ror #24
     588:	69676572 	stmdbvs	r7!, {r1, r4, r5, r6, r8, sl, sp, lr}^
     58c:	6e5f6e6f 	cdpvs	14, 5, cr6, cr15, cr15, {3}
     590:	69006d75 	stmdbvs	r0, {r0, r2, r4, r5, r6, r8, sl, fp, sp, lr}
     594:	00726574 	rsbseq	r6, r2, r4, ror r5
     598:	0073706f 	rsbseq	r7, r3, pc, rrx
     59c:	676e6172 			; <UNDEFINED> instruction: 0x676e6172
     5a0:	64490065 	strbvs	r0, [r9], #-101	; 0xffffff9b
     5a4:	697b0078 	ldmdbvs	fp!, {r3, r4, r5, r6}^
     5a8:	236c706d 	cmncs	ip, #109	; 0x6d
     5ac:	5f007d32 	svcpl	0x00007d32
     5b0:	31314e5a 	teqcc	r1, sl, asr lr
     5b4:	4c245f32 	stcmi	15, cr5, [r4], #-200	; 0xffffff38
     5b8:	72612454 	rsbvc	r2, r1, #84, 8	; 0x54000000
     5bc:	732e2e6d 			; <UNDEFINED> instruction: 0x732e2e6d
     5c0:	2e2e7561 	cfsh64cs	mvdx7, mvdx14, #49
     5c4:	44756153 	ldrbtmi	r6, [r5], #-339	; 0xfffffead
     5c8:	65766972 	ldrbvs	r6, [r6, #-2418]!	; 0xfffff68e
     5cc:	32752472 	rsbscc	r2, r5, #1912602624	; 0x72000000
     5d0:	73612430 	cmnvc	r1, #48, 8	; 0x30000000
     5d4:	30327524 	eorscc	r7, r2, r4, lsr #10
     5d8:	72656b24 	rsbvc	r6, r5, #36, 22	; 0x9000
     5dc:	2e6c656e 	cdpcs	5, 6, cr6, cr12, cr14, {3}
     5e0:	6d656d2e 	stclvs	13, cr6, [r5, #-184]!	; 0xffffff48
     5e4:	5f79726f 	svcpl	0x0079726f
     5e8:	746f7270 	strbtvc	r7, [pc], #-624	; 5f0 <_umb_stack_size-0xa10>
     5ec:	69746365 	ldmdbvs	r4!, {r0, r2, r5, r6, r8, r9, sp, lr}^
     5f0:	735f6e6f 	cmpvc	pc, #1776	; 0x6f0
     5f4:	65767265 	ldrbvs	r7, [r6, #-613]!	; 0xfffffd9b
     5f8:	6d2e2e72 	stcvs	14, cr2, [lr, #-456]!	; 0xfffffe38
     5fc:	726f6d65 	rsbvc	r6, pc, #6464	; 0x1940
     600:	75675f79 	strbvc	r5, [r7, #-3961]!	; 0xfffff087
     604:	2e647261 	cdpcs	2, 6, cr7, cr4, cr1, {3}
     608:	6d654d2e 	stclvs	13, cr4, [r5, #-184]!	; 0xffffff48
     60c:	5379726f 	cmnpl	r9, #-268435450	; 0xf0000006
     610:	72756365 	rsbsvc	r6, r5, #-1811939327	; 0x94000001
     614:	47797469 	ldrbmi	r7, [r9, -r9, ror #8]!
     618:	64726175 	ldrbtvs	r6, [r2], #-373	; 0xfffffe8b
     61c:	69617254 	stmdbvs	r1!, {r2, r4, r6, r9, ip, sp, lr}^
     620:	54472474 	strbpl	r2, [r7], #-1140	; 0xfffffb8c
     624:	6d363224 	lfmvs	f3, 4, [r6, #-144]!	; 0xffffff70
     628:	726f6d65 	rsbvc	r6, pc, #6464	; 0x1940
     62c:	65735f79 	ldrbvs	r5, [r3, #-3961]!	; 0xfffff087
     630:	69727563 	ldmdbvs	r2!, {r0, r1, r5, r6, r8, sl, ip, sp, lr}^
     634:	675f7974 			; <UNDEFINED> instruction: 0x675f7974
     638:	64726175 	ldrbtvs	r6, [r2], #-373	; 0xfffffe8b
     63c:	696e695f 	stmdbvs	lr!, {r0, r1, r2, r3, r4, r6, r8, fp, sp, lr}^
     640:	68373174 	ldmdavs	r7!, {r2, r4, r5, r6, r8, ip, sp}
     644:	63363036 	teqvs	r6, #54	; 0x36
     648:	36303332 			; <UNDEFINED> instruction: 0x36303332
     64c:	36646632 			; <UNDEFINED> instruction: 0x36646632
     650:	30643765 	rsbcc	r3, r4, r5, ror #14
     654:	656d0045 	strbvs	r0, [sp, #-69]!	; 0xffffffbb
     658:	79726f6d 	ldmdbvc	r2!, {r0, r2, r3, r5, r6, r8, r9, sl, fp, sp, lr}^
     65c:	6365735f 	cmnvs	r5, #2080374785	; 0x7c000001
     660:	74697275 	strbtvc	r7, [r9], #-629	; 0xfffffd8b
     664:	75675f79 	strbvc	r5, [r7, #-3961]!	; 0xfffff087
     668:	5f647261 	svcpl	0x00647261
     66c:	74696e69 	strbtvc	r6, [r9], #-3689	; 0xfffff197
     670:	706d6300 	rsbvc	r6, sp, r0, lsl #6
     674:	706d6900 	rsbvc	r6, sp, r0, lsl #18
     678:	7b00736c 	blvc	1d430 <_umb_stack_size+0x1c430>
     67c:	6c706d69 	ldclvs	13, cr6, [r0], #-420	; 0xfffffe5c
     680:	7d303623 	ldcvc	6, cr3, [r0, #-140]!	; 0xffffff74
     684:	4e5a5f00 	cdpmi	15, 5, cr5, cr10, cr0, {0}
     688:	726f6334 	rsbvc	r6, pc, #52, 6	; 0xd0000000
     68c:	6d633365 	stclvs	3, cr3, [r3, #-404]!	; 0xfffffe6c
     690:	6d693570 	cfstr64vs	mvdx3, [r9, #-448]!	; 0xfffffe40
     694:	35736c70 	ldrbcc	r6, [r3, #-3184]!	; 0xfffff390
     698:	4c245f34 	stcmi	15, cr5, [r4], #-208	; 0xffffff30
     69c:	6d692454 	cfstrdvs	mvd2, [r9, #-336]!	; 0xfffffeb0
     6a0:	75246c70 	strvc	r6, [r4, #-3184]!	; 0xfffff390
     6a4:	63243032 			; <UNDEFINED> instruction: 0x63243032
     6a8:	2e65726f 	cdpcs	2, 6, cr7, cr5, cr15, {3}
     6ac:	706d632e 	rsbvc	r6, sp, lr, lsr #6
     6b0:	61502e2e 	cmpvs	r0, lr, lsr #28
     6b4:	61697472 	smcvs	38722	; 0x9742
     6b8:	64724f6c 	ldrbtvs	r4, [r2], #-3948	; 0xfffff094
     6bc:	30327524 	eorscc	r7, r2, r4, lsr #10
     6c0:	726f6624 	rsbvc	r6, pc, #36, 12	; 0x2400000
     6c4:	30327524 	eorscc	r7, r2, r4, lsr #10
     6c8:	24387524 	ldrtcs	r7, [r8], #-1316	; 0xfffffadc
     6cc:	32245447 	eorcc	r5, r4, #1191182336	; 0x47000000
     6d0:	3731746c 	ldrcc	r7, [r1, -ip, ror #8]!
     6d4:	64386368 	ldrtvs	r6, [r8], #-872	; 0xfffffc98
     6d8:	63393566 	teqvs	r9, #427819008	; 0x19800000
     6dc:	35353933 	ldrcc	r3, [r5, #-2355]!	; 0xfffff6cd
     6e0:	31366532 	teqcc	r6, r2, lsr r5
     6e4:	6c004563 	cfstr32vs	mvfx4, [r0], {99}	; 0x63
     6e8:	6f620074 	svcvs	0x00620074
     6ec:	26006c6f 	strcs	r6, [r0], -pc, ror #24
     6f0:	6f003875 	svcvs	0x00003875
     6f4:	72656874 	rsbvc	r6, r5, #116, 16	; 0x740000
     6f8:	6d697b00 	vstmdbvs	r9!, {d23-d22}
     6fc:	35236c70 	strcc	r6, [r3, #-3184]!	; 0xfffff390
     700:	5a5f007d 	bpl	17c08fc <_umb_stack_size+0x17bf8fc>
     704:	5f39384e 	svcpl	0x0039384e
     708:	24544c24 	ldrbcs	r4, [r4], #-3108	; 0xfffff3dc
     70c:	65726f63 	ldrbvs	r6, [r2, #-3939]!	; 0xfffff09d
     710:	706f2e2e 	rsbvc	r2, pc, lr, lsr #28
     714:	722e2e73 	eorvc	r2, lr, #1840	; 0x730
     718:	65676e61 	strbvs	r6, [r7, #-3681]!	; 0xfffff19f
     71c:	61522e2e 	cmpvs	r2, lr, lsr #28
     720:	2465676e 	strbtcs	r6, [r5], #-1902	; 0xfffff892
     724:	5424544c 	strtpl	r5, [r4], #-1100	; 0xfffffbb4
     728:	24544724 	ldrbcs	r4, [r4], #-1828	; 0xfffff8dc
     72c:	30327524 	eorscc	r7, r2, r4, lsr #10
     730:	24736124 	ldrbtcs	r6, [r3], #-292	; 0xfffffedc
     734:	24303275 	ldrtcs	r3, [r0], #-629	; 0xfffffd8b
     738:	65726f63 	ldrbvs	r6, [r2, #-3939]!	; 0xfffff09d
     73c:	74692e2e 	strbtvc	r2, [r9], #-3630	; 0xfffff1d2
     740:	2e2e7265 	cdpcs	2, 2, cr7, cr14, cr5, {3}
     744:	676e6172 			; <UNDEFINED> instruction: 0x676e6172
     748:	522e2e65 	eorpl	r2, lr, #1616	; 0x650
     74c:	65676e61 	strbvs	r6, [r7, #-3681]!	; 0xfffff19f
     750:	72657449 	rsbvc	r7, r5, #1224736768	; 0x49000000
     754:	726f7461 	rsbvc	r7, pc, #1627389952	; 0x61000000
     758:	6c706d49 	ldclvs	13, cr6, [r0], #-292	; 0xfffffedc
     75c:	24544724 	ldrbcs	r4, [r4], #-1828	; 0xfffff8dc
     760:	65707339 	ldrbvs	r7, [r0, #-825]!	; 0xfffffcc7
     764:	656e5f63 	strbvs	r5, [lr, #-3939]!	; 0xfffff09d
     768:	37317478 			; <UNDEFINED> instruction: 0x37317478
     76c:	37643268 	strbcc	r3, [r4, -r8, ror #4]!
     770:	34383632 	ldrtcc	r3, [r8], #-1586	; 0xfffff9ce
     774:	35313932 	ldrcc	r3, [r1, #-2354]!	; 0xfffff6ce
     778:	32346238 	eorscc	r6, r4, #56, 4	; 0x80000003
     77c:	73004537 	movwvc	r4, #1335	; 0x537
     780:	5f636570 	svcpl	0x00636570
     784:	7478656e 	ldrbtvc	r6, [r8], #-1390	; 0xfffffa92
     788:	3e38753c 	mrccc	5, 1, r7, cr8, cr12, {1}
     78c:	74706f00 	ldrbtvc	r6, [r0], #-3840	; 0xfffff100
     790:	006e6f69 	rsbeq	r6, lr, r9, ror #30
     794:	656e6f4e 	strbvs	r6, [lr, #-3918]!	; 0xfffff0b2
     798:	6d6f5300 	stclvs	3, cr5, [pc, #-0]	; 7a0 <_umb_stack_size-0x860>
     79c:	5f5f0065 	svcpl	0x005f0065
     7a0:	704f0030 	subvc	r0, pc, r0, lsr r0	; <UNPREDICTABLE>
     7a4:	6e6f6974 			; <UNDEFINED> instruction: 0x6e6f6974
     7a8:	3e38753c 	mrccc	5, 1, r7, cr8, cr12, {1}
     7ac:	756d2600 	strbvc	r2, [sp, #-1536]!	; 0xfffffa00
     7b0:	6f632074 	svcvs	0x00632074
     7b4:	3a3a6572 	bcc	e99d84 <_umb_stack_size+0xe98d84>
     7b8:	3a73706f 	bcc	1cdc97c <_umb_stack_size+0x1cdb97c>
     7bc:	6e61723a 	mcrvs	2, 3, r7, cr1, cr10, {1}
     7c0:	3a3a6567 	bcc	e99d64 <_umb_stack_size+0xe98d64>
     7c4:	676e6152 			; <UNDEFINED> instruction: 0x676e6152
     7c8:	38753c65 	ldmdacc	r5!, {r0, r2, r5, r6, sl, fp, ip, sp}^
     7cc:	6c6f003e 	stclvs	0, cr0, [pc], #-248	; 6dc <_umb_stack_size-0x924>
     7d0:	697b0064 	ldmdbvs	fp!, {r2, r5, r6}^
     7d4:	236c706d 	cmncs	ip, #109	; 0x6d
     7d8:	41007d36 	tstmi	r0, r6, lsr sp
     7dc:	4e5a5f00 	cdpmi	15, 5, cr5, cr10, cr0, {0}
     7e0:	726f6334 	rsbvc	r6, pc, #52, 6	; 0xd0000000
     7e4:	74693465 	strbtvc	r3, [r9], #-1125	; 0xfffffb9b
     7e8:	72357265 	eorsvc	r7, r5, #1342177286	; 0x50000006
     7ec:	65676e61 	strbvs	r6, [r7, #-3681]!	; 0xfffff19f
     7f0:	5f313031 	svcpl	0x00313031
     7f4:	24544c24 	ldrbcs	r4, [r4], #-3108	; 0xfffff3dc
     7f8:	6c706d69 	ldclvs	13, cr6, [r0], #-420	; 0xfffffe5c
     7fc:	30327524 	eorscc	r7, r2, r4, lsr #10
     800:	726f6324 	rsbvc	r6, pc, #36, 6	; 0x90000000
     804:	692e2e65 	stmdbvs	lr!, {r0, r2, r5, r6, r9, sl, fp, sp}
     808:	2e726574 	mrccs	5, 3, r6, cr2, cr4, {3}
     80c:	6172742e 	cmnvs	r2, lr, lsr #8
     810:	2e737469 	cdpcs	4, 7, cr7, cr3, cr9, {3}
     814:	6574692e 	ldrbvs	r6, [r4, #-2350]!	; 0xfffff6d2
     818:	6f746172 	svcvs	0x00746172
     81c:	492e2e72 	stmdbmi	lr!, {r1, r4, r5, r6, r9, sl, fp, sp}
     820:	61726574 	cmnvs	r2, r4, ror r5
     824:	24726f74 	ldrbtcs	r6, [r2], #-3956	; 0xfffff08c
     828:	24303275 	ldrtcs	r3, [r0], #-629	; 0xfffffd8b
     82c:	24726f66 	ldrbtcs	r6, [r2], #-3942	; 0xfffff09a
     830:	24303275 	ldrtcs	r3, [r0], #-629	; 0xfffffd8b
     834:	65726f63 	ldrbvs	r6, [r2, #-3939]!	; 0xfffff09d
     838:	706f2e2e 	rsbvc	r2, pc, lr, lsr #28
     83c:	722e2e73 	eorvc	r2, lr, #1840	; 0x730
     840:	65676e61 	strbvs	r6, [r7, #-3681]!	; 0xfffff19f
     844:	61522e2e 	cmpvs	r2, lr, lsr #28
     848:	2465676e 	strbtcs	r6, [r5], #-1902	; 0xfffff892
     84c:	4124544c 			; <UNDEFINED> instruction: 0x4124544c
     850:	24544724 	ldrbcs	r4, [r4], #-1828	; 0xfffff8dc
     854:	24544724 	ldrbcs	r4, [r4], #-1828	; 0xfffff8dc
     858:	78656e34 	stmdavc	r5!, {r2, r4, r5, r9, sl, fp, sp, lr}^
     85c:	68373174 	ldmdavs	r7!, {r2, r4, r5, r6, r8, ip, sp}
     860:	36343834 			; <UNDEFINED> instruction: 0x36343834
     864:	34353539 	ldrtcc	r3, [r5], #-1337	; 0xfffffac7
     868:	66636130 			; <UNDEFINED> instruction: 0x66636130
     86c:	65623938 	strbvs	r3, [r2, #-2360]!	; 0xfffff6c8
     870:	5a5f0045 	bpl	17c098c <_umb_stack_size+0x17bf98c>
     874:	6f63344e 	svcvs	0x0063344e
     878:	70336572 	eorsvc	r6, r3, r2, ror r5
     87c:	34317274 	ldrtcc	r7, [r1], #-628	; 0xfffffd8c
     880:	74697277 	strbtvc	r7, [r9], #-631	; 0xfffffd89
     884:	6f765f65 	svcvs	0x00765f65
     888:	6974616c 	ldmdbvs	r4!, {r2, r3, r5, r6, r8, sp, lr}^
     88c:	3731656c 	ldrcc	r6, [r1, -ip, ror #10]!
     890:	35346268 	ldrcc	r6, [r4, #-616]!	; 0xfffffd98
     894:	62303163 	eorsvs	r3, r0, #-1073741800	; 0xc0000018
     898:	65616464 	strbvs	r6, [r1, #-1124]!	; 0xfffffb9c
     89c:	31616631 	cmncc	r1, r1, lsr r6
     8a0:	77004561 	strvc	r4, [r0, -r1, ror #10]
     8a4:	65746972 	ldrbvs	r6, [r4, #-2418]!	; 0xfffff68e
     8a8:	6c6f765f 	stclvs	6, cr7, [pc], #-380	; 734 <_umb_stack_size-0x8cc>
     8ac:	6c697461 	cfstrdvs	mvd7, [r9], #-388	; 0xfffffe7c
     8b0:	33753c65 	cmncc	r5, #25856	; 0x6500
     8b4:	64003e32 	strvs	r3, [r0], #-3634	; 0xfffff1ce
     8b8:	2a007473 	bcs	1da8c <_umb_stack_size+0x1ca8c>
     8bc:	2074756d 	rsbscs	r7, r4, sp, ror #10
     8c0:	00323375 	eorseq	r3, r2, r5, ror r3
     8c4:	314e5a5f 	cmpcc	lr, pc, asr sl
     8c8:	72657035 	rsbvc	r7, r5, #53	; 0x35
     8cc:	65687069 	strbvs	r7, [r8, #-105]!	; 0xffffff97
     8d0:	5f6c6172 	svcpl	0x006c6172
     8d4:	73676572 	cmnvc	r7, #478150656	; 0x1c800000
     8d8:	72773431 	rsbsvc	r3, r7, #822083584	; 0x31000000
     8dc:	5f657469 	svcpl	0x00657469
     8e0:	69676572 	stmdbvs	r7!, {r1, r4, r5, r6, r8, sl, sp, lr}^
     8e4:	72657473 	rsbvc	r7, r5, #1929379840	; 0x73000000
     8e8:	34683731 	strbtcc	r3, [r8], #-1841	; 0xfffff8cf
     8ec:	64666136 	strbtvs	r6, [r6], #-310	; 0xfffffeca
     8f0:	65303539 	ldrvs	r3, [r0, #-1337]!	; 0xfffffac7
     8f4:	66383261 	ldrtvs	r3, [r8], -r1, ror #4
     8f8:	45663935 	strbmi	r3, [r6, #-2357]!	; 0xfffff6cb
     8fc:	69727700 	ldmdbvs	r2!, {r8, r9, sl, ip, sp, lr}^
     900:	725f6574 	subsvc	r6, pc, #116, 10	; 0x1d000000
     904:	73696765 	cmnvc	r9, #26476544	; 0x1940000
     908:	00726574 	rsbseq	r6, r2, r4, ror r5
     90c:	314e5a5f 	cmpcc	lr, pc, asr sl
     910:	72657035 	rsbvc	r7, r5, #53	; 0x35
     914:	65687069 	strbvs	r7, [r8, #-105]!	; 0xffffff97
     918:	5f6c6172 	svcpl	0x006c6172
     91c:	73676572 	cmnvc	r7, #478150656	; 0x1c800000
     920:	6c633831 	stclvs	8, cr3, [r3], #-196	; 0xffffff3c
     924:	5f726165 	svcpl	0x00726165
     928:	69676572 	stmdbvs	r7!, {r1, r4, r5, r6, r8, sl, sp, lr}^
     92c:	72657473 	rsbvc	r7, r5, #1929379840	; 0x73000000
     930:	7469625f 	strbtvc	r6, [r9], #-607	; 0xfffffda1
     934:	34683731 	strbtcc	r3, [r8], #-1841	; 0xfffff8cf
     938:	61313439 	teqvs	r1, r9, lsr r4
     93c:	30613664 	rsbcc	r3, r1, r4, ror #12
     940:	66333534 			; <UNDEFINED> instruction: 0x66333534
     944:	45303234 	ldrmi	r3, [r0, #-564]!	; 0xfffffdcc
     948:	656c6300 	strbvs	r6, [ip, #-768]!	; 0xfffffd00
     94c:	725f7261 	subsvc	r7, pc, #268435462	; 0x10000006
     950:	73696765 	cmnvc	r9, #26476544	; 0x1940000
     954:	5f726574 	svcpl	0x00726574
     958:	00746962 	rsbseq	r6, r4, r2, ror #18
     95c:	5f676572 	svcpl	0x00676572
     960:	006c6176 	rsbeq	r6, ip, r6, ror r1
     964:	314e5a5f 	cmpcc	lr, pc, asr sl
     968:	72657035 	rsbvc	r7, r5, #53	; 0x35
     96c:	65687069 	strbvs	r7, [r8, #-105]!	; 0xffffff97
     970:	5f6c6172 	svcpl	0x006c6172
     974:	73676572 	cmnvc	r7, #478150656	; 0x1c800000
     978:	6c633032 	stclvs	0, cr3, [r3], #-200	; 0xffffff38
     97c:	5f726165 	svcpl	0x00726165
     980:	69676572 	stmdbvs	r7!, {r1, r4, r5, r6, r8, sl, sp, lr}^
     984:	72657473 	rsbvc	r7, r5, #1929379840	; 0x73000000
     988:	6569665f 	strbvs	r6, [r9, #-1631]!	; 0xfffff9a1
     98c:	3731646c 	ldrcc	r6, [r1, -ip, ror #8]!
     990:	63303468 	teqvs	r0, #104, 8	; 0x68000000
     994:	32326463 	eorscc	r6, r2, #1660944384	; 0x63000000
     998:	37393830 			; <UNDEFINED> instruction: 0x37393830
     99c:	36646132 			; <UNDEFINED> instruction: 0x36646132
     9a0:	63004531 	movwvs	r4, #1329	; 0x531
     9a4:	7261656c 	rsbvc	r6, r1, #108, 10	; 0x1b000000
     9a8:	6765725f 			; <UNDEFINED> instruction: 0x6765725f
     9ac:	65747369 	ldrbvs	r7, [r4, #-873]!	; 0xfffffc97
     9b0:	69665f72 	stmdbvs	r6!, {r1, r4, r5, r6, r8, r9, sl, fp, ip, lr}^
     9b4:	00646c65 	rsbeq	r6, r4, r5, ror #24
     9b8:	00363175 	eorseq	r3, r6, r5, ror r1
     9bc:	6c656966 			; <UNDEFINED> instruction: 0x6c656966
     9c0:	69735f64 	ldmdbvs	r3!, {r2, r5, r6, r8, r9, sl, fp, ip, lr}^
     9c4:	6600657a 			; <UNDEFINED> instruction: 0x6600657a
     9c8:	646c6569 	strbtvs	r6, [ip], #-1385	; 0xfffffa97
     9cc:	6174735f 	cmnvs	r4, pc, asr r3
     9d0:	66007472 			; <UNDEFINED> instruction: 0x66007472
     9d4:	646c6569 	strbtvs	r6, [ip], #-1385	; 0xfffffa97
     9d8:	746e635f 	strbtvc	r6, [lr], #-863	; 0xfffffca1
     9dc:	72756300 	rsbsvc	r6, r5, #0, 6
     9e0:	69625f72 	stmdbvs	r2!, {r1, r4, r5, r6, r8, r9, sl, fp, ip, lr}^
     9e4:	5a5f0074 	bpl	17c0bbc <_umb_stack_size+0x17bfbbc>
     9e8:	6f63344e 	svcvs	0x0063344e
     9ec:	6e336572 	mrcvs	5, 1, r6, cr3, cr2, {3}
     9f0:	30326d75 	eorscc	r6, r2, r5, ror sp
     9f4:	544c245f 	strbpl	r2, [ip], #-1119	; 0xfffffba1
     9f8:	706d6924 	rsbvc	r6, sp, r4, lsr #18
     9fc:	3275246c 	rsbscc	r2, r5, #108, 8	; 0x6c000000
     a00:	38752430 	ldmdacc	r5!, {r4, r5, sl, sp}^
     a04:	24544724 	ldrbcs	r4, [r4], #-1828	; 0xfffff8dc
     a08:	6e753331 	mrcvs	3, 3, r3, cr5, cr1, {1}
     a0c:	63656863 	cmnvs	r5, #6488064	; 0x630000
     a10:	5f64656b 	svcpl	0x0064656b
     a14:	31646461 	cmncc	r4, r1, ror #8
     a18:	62656837 	rsbvs	r6, r5, #3604480	; 0x370000
     a1c:	36396365 	ldrtcc	r6, [r9], -r5, ror #6
     a20:	61633663 	cmnvs	r3, r3, ror #12
     a24:	61393633 	teqvs	r9, r3, lsr r6
     a28:	00453930 	subeq	r3, r5, r0, lsr r9
     a2c:	68636e75 	stmdavs	r3!, {r0, r2, r4, r5, r6, r9, sl, fp, sp, lr}^
     a30:	656b6365 	strbvs	r6, [fp, #-869]!	; 0xfffffc9b
     a34:	64615f64 	strbtvs	r5, [r1], #-3940	; 0xfffff09c
     a38:	68720064 	ldmdavs	r2!, {r2, r5, r6}^
     a3c:	697b0073 	ldmdbvs	fp!, {r0, r1, r4, r5, r6}^
     a40:	236c706d 	cmncs	ip, #109	; 0x6d
     a44:	007d3533 	rsbseq	r3, sp, r3, lsr r5
     a48:	344e5a5f 	strbcc	r5, [lr], #-2655	; 0xfffff5a1
     a4c:	4c245f36 	stcmi	15, cr5, [r4], #-216	; 0xffffff28
     a50:	38752454 	ldmdacc	r5!, {r2, r4, r6, sl, sp}^
     a54:	30327524 	eorscc	r7, r2, r4, lsr #10
     a58:	24736124 	ldrbtcs	r6, [r3], #-292	; 0xfffffedc
     a5c:	24303275 	ldrtcs	r3, [r0], #-629	; 0xfffffd8b
     a60:	65726f63 	ldrbvs	r6, [r2, #-3939]!	; 0xfffff09d
     a64:	74692e2e 	strbtvc	r2, [r9], #-3630	; 0xfffff1d2
     a68:	2e2e7265 	cdpcs	2, 2, cr7, cr14, cr5, {3}
     a6c:	676e6172 			; <UNDEFINED> instruction: 0x676e6172
     a70:	532e2e65 			; <UNDEFINED> instruction: 0x532e2e65
     a74:	24706574 	ldrbtcs	r6, [r0], #-1396	; 0xfffffa8c
     a78:	31245447 			; <UNDEFINED> instruction: 0x31245447
     a7c:	726f6637 	rsbvc	r6, pc, #57671680	; 0x3700000
     a80:	64726177 	ldrbtvs	r6, [r2], #-375	; 0xfffffe89
     a84:	636e755f 	cmnvs	lr, #398458880	; 0x17c00000
     a88:	6b636568 	blvs	18da030 <_umb_stack_size+0x18d9030>
     a8c:	37316465 	ldrcc	r6, [r1, -r5, ror #8]!
     a90:	64373268 	ldrtvs	r3, [r7], #-616	; 0xfffffd98
     a94:	37323863 	ldrcc	r3, [r2, -r3, ror #16]!
     a98:	64346532 	ldrtvs	r6, [r4], #-1330	; 0xffffface
     a9c:	34346239 	ldrtcc	r6, [r4], #-569	; 0xfffffdc7
     aa0:	66004537 			; <UNDEFINED> instruction: 0x66004537
     aa4:	6177726f 	cmnvs	r7, pc, ror #4
     aa8:	755f6472 	ldrbvc	r6, [pc, #-1138]	; 63e <_umb_stack_size-0x9c2>
     aac:	6568636e 	strbvs	r6, [r8, #-878]!	; 0xfffffc92
     ab0:	64656b63 	strbtvs	r6, [r5], #-2915	; 0xfffff49d
     ab4:	69737500 	ldmdbvs	r3!, {r8, sl, ip, sp, lr}^
     ab8:	5f00657a 	svcpl	0x0000657a
     abc:	61334e5a 	teqvs	r3, sl, asr lr
     ac0:	73336d72 	teqvc	r3, #7296	; 0x1c80
     ac4:	53397561 	teqpl	r9, #406847488	; 0x18400000
     ac8:	72447561 	subvc	r7, r4, #406847488	; 0x18400000
     acc:	72657669 	rsbvc	r7, r5, #110100480	; 0x6900000
     ad0:	616e6536 	cmnvs	lr, r6, lsr r5
     ad4:	31656c62 	cmncc	r5, r2, ror #24
     ad8:	61376837 	teqvs	r7, r7, lsr r8
     adc:	38633034 	stmdacc	r3!, {r2, r4, r5, ip, sp}^
     ae0:	33386138 	teqcc	r8, #56, 2
     ae4:	62306130 	eorsvs	r6, r0, #48, 2
     ae8:	00456664 	subeq	r6, r5, r4, ror #12
     aec:	62616e65 	rsbvs	r6, r1, #1616	; 0x650
     af0:	5f00656c 	svcpl	0x0000656c
     af4:	35314e5a 	ldrcc	r4, [r1, #-3674]!	; 0xfffff1a6
     af8:	69726570 	ldmdbvs	r2!, {r4, r5, r6, r8, sl, sp, lr}^
     afc:	72656870 	rsbvc	r6, r5, #112, 16	; 0x700000
     b00:	725f6c61 	subsvc	r6, pc, #24832	; 0x6100
     b04:	31736765 	cmncc	r3, r5, ror #14
     b08:	74657336 	strbtvc	r7, [r5], #-822	; 0xfffffcca
     b0c:	6765725f 			; <UNDEFINED> instruction: 0x6765725f
     b10:	65747369 	ldrbvs	r7, [r4, #-873]!	; 0xfffffc97
     b14:	69625f72 	stmdbvs	r2!, {r1, r4, r5, r6, r8, r9, sl, fp, ip, lr}^
     b18:	68373174 	ldmdavs	r7!, {r2, r4, r5, r6, r8, ip, sp}
     b1c:	32626163 	rsbcc	r6, r2, #-1073741800	; 0xc0000018
     b20:	37363762 	ldrcc	r3, [r6, -r2, ror #14]!
     b24:	35326232 	ldrcc	r6, [r2, #-562]!	; 0xfffffdce
     b28:	30326430 	eorscc	r6, r2, r0, lsr r4
     b2c:	65730045 	ldrbvs	r0, [r3, #-69]!	; 0xffffffbb
     b30:	65725f74 	ldrbvs	r5, [r2, #-3956]!	; 0xfffff08c
     b34:	74736967 	ldrbtvc	r6, [r3], #-2407	; 0xfffff699
     b38:	625f7265 	subsvs	r7, pc, #1342177286	; 0x50000006
     b3c:	5f007469 	svcpl	0x00007469
     b40:	35314e5a 	ldrcc	r4, [r1, #-3674]!	; 0xfffff1a6
     b44:	69726570 	ldmdbvs	r2!, {r4, r5, r6, r8, sl, sp, lr}^
     b48:	72656870 	rsbvc	r6, r5, #112, 16	; 0x700000
     b4c:	725f6c61 	subsvc	r6, pc, #24832	; 0x6100
     b50:	31736765 	cmncc	r3, r5, ror #14
     b54:	74657338 	strbtvc	r7, [r5], #-824	; 0xfffffcc8
     b58:	6765725f 			; <UNDEFINED> instruction: 0x6765725f
     b5c:	65747369 	ldrbvs	r7, [r4, #-873]!	; 0xfffffc97
     b60:	69665f72 	stmdbvs	r6!, {r1, r4, r5, r6, r8, r9, sl, fp, ip, lr}^
     b64:	31646c65 	cmncc	r4, r5, ror #24
     b68:	66656837 			; <UNDEFINED> instruction: 0x66656837
     b6c:	62626633 	rsbvs	r6, r2, #53477376	; 0x3300000
     b70:	61646232 	cmnvs	r4, r2, lsr r2
     b74:	36363738 			; <UNDEFINED> instruction: 0x36363738
     b78:	00456337 	subeq	r6, r5, r7, lsr r3
     b7c:	5f746573 	svcpl	0x00746573
     b80:	69676572 	stmdbvs	r7!, {r1, r4, r5, r6, r8, sl, sp, lr}^
     b84:	72657473 	rsbvc	r7, r5, #1929379840	; 0x73000000
     b88:	6569665f 	strbvs	r6, [r9, #-1631]!	; 0xfffff9a1
     b8c:	5f00646c 	svcpl	0x0000646c
     b90:	61334e5a 	teqvs	r3, sl, asr lr
     b94:	73336d72 	teqvc	r3, #7296	; 0x1c80
     b98:	53397561 	teqpl	r9, #406847488	; 0x18400000
     b9c:	72447561 	subvc	r7, r4, #406847488	; 0x18400000
     ba0:	72657669 	rsbvc	r7, r5, #110100480	; 0x6900000
     ba4:	65673531 	strbvs	r3, [r7, #-1329]!	; 0xfffffacf
     ba8:	72665f74 	rsbvc	r5, r6, #116, 30	; 0x1d0
     bac:	725f6565 	subsvc	r6, pc, #423624704	; 0x19400000
     bb0:	6f696765 	svcvs	0x00696765
     bb4:	6837316e 	ldmdavs	r7!, {r1, r2, r3, r5, r6, r8, ip, sp}
     bb8:	65343333 	ldrvs	r3, [r4, #-819]!	; 0xfffffccd
     bbc:	39323434 	ldmdbcc	r2!, {r2, r4, r5, sl, ip, sp}
     bc0:	61396335 	teqvs	r9, r5, lsr r3
     bc4:	38646364 	stmdacc	r4!, {r2, r5, r6, r8, r9, sp, lr}^
     bc8:	65670045 	strbvs	r0, [r7, #-69]!	; 0xffffffbb
     bcc:	72665f74 	rsbvc	r5, r6, #116, 30	; 0x1d0
     bd0:	725f6565 	subsvc	r6, pc, #423624704	; 0x19400000
     bd4:	6f696765 	svcvs	0x00696765
     bd8:	5a5f006e 	bpl	17c0d98 <_umb_stack_size+0x17bfd98>
     bdc:	3231314e 	eorscc	r3, r1, #-2147483629	; 0x80000013
     be0:	544c245f 	strbpl	r2, [ip], #-1119	; 0xfffffba1
     be4:	6d726124 	ldfvse	f6, [r2, #-144]!	; 0xffffff70
     be8:	61732e2e 	cmnvs	r3, lr, lsr #28
     bec:	532e2e75 			; <UNDEFINED> instruction: 0x532e2e75
     bf0:	72447561 	subvc	r7, r4, #406847488	; 0x18400000
     bf4:	72657669 	rsbvc	r7, r5, #110100480	; 0x6900000
     bf8:	30327524 	eorscc	r7, r2, r4, lsr #10
     bfc:	24736124 	ldrbtcs	r6, [r3], #-292	; 0xfffffedc
     c00:	24303275 	ldrtcs	r3, [r0], #-629	; 0xfffffd8b
     c04:	6e72656b 	cdpvs	5, 7, cr6, cr2, cr11, {3}
     c08:	2e2e6c65 	cdpcs	12, 2, cr6, cr14, cr5, {3}
     c0c:	6f6d656d 	svcvs	0x006d656d
     c10:	705f7972 	subsvc	r7, pc, r2, ror r9	; <UNPREDICTABLE>
     c14:	65746f72 	ldrbvs	r6, [r4, #-3954]!	; 0xfffff08e
     c18:	6f697463 	svcvs	0x00697463
     c1c:	65735f6e 	ldrbvs	r5, [r3, #-3950]!	; 0xfffff092
     c20:	72657672 	rsbvc	r7, r5, #119537664	; 0x7200000
     c24:	656d2e2e 	strbvs	r2, [sp, #-3630]!	; 0xfffff1d2
     c28:	79726f6d 	ldmdbvc	r2!, {r0, r2, r3, r5, r6, r8, r9, sl, fp, sp, lr}^
     c2c:	6175675f 	cmnvs	r5, pc, asr r7
     c30:	2e2e6472 	mcrcs	4, 1, r6, cr14, cr2, {3}
     c34:	6f6d654d 	svcvs	0x006d654d
     c38:	65537972 	ldrbvs	r7, [r3, #-2418]	; 0xfffff68e
     c3c:	69727563 	ldmdbvs	r2!, {r0, r1, r5, r6, r8, sl, ip, sp, lr}^
     c40:	75477974 	strbvc	r7, [r7, #-2420]	; 0xfffff68c
     c44:	54647261 	strbtpl	r7, [r4], #-609	; 0xfffffd9f
     c48:	74696172 	strbtvc	r6, [r9], #-370	; 0xfffffe8e
     c4c:	24544724 	ldrbcs	r4, [r4], #-1828	; 0xfffff8dc
     c50:	656d3832 	strbvs	r3, [sp, #-2098]!	; 0xfffff7ce
     c54:	79726f6d 	ldmdbvc	r2!, {r0, r2, r3, r5, r6, r8, r9, sl, fp, sp, lr}^
     c58:	6365735f 	cmnvs	r5, #2080374785	; 0x7c000001
     c5c:	74697275 	strbtvc	r7, [r9], #-629	; 0xfffffd8b
     c60:	75675f79 	strbvc	r5, [r7, #-3961]!	; 0xfffff087
     c64:	5f647261 	svcpl	0x00647261
     c68:	61657263 	cmnvs	r5, r3, ror #4
     c6c:	37316574 			; <UNDEFINED> instruction: 0x37316574
     c70:	63656668 	cmnvs	r5, #104, 12	; 0x6800000
     c74:	66636430 			; <UNDEFINED> instruction: 0x66636430
     c78:	66356335 			; <UNDEFINED> instruction: 0x66356335
     c7c:	32646234 	rsbcc	r6, r4, #52, 4	; 0x40000003
     c80:	6d004536 	cfstr32vs	mvfx4, [r0, #-216]	; 0xffffff28
     c84:	726f6d65 	rsbvc	r6, pc, #6464	; 0x1940
     c88:	65735f79 	ldrbvs	r5, [r3, #-3961]!	; 0xfffff087
     c8c:	69727563 	ldmdbvs	r2!, {r0, r1, r5, r6, r8, sl, ip, sp, lr}^
     c90:	675f7974 			; <UNDEFINED> instruction: 0x675f7974
     c94:	64726175 	ldrbtvs	r6, [r2], #-373	; 0xfffffe8b
     c98:	6572635f 	ldrbvs	r6, [r2, #-863]!	; 0xfffffca1
     c9c:	00657461 	rsbeq	r7, r5, r1, ror #8
     ca0:	6f6d656d 	svcvs	0x006d656d
     ca4:	625f7972 	subsvs	r7, pc, #1867776	; 0x1c8000
     ca8:	6b636f6c 	blvs	18dca60 <_umb_stack_size+0x18dba60>
     cac:	73696c5f 	cmnvc	r9, #24320	; 0x5f00
     cb0:	6c620074 	stclvs	0, cr0, [r2], #-464	; 0xfffffe30
     cb4:	5f6b636f 	svcpl	0x006b636f
     cb8:	65736162 	ldrbvs	r6, [r3, #-354]!	; 0xfffffe9e
     cbc:	6464615f 	strbtvs	r6, [r4], #-351	; 0xfffffea1
     cc0:	73736572 	cmnvc	r3, #478150656	; 0x1c800000
     cc4:	6f6c6200 	svcvs	0x006c6200
     cc8:	615f6b63 	cmpvs	pc, r3, ror #22
     ccc:	73656363 	cmnvc	r5, #-1946157055	; 0x8c000001
     cd0:	74615f73 	strbtvc	r5, [r1], #-3955	; 0xfffff08d
     cd4:	62697274 	rsbvs	r7, r9, #116, 4	; 0x40000007
     cd8:	00657475 	rsbeq	r7, r5, r5, ror r4
     cdc:	636f6c62 	cmnvs	pc, #25088	; 0x6200
     ce0:	65735f6b 	ldrbvs	r5, [r3, #-3947]!	; 0xfffff095
     ce4:	69727563 	ldmdbvs	r2!, {r0, r1, r5, r6, r8, sl, ip, sp, lr}^
     ce8:	615f7974 	cmpvs	pc, r4, ror r9	; <UNPREDICTABLE>
     cec:	69727474 	ldmdbvs	r2!, {r2, r4, r5, r6, sl, ip, sp, lr}^
     cf0:	65747562 	ldrbvs	r7, [r4, #-1378]!	; 0xfffffa9e
     cf4:	6d654d00 	stclvs	13, cr4, [r5, #-0]
     cf8:	4279726f 	rsbsmi	r7, r9, #-268435450	; 0xf0000006
     cfc:	6b636f6c 	blvs	18dcab4 <_umb_stack_size+0x18dbab4>
     d00:	6d656d00 	stclvs	13, cr6, [r5, #-0]
     d04:	5f79726f 	svcpl	0x0079726f
     d08:	636f6c62 	cmnvs	pc, #25088	; 0x6200
     d0c:	696c5f6b 	stmdbvs	ip!, {r0, r1, r3, r5, r6, r8, r9, sl, fp, ip, lr}^
     d10:	735f7473 	cmpvc	pc, #1929379840	; 0x73000000
     d14:	00657a69 	rsbeq	r7, r5, r9, ror #20
     d18:	72656b26 	rsbvc	r6, r5, #38912	; 0x9800
     d1c:	3a6c656e 	bcc	1b1a2dc <_umb_stack_size+0x1b192dc>
     d20:	6d6f633a 	stclvs	3, cr6, [pc, #-232]!	; c40 <_umb_stack_size-0x3c0>
     d24:	3a6e6f6d 	bcc	1b9cae0 <_umb_stack_size+0x1b9bae0>
     d28:	6d656d3a 	stclvs	13, cr6, [r5, #-232]!	; 0xffffff18
     d2c:	5f79726f 	svcpl	0x0079726f
     d30:	6f79616c 	svcvs	0x0079616c
     d34:	3a3a7475 	bcc	e9df10 <_umb_stack_size+0xe9cf10>
     d38:	6f6d654d 	svcvs	0x006d654d
     d3c:	6c427972 	mcrrvs	9, 7, r7, r2, cr2	; <UNPREDICTABLE>
     d40:	4c6b636f 	stclmi	3, cr6, [fp], #-444	; 0xfffffe44
     d44:	00747369 	rsbseq	r7, r4, r9, ror #6
     d48:	69676572 	stmdbvs	r7!, {r1, r4, r5, r6, r8, sl, sp, lr}^
     d4c:	625f6e6f 	subsvs	r6, pc, #1776	; 0x6f0
     d50:	5f657361 	svcpl	0x00657361
     d54:	72646461 	rsbvc	r6, r4, #1627389952	; 0x61000000
     d58:	00737365 	rsbseq	r7, r3, r5, ror #6
     d5c:	69676572 	stmdbvs	r7!, {r1, r4, r5, r6, r8, sl, sp, lr}^
     d60:	6c5f6e6f 	mrrcvs	14, 6, r6, pc, cr15	; <UNPREDICTABLE>
     d64:	74696d69 	strbtvc	r6, [r9], #-3433	; 0xfffff297
     d68:	6464615f 	strbtvs	r6, [r4], #-351	; 0xfffffea1
     d6c:	73736572 	cmnvc	r3, #478150656	; 0x1c800000
     d70:	75617300 	strbvc	r7, [r1, #-768]!	; 0xfffffd00
     d74:	6765725f 			; <UNDEFINED> instruction: 0x6765725f
     d78:	5f6e6f69 	svcpl	0x006e6f69
     d7c:	666e6f63 	strbtvs	r6, [lr], -r3, ror #30
     d80:	62006769 	andvs	r6, r0, #27525120	; 0x1a40000
     d84:	5f657361 	svcpl	0x00657361
     d88:	72646461 	rsbvc	r6, r4, #1627389952	; 0x61000000
     d8c:	6d696c00 	stclvs	12, cr6, [r9, #-0]
     d90:	615f7469 	cmpvs	pc, r9, ror #8
     d94:	00726464 	rsbseq	r6, r2, r4, ror #8
     d98:	0063736e 	rsbeq	r7, r3, lr, ror #6
     d9c:	72006e65 	andvc	r6, r0, #1616	; 0x650
     da0:	006d756e 	rsbeq	r7, sp, lr, ror #10
     da4:	334e5a5f 	movtcc	r5, #59999	; 0xea5f
     da8:	336d7261 	cmncc	sp, #268435462	; 0x10000006
     dac:	39756173 	ldmdbcc	r5!, {r0, r1, r4, r5, r6, r8, sp, lr}^
     db0:	44756153 	ldrbtmi	r6, [r5], #-339	; 0xfffffead
     db4:	65766972 	ldrbvs	r6, [r6, #-2418]!	; 0xfffff68e
     db8:	63333172 	teqvs	r3, #-2147483620	; 0x8000001c
     dbc:	74616572 	strbtvc	r6, [r1], #-1394	; 0xfffffa8e
     dc0:	65725f65 	ldrbvs	r5, [r2, #-3941]!	; 0xfffff09b
     dc4:	6e6f6967 	vnmulvs.f16	s13, s30, s15	; <UNPREDICTABLE>
     dc8:	38683731 	stmdacc	r8!, {r0, r4, r5, r8, r9, sl, ip, sp}^
     dcc:	62643563 	rsbvs	r3, r4, #415236096	; 0x18c00000
     dd0:	30653035 	rsbcc	r3, r5, r5, lsr r0
     dd4:	30623363 	rsbcc	r3, r2, r3, ror #6
     dd8:	45356632 	ldrmi	r6, [r5, #-1586]!	; 0xfffff9ce
     ddc:	65726300 	ldrbvs	r6, [r2, #-768]!	; 0xfffffd00
     de0:	5f657461 	svcpl	0x00657461
     de4:	69676572 	stmdbvs	r7!, {r1, r4, r5, r6, r8, sl, sp, lr}^
     de8:	26006e6f 	strcs	r6, [r0], -pc, ror #28
     dec:	3a6d7261 	bcc	1b5d778 <_umb_stack_size+0x1b5c778>
     df0:	7561733a 	strbvc	r7, [r1, #-826]!	; 0xfffffcc6
     df4:	61533a3a 	cmpvs	r3, sl, lsr sl
     df8:	67655275 			; <UNDEFINED> instruction: 0x67655275
     dfc:	436e6f69 	cmnmi	lr, #420	; 0x1a4
     e00:	69666e6f 	stmdbvs	r6!, {r0, r1, r2, r3, r5, r6, r9, sl, fp, sp, lr}^
     e04:	697b0067 	ldmdbvs	fp!, {r0, r1, r2, r5, r6}^
     e08:	236c706d 	cmncs	ip, #109	; 0x6d
     e0c:	5f007d38 	svcpl	0x00007d38
     e10:	63344e5a 	teqvs	r4, #1440	; 0x5a0
     e14:	3365726f 	cmncc	r5, #-268435450	; 0xf0000006
     e18:	326d756e 	rsbcc	r7, sp, #461373440	; 0x1b800000
     e1c:	4c245f31 	stcmi	15, cr5, [r4], #-196	; 0xffffff3c
     e20:	6d692454 	cfstrdvs	mvd2, [r9, #-336]!	; 0xfffffeb0
     e24:	75246c70 	strvc	r6, [r4, #-3184]!	; 0xfffff390
     e28:	75243032 	strvc	r3, [r4, #-50]!	; 0xffffffce
     e2c:	47243233 			; <UNDEFINED> instruction: 0x47243233
     e30:	33312454 	teqcc	r1, #84, 8	; 0x54000000
     e34:	68636e75 	stmdavs	r3!, {r0, r2, r4, r5, r6, r9, sl, fp, sp, lr}^
     e38:	656b6365 	strbvs	r6, [fp, #-869]!	; 0xfffffc9b
     e3c:	64615f64 	strbtvs	r5, [r1], #-3940	; 0xfffff09c
     e40:	68373164 	ldmdavs	r7!, {r2, r5, r6, r8, ip, sp}
     e44:	36623236 			; <UNDEFINED> instruction: 0x36623236
     e48:	33666530 	cmncc	r6, #48, 10	; 0xc000000
     e4c:	37663766 	strbcc	r3, [r6, -r6, ror #14]!
     e50:	33626362 	cmncc	r2, #-2013265919	; 0x88000001
     e54:	697b0045 	ldmdbvs	fp!, {r0, r2, r6}^
     e58:	236c706d 	cmncs	ip, #109	; 0x6d
     e5c:	007d3933 	rsbseq	r3, sp, r3, lsr r9
     e60:	344e5a5f 	strbcc	r5, [lr], #-2655	; 0xfffff5a1
     e64:	4c245f37 	stcmi	15, cr5, [r4], #-220	; 0xffffff24
     e68:	33752454 	cmncc	r5, #84, 8	; 0x54000000
     e6c:	32752432 	rsbscc	r2, r5, #838860800	; 0x32000000
     e70:	73612430 	cmnvc	r1, #48, 8	; 0x30000000
     e74:	30327524 	eorscc	r7, r2, r4, lsr #10
     e78:	726f6324 	rsbvc	r6, pc, #36, 6	; 0x90000000
     e7c:	692e2e65 	stmdbvs	lr!, {r0, r2, r5, r6, r9, sl, fp, sp}
     e80:	2e726574 	mrccs	5, 3, r6, cr2, cr4, {3}
     e84:	6e61722e 	cdpvs	2, 6, cr7, cr1, cr14, {1}
     e88:	2e2e6567 	cfsh64cs	mvdx6, mvdx14, #55
     e8c:	70657453 	rsbvc	r7, r5, r3, asr r4
     e90:	24544724 	ldrbcs	r4, [r4], #-1828	; 0xfffff8dc
     e94:	6f663731 	svcvs	0x00663731
     e98:	72617772 	rsbvc	r7, r1, #29884416	; 0x1c80000
     e9c:	6e755f64 	cdpvs	15, 7, cr5, cr5, cr4, {3}
     ea0:	63656863 	cmnvs	r5, #6488064	; 0x630000
     ea4:	3164656b 	cmncc	r4, fp, ror #10
     ea8:	65376837 	ldrvs	r6, [r7, #-2103]!	; 0xfffff7c9
     eac:	39366139 	ldmdbcc	r6!, {r0, r3, r4, r5, r8, sp, lr}
     eb0:	30313634 	eorscc	r3, r1, r4, lsr r6
     eb4:	62316635 	eorsvs	r6, r1, #55574528	; 0x3500000
     eb8:	00456338 	subeq	r6, r5, r8, lsr r3
     ebc:	384e5a5f 	stmdacc	lr, {r0, r1, r2, r3, r4, r6, r9, fp, ip, lr}^
     ec0:	4c245f39 	stcmi	15, cr5, [r4], #-228	; 0xffffff1c
     ec4:	6f632454 	svcvs	0x00632454
     ec8:	2e2e6572 	mcrcs	5, 1, r6, cr14, cr2, {3}
     ecc:	2e73706f 	cdpcs	0, 7, cr7, cr3, cr15, {3}
     ed0:	6e61722e 	cdpvs	2, 6, cr7, cr1, cr14, {1}
     ed4:	2e2e6567 	cfsh64cs	mvdx6, mvdx14, #55
     ed8:	676e6152 			; <UNDEFINED> instruction: 0x676e6152
     edc:	544c2465 	strbpl	r2, [ip], #-1125	; 0xfffffb9b
     ee0:	47245424 	strmi	r5, [r4, -r4, lsr #8]!
     ee4:	75242454 	strvc	r2, [r4, #-1108]!	; 0xfffffbac
     ee8:	61243032 			; <UNDEFINED> instruction: 0x61243032
     eec:	32752473 	rsbscc	r2, r5, #1929379840	; 0x73000000
     ef0:	6f632430 	svcvs	0x00632430
     ef4:	2e2e6572 	mcrcs	5, 1, r6, cr14, cr2, {3}
     ef8:	72657469 	rsbvc	r7, r5, #1761607680	; 0x69000000
     efc:	61722e2e 	cmnvs	r2, lr, lsr #28
     f00:	2e65676e 	cdpcs	7, 6, cr6, cr5, cr14, {3}
     f04:	6e61522e 	cdpvs	2, 6, cr5, cr1, cr14, {1}
     f08:	74496567 	strbvc	r6, [r9], #-1383	; 0xfffffa99
     f0c:	74617265 	strbtvc	r7, [r1], #-613	; 0xfffffd9b
     f10:	6d49726f 	sfmvs	f7, 2, [r9, #-444]	; 0xfffffe44
     f14:	47246c70 			; <UNDEFINED> instruction: 0x47246c70
     f18:	73392454 	teqvc	r9, #84, 8	; 0x54000000
     f1c:	5f636570 	svcpl	0x00636570
     f20:	7478656e 	ldrbtvc	r6, [r8], #-1390	; 0xfffffa92
     f24:	36683731 			; <UNDEFINED> instruction: 0x36683731
     f28:	30356230 	eorscc	r6, r5, r0, lsr r2
     f2c:	33316632 	teqcc	r1, #52428800	; 0x3200000
     f30:	61333334 	teqvs	r3, r4, lsr r3
     f34:	45646439 	strbmi	r6, [r4, #-1081]!	; 0xfffffbc7
     f38:	65707300 	ldrbvs	r7, [r0, #-768]!	; 0xfffffd00
     f3c:	656e5f63 	strbvs	r5, [lr, #-3939]!	; 0xfffff09d
     f40:	753c7478 	ldrvc	r7, [ip, #-1144]!	; 0xfffffb88
     f44:	003e3233 	eorseq	r3, lr, r3, lsr r2
     f48:	6974704f 	ldmdbvs	r4!, {r0, r1, r2, r3, r6, ip, sp, lr}^
     f4c:	753c6e6f 	ldrvc	r6, [ip, #-3695]!	; 0xfffff191
     f50:	003e3233 	eorseq	r3, lr, r3, lsr r2
     f54:	74756d26 	ldrbtvc	r6, [r5], #-3366	; 0xfffff2da
     f58:	726f6320 	rsbvc	r6, pc, #32, 6	; 0x80000000
     f5c:	6f3a3a65 	svcvs	0x003a3a65
     f60:	3a3a7370 	bcc	e9dd28 <_umb_stack_size+0xe9cd28>
     f64:	676e6172 			; <UNDEFINED> instruction: 0x676e6172
     f68:	523a3a65 	eorspl	r3, sl, #413696	; 0x65000
     f6c:	65676e61 	strbvs	r6, [r7, #-3681]!	; 0xfffff19f
     f70:	3233753c 	eorscc	r7, r3, #60, 10	; 0xf000000
     f74:	5a5f003e 	bpl	17c1074 <_umb_stack_size+0x17c0074>
     f78:	6f63344e 	svcvs	0x0063344e
     f7c:	69346572 	ldmdbvs	r4!, {r1, r4, r5, r6, r8, sl, sp, lr}
     f80:	35726574 	ldrbcc	r6, [r2, #-1396]!	; 0xfffffa8c
     f84:	676e6172 			; <UNDEFINED> instruction: 0x676e6172
     f88:	31303165 	teqcc	r0, r5, ror #2
     f8c:	544c245f 	strbpl	r2, [ip], #-1119	; 0xfffffba1
     f90:	706d6924 	rsbvc	r6, sp, r4, lsr #18
     f94:	3275246c 	rsbscc	r2, r5, #108, 8	; 0x6c000000
     f98:	6f632430 	svcvs	0x00632430
     f9c:	2e2e6572 	mcrcs	5, 1, r6, cr14, cr2, {3}
     fa0:	72657469 	rsbvc	r7, r5, #1761607680	; 0x69000000
     fa4:	72742e2e 	rsbsvc	r2, r4, #736	; 0x2e0
     fa8:	73746961 	cmnvc	r4, #1589248	; 0x184000
     fac:	74692e2e 	strbtvc	r2, [r9], #-3630	; 0xfffff1d2
     fb0:	74617265 	strbtvc	r7, [r1], #-613	; 0xfffffd9b
     fb4:	2e2e726f 	cdpcs	2, 2, cr7, cr14, cr15, {3}
     fb8:	72657449 	rsbvc	r7, r5, #1224736768	; 0x49000000
     fbc:	726f7461 	rsbvc	r7, pc, #1627389952	; 0x61000000
     fc0:	30327524 	eorscc	r7, r2, r4, lsr #10
     fc4:	726f6624 	rsbvc	r6, pc, #36, 12	; 0x2400000
     fc8:	30327524 	eorscc	r7, r2, r4, lsr #10
     fcc:	726f6324 	rsbvc	r6, pc, #36, 6	; 0x90000000
     fd0:	6f2e2e65 	svcvs	0x002e2e65
     fd4:	2e2e7370 	mcrcs	3, 1, r7, cr14, cr0, {3}
     fd8:	676e6172 			; <UNDEFINED> instruction: 0x676e6172
     fdc:	522e2e65 	eorpl	r2, lr, #1616	; 0x650
     fe0:	65676e61 	strbvs	r6, [r7, #-3681]!	; 0xfffff19f
     fe4:	24544c24 	ldrbcs	r4, [r4], #-3108	; 0xfffff3dc
     fe8:	54472441 	strbpl	r2, [r7], #-1089	; 0xfffffbbf
     fec:	54472424 	strbpl	r2, [r7], #-1060	; 0xfffffbdc
     ff0:	656e3424 	strbvs	r3, [lr, #-1060]!	; 0xfffffbdc
     ff4:	37317478 			; <UNDEFINED> instruction: 0x37317478
     ff8:	62656368 	rsbvs	r6, r5, #104, 6	; 0xa0000001
     ffc:	33386639 	teqcc	r8, #59768832	; 0x3900000
    1000:	39306263 	ldmdbcc	r0!, {r0, r1, r5, r6, r9, sp, lr}
    1004:	63636231 	cmnvs	r3, #268435459	; 0x10000003
    1008:	67004536 	smladxvs	r0, r6, r5, r4
    100c:	00637a74 	rsbeq	r7, r3, r4, ror sl
    1010:	706d697b 	rsbvc	r6, sp, fp, ror r9
    1014:	7d31236c 	ldcvc	3, cr2, [r1, #-432]!	; 0xfffffe50
    1018:	4e5a5f00 	cdpmi	15, 5, cr5, cr10, cr0, {0}
    101c:	5f383131 	svcpl	0x00383131
    1020:	24544c24 	ldrbcs	r4, [r4], #-3108	; 0xfffff3dc
    1024:	76697264 	strbtvc	r7, [r9], -r4, ror #4
    1028:	2e737265 	cdpcs	2, 7, cr7, cr3, cr5, {3}
    102c:	7a74672e 	bvc	1d1acec <_umb_stack_size+0x1d19cec>
    1030:	472e2e63 	strmi	r2, [lr, -r3, ror #28]!
    1034:	44637a74 	strbtmi	r7, [r3], #-2676	; 0xfffff58c
    1038:	65766972 	ldrbvs	r6, [r6, #-2418]!	; 0xfffff68e
    103c:	32752472 	rsbscc	r2, r5, #1912602624	; 0x72000000
    1040:	73612430 	cmnvc	r1, #48, 8	; 0x30000000
    1044:	30327524 	eorscc	r7, r2, r4, lsr #10
    1048:	72656b24 	rsbvc	r6, r5, #36, 22	; 0x9000
    104c:	2e6c656e 	cdpcs	5, 6, cr6, cr12, cr14, {3}
    1050:	6d656d2e 	stclvs	13, cr6, [r5, #-184]!	; 0xffffff48
    1054:	5f79726f 	svcpl	0x0079726f
    1058:	746f7270 	strbtvc	r7, [pc], #-624	; 1060 <_umb_stack_size+0x60>
    105c:	69746365 	ldmdbvs	r4!, {r0, r2, r5, r6, r8, r9, sp, lr}^
    1060:	735f6e6f 	cmpvc	pc, #1776	; 0x6f0
    1064:	65767265 	ldrbvs	r7, [r6, #-613]!	; 0xfffffd9b
    1068:	6d2e2e72 	stcvs	14, cr2, [lr, #-456]!	; 0xfffffe38
    106c:	726f6d65 	rsbvc	r6, pc, #6464	; 0x1940
    1070:	75675f79 	strbvc	r5, [r7, #-3961]!	; 0xfffff087
    1074:	2e647261 	cdpcs	2, 6, cr7, cr4, cr1, {3}
    1078:	6d654d2e 	stclvs	13, cr4, [r5, #-184]!	; 0xffffff48
    107c:	5379726f 	cmnpl	r9, #-268435450	; 0xf0000006
    1080:	72756365 	rsbsvc	r6, r5, #-1811939327	; 0x94000001
    1084:	47797469 	ldrbmi	r7, [r9, -r9, ror #8]!
    1088:	64726175 	ldrbtvs	r6, [r2], #-373	; 0xfffffe8b
    108c:	69617254 	stmdbvs	r1!, {r2, r4, r6, r9, ip, sp, lr}^
    1090:	54472474 	strbpl	r2, [r7], #-1140	; 0xfffffb8c
    1094:	6d383224 	lfmvs	f3, 4, [r8, #-144]!	; 0xffffff70
    1098:	726f6d65 	rsbvc	r6, pc, #6464	; 0x1940
    109c:	65735f79 	ldrbvs	r5, [r3, #-3961]!	; 0xfffff087
    10a0:	69727563 	ldmdbvs	r2!, {r0, r1, r5, r6, r8, sl, ip, sp, lr}^
    10a4:	675f7974 			; <UNDEFINED> instruction: 0x675f7974
    10a8:	64726175 	ldrbtvs	r6, [r2], #-373	; 0xfffffe8b
    10ac:	6572635f 	ldrbvs	r6, [r2, #-863]!	; 0xfffffca1
    10b0:	31657461 	cmncc	r5, r1, ror #8
    10b4:	64396837 	ldrtvs	r6, [r9], #-2103	; 0xfffff7c9
    10b8:	31633733 	cmncc	r3, r3, lsr r7
    10bc:	35333531 	ldrcc	r3, [r3, #-1329]!	; 0xfffffacf
    10c0:	34613536 	strbtcc	r3, [r1], #-1334	; 0xfffffaca
    10c4:	00456438 	subeq	r6, r5, r8, lsr r4
    10c8:	74756d26 	ldrbtvc	r6, [r5], #-3366	; 0xfffff2da
    10cc:	69726420 	ldmdbvs	r2!, {r5, sl, sp, lr}^
    10d0:	73726576 	cmnvc	r2, #494927872	; 0x1d800000
    10d4:	74673a3a 	strbtvc	r3, [r7], #-2618	; 0xfffff5c6
    10d8:	3a3a637a 	bcc	e99ec8 <_umb_stack_size+0xe98ec8>
    10dc:	637a7447 	cmnvs	sl, #1191182336	; 0x47000000
    10e0:	76697244 	strbtvc	r7, [r9], -r4, asr #4
    10e4:	62007265 	andvs	r7, r0, #1342177286	; 0x50000006
    10e8:	316b6e61 	cmncc	fp, r1, ror #28
    10ec:	6174735f 	cmnvs	r4, pc, asr r3
    10f0:	5f007472 	svcpl	0x00007472
    10f4:	6b6e6162 	blvs	1b99684 <_umb_stack_size+0x1b98684>
    10f8:	6e655f31 	mcrvs	15, 3, r5, cr5, cr1, {1}
    10fc:	33690064 	cmncc	r9, #100	; 0x64
    1100:	625f0032 	subsvs	r0, pc, #50	; 0x32
    1104:	326b6e61 	rsbcc	r6, fp, #1552	; 0x610
    1108:	6174735f 	cmnvs	r4, pc, asr r3
    110c:	62007472 	andvs	r7, r0, #1912602624	; 0x72000000
    1110:	326b6e61 	rsbcc	r6, fp, #1552	; 0x610
    1114:	646e655f 	strbtvs	r6, [lr], #-1375	; 0xfffffaa1
    1118:	63657300 	cmnvs	r5, #0, 6
    111c:	5f657275 	svcpl	0x00657275
    1120:	67616c66 	strbvs	r6, [r1, -r6, ror #24]!
    1124:	7a746700 	bvc	1d1ad2c <_umb_stack_size+0x1d19d2c>
    1128:	6c625f63 	stclvs	15, cr5, [r2], #-396	; 0xfffffe74
    112c:	5f6b636f 	svcpl	0x006b636f
    1130:	5f726570 	svcpl	0x00726570
    1134:	6f6d656d 	svcvs	0x006d656d
    1138:	625f7972 	subsvs	r7, pc, #1867776	; 0x1c8000
    113c:	6b636f6c 	blvs	18dcef4 <_umb_stack_size+0x18dbef4>
    1140:	7a746700 	bvc	1d1ad48 <_umb_stack_size+0x1d19d48>
    1144:	6c625f63 	stclvs	15, cr5, [r2], #-396	; 0xfffffe74
    1148:	5f6b636f 	svcpl	0x006b636f
    114c:	006d756e 	rsbeq	r7, sp, lr, ror #10
    1150:	7500695f 	strvc	r6, [r0, #-2399]	; 0xfffff6a1
    1154:	72657070 	rsbvc	r7, r5, #112	; 0x70
    1158:	6464615f 	strbtvs	r6, [r4], #-351	; 0xfffffea1
    115c:	73736572 	cmnvc	r3, #478150656	; 0x1c800000
    1160:	0064695f 	rsbeq	r6, r4, pc, asr r9
    1164:	65776f6c 	ldrbvs	r6, [r7, #-3948]!	; 0xfffff094
    1168:	64615f72 	strbtvs	r5, [r1], #-3954	; 0xfffff08e
    116c:	73657264 	cmnvc	r5, #100, 4	; 0x40000006
    1170:	64695f73 	strbtvs	r5, [r9], #-3955	; 0xfffff08d
    1174:	70757300 	rsbsvc	r7, r5, r0, lsl #6
    1178:	625f7265 	subsvs	r7, pc, #1342177286	; 0x50000006
    117c:	6b636f6c 	blvs	18dcf34 <_umb_stack_size+0x18dbf34>
    1180:	0064695f 	rsbeq	r6, r4, pc, asr r9
    1184:	374e5a5f 	smlsldcc	r5, lr, pc, sl	; <UNPREDICTABLE>
    1188:	76697264 	strbtvc	r7, [r9], -r4, ror #4
    118c:	34737265 	ldrbtcc	r7, [r3], #-613	; 0xfffffd9b
    1190:	637a7467 	cmnvs	sl, #1728053248	; 0x67000000
    1194:	74473031 	strbvc	r3, [r7], #-49	; 0xffffffcf
    1198:	7244637a 	subvc	r6, r4, #-402653183	; 0xe8000001
    119c:	72657669 	rsbvc	r7, r5, #110100480	; 0x6900000
    11a0:	65733532 	ldrbvs	r3, [r3, #-1330]!	; 0xffffface
    11a4:	656d5f74 	strbvs	r5, [sp, #-3956]!	; 0xfffff08c
    11a8:	79726f6d 	ldmdbvc	r2!, {r0, r2, r3, r5, r6, r8, r9, sl, fp, sp, lr}^
    11ac:	6f6c625f 	svcvs	0x006c625f
    11b0:	735f6b63 	cmpvc	pc, #101376	; 0x18c00
    11b4:	72756365 	rsbsvc	r6, r5, #-1811939327	; 0x94000001
    11b8:	31797469 	cmncc	r9, r9, ror #8
    11bc:	30306837 	eorscc	r6, r0, r7, lsr r8
    11c0:	36323034 			; <UNDEFINED> instruction: 0x36323034
    11c4:	30393363 	eorscc	r3, r9, r3, ror #6
    11c8:	65613134 	strbvs	r3, [r1, #-308]!	; 0xfffffecc
    11cc:	00453362 	subeq	r3, r5, r2, ror #6
    11d0:	5f746573 	svcpl	0x00746573
    11d4:	6f6d656d 	svcvs	0x006d656d
    11d8:	625f7972 	subsvs	r7, pc, #1867776	; 0x1c8000
    11dc:	6b636f6c 	blvs	18dcf94 <_umb_stack_size+0x18dbf94>
    11e0:	6365735f 	cmnvs	r5, #2080374785	; 0x7c000001
    11e4:	74697275 	strbtvc	r7, [r9], #-629	; 0xfffffd8b
    11e8:	656d0079 	strbvs	r0, [sp, #-121]!	; 0xffffff87
    11ec:	79726f6d 	ldmdbvc	r2!, {r0, r2, r3, r5, r6, r8, r9, sl, fp, sp, lr}^
    11f0:	6e61625f 	mcrvs	2, 3, r6, cr1, cr15, {2}
    11f4:	64695f6b 	strbtvs	r5, [r9], #-3947	; 0xfffff095
    11f8:	6f6c6200 	svcvs	0x006c6200
    11fc:	725f6b63 	subsvc	r6, pc, #101376	; 0x18c00
    1200:	6f5f6765 	svcvs	0x005f6765
    1204:	65736666 	ldrbvs	r6, [r3, #-1638]!	; 0xfffff99a
    1208:	6c620074 	stclvs	0, cr0, [r2], #-464	; 0xfffffe30
    120c:	5f6b636f 	svcpl	0x006b636f
    1210:	6d746962 			; <UNDEFINED> instruction: 0x6d746962
    1214:	006b7361 	rsbeq	r7, fp, r1, ror #6
    1218:	384e5a5f 	stmdacc	lr, {r0, r1, r2, r3, r4, r6, r9, fp, ip, lr}^
    121c:	4c245f39 	stcmi	15, cr5, [r4], #-228	; 0xffffff1c
    1220:	6f632454 	svcvs	0x00632454
    1224:	2e2e6572 	mcrcs	5, 1, r6, cr14, cr2, {3}
    1228:	2e73706f 	cdpcs	0, 7, cr7, cr3, cr15, {3}
    122c:	6e61722e 	cdpvs	2, 6, cr7, cr1, cr14, {1}
    1230:	2e2e6567 	cfsh64cs	mvdx6, mvdx14, #55
    1234:	676e6152 			; <UNDEFINED> instruction: 0x676e6152
    1238:	544c2465 	strbpl	r2, [ip], #-1125	; 0xfffffb9b
    123c:	47245424 	strmi	r5, [r4, -r4, lsr #8]!
    1240:	75242454 	strvc	r2, [r4, #-1108]!	; 0xfffffbac
    1244:	61243032 			; <UNDEFINED> instruction: 0x61243032
    1248:	32752473 	rsbscc	r2, r5, #1929379840	; 0x73000000
    124c:	6f632430 	svcvs	0x00632430
    1250:	2e2e6572 	mcrcs	5, 1, r6, cr14, cr2, {3}
    1254:	72657469 	rsbvc	r7, r5, #1761607680	; 0x69000000
    1258:	61722e2e 	cmnvs	r2, lr, lsr #28
    125c:	2e65676e 	cdpcs	7, 6, cr6, cr5, cr14, {3}
    1260:	6e61522e 	cdpvs	2, 6, cr5, cr1, cr14, {1}
    1264:	74496567 	strbvc	r6, [r9], #-1383	; 0xfffffa99
    1268:	74617265 	strbtvc	r7, [r1], #-613	; 0xfffffd9b
    126c:	6d49726f 	sfmvs	f7, 2, [r9, #-444]	; 0xfffffe44
    1270:	47246c70 			; <UNDEFINED> instruction: 0x47246c70
    1274:	73392454 	teqvc	r9, #84, 8	; 0x54000000
    1278:	5f636570 	svcpl	0x00636570
    127c:	7478656e 	ldrbtvc	r6, [r8], #-1390	; 0xfffffa92
    1280:	37683731 			; <UNDEFINED> instruction: 0x37683731
    1284:	63663639 	cmnvs	r6, #59768832	; 0x3900000
    1288:	36383066 	ldrtcc	r3, [r8], -r6, rrx
    128c:	36653463 	strbtcc	r3, [r5], -r3, ror #8
    1290:	45373438 	ldrmi	r3, [r7, #-1080]!	; 0xfffffbc8
    1294:	65707300 	ldrbvs	r7, [r0, #-768]!	; 0xfffffd00
    1298:	656e5f63 	strbvs	r5, [lr, #-3939]!	; 0xfffff09d
    129c:	753c7478 	ldrvc	r7, [ip, #-1144]!	; 0xfffffb88
    12a0:	003e3631 	eorseq	r3, lr, r1, lsr r6
    12a4:	6974704f 	ldmdbvs	r4!, {r0, r1, r2, r3, r6, ip, sp, lr}^
    12a8:	753c6e6f 	ldrvc	r6, [ip, #-3695]!	; 0xfffff191
    12ac:	003e3631 	eorseq	r3, lr, r1, lsr r6
    12b0:	74756d26 	ldrbtvc	r6, [r5], #-3366	; 0xfffff2da
    12b4:	726f6320 	rsbvc	r6, pc, #32, 6	; 0x80000000
    12b8:	6f3a3a65 	svcvs	0x003a3a65
    12bc:	3a3a7370 	bcc	e9e084 <_umb_stack_size+0xe9d084>
    12c0:	676e6172 			; <UNDEFINED> instruction: 0x676e6172
    12c4:	523a3a65 	eorspl	r3, sl, #413696	; 0x65000
    12c8:	65676e61 	strbvs	r6, [r7, #-3681]!	; 0xfffff19f
    12cc:	3631753c 			; <UNDEFINED> instruction: 0x3631753c
    12d0:	5a5f003e 	bpl	17c13d0 <_umb_stack_size+0x17c03d0>
    12d4:	6f63344e 	svcvs	0x0063344e
    12d8:	69346572 	ldmdbvs	r4!, {r1, r4, r5, r6, r8, sl, sp, lr}
    12dc:	35726574 	ldrbcc	r6, [r2, #-1396]!	; 0xfffffa8c
    12e0:	676e6172 			; <UNDEFINED> instruction: 0x676e6172
    12e4:	31303165 	teqcc	r0, r5, ror #2
    12e8:	544c245f 	strbpl	r2, [ip], #-1119	; 0xfffffba1
    12ec:	706d6924 	rsbvc	r6, sp, r4, lsr #18
    12f0:	3275246c 	rsbscc	r2, r5, #108, 8	; 0x6c000000
    12f4:	6f632430 	svcvs	0x00632430
    12f8:	2e2e6572 	mcrcs	5, 1, r6, cr14, cr2, {3}
    12fc:	72657469 	rsbvc	r7, r5, #1761607680	; 0x69000000
    1300:	72742e2e 	rsbsvc	r2, r4, #736	; 0x2e0
    1304:	73746961 	cmnvc	r4, #1589248	; 0x184000
    1308:	74692e2e 	strbtvc	r2, [r9], #-3630	; 0xfffff1d2
    130c:	74617265 	strbtvc	r7, [r1], #-613	; 0xfffffd9b
    1310:	2e2e726f 	cdpcs	2, 2, cr7, cr14, cr15, {3}
    1314:	72657449 	rsbvc	r7, r5, #1224736768	; 0x49000000
    1318:	726f7461 	rsbvc	r7, pc, #1627389952	; 0x61000000
    131c:	30327524 	eorscc	r7, r2, r4, lsr #10
    1320:	726f6624 	rsbvc	r6, pc, #36, 12	; 0x2400000
    1324:	30327524 	eorscc	r7, r2, r4, lsr #10
    1328:	726f6324 	rsbvc	r6, pc, #36, 6	; 0x90000000
    132c:	6f2e2e65 	svcvs	0x002e2e65
    1330:	2e2e7370 	mcrcs	3, 1, r7, cr14, cr0, {3}
    1334:	676e6172 			; <UNDEFINED> instruction: 0x676e6172
    1338:	522e2e65 	eorpl	r2, lr, #1616	; 0x650
    133c:	65676e61 	strbvs	r6, [r7, #-3681]!	; 0xfffff19f
    1340:	24544c24 	ldrbcs	r4, [r4], #-3108	; 0xfffff3dc
    1344:	54472441 	strbpl	r2, [r7], #-1089	; 0xfffffbbf
    1348:	54472424 	strbpl	r2, [r7], #-1060	; 0xfffffbdc
    134c:	656e3424 	strbvs	r3, [lr, #-1060]!	; 0xfffffbdc
    1350:	37317478 			; <UNDEFINED> instruction: 0x37317478
    1354:	61303368 	teqvs	r0, r8, ror #6
    1358:	39646137 	stmdbcc	r4!, {r0, r1, r2, r4, r5, r8, sp, lr}^
    135c:	65303464 	ldrvs	r3, [r0, #-1124]!	; 0xfffffb9c
    1360:	36316336 			; <UNDEFINED> instruction: 0x36316336
    1364:	7b004563 	blvc	128f8 <_umb_stack_size+0x118f8>
    1368:	6c706d69 	ldclvs	13, cr6, [r0], #-420	; 0xfffffe5c
    136c:	007d3723 	rsbseq	r3, sp, r3, lsr #14
    1370:	344e5a5f 	strbcc	r5, [lr], #-2655	; 0xfffff5a1
    1374:	65726f63 	ldrbvs	r6, [r2, #-3939]!	; 0xfffff09d
    1378:	6d756e33 	ldclvs	14, cr6, [r5, #-204]!	; 0xffffff34
    137c:	245f3132 	ldrbcs	r3, [pc], #-306	; 1384 <_umb_stack_size+0x384>
    1380:	6924544c 	stmdbvs	r4!, {r2, r3, r6, sl, ip, lr}
    1384:	246c706d 	strbtcs	r7, [ip], #-109	; 0xffffff93
    1388:	24303275 	ldrtcs	r3, [r0], #-629	; 0xfffffd8b
    138c:	24363175 	ldrtcs	r3, [r6], #-373	; 0xfffffe8b
    1390:	31245447 			; <UNDEFINED> instruction: 0x31245447
    1394:	636e7533 	cmnvs	lr, #213909504	; 0xcc00000
    1398:	6b636568 	blvs	18da940 <_umb_stack_size+0x18d9940>
    139c:	615f6465 	cmpvs	pc, r5, ror #8
    13a0:	37316464 	ldrcc	r6, [r1, -r4, ror #8]!
    13a4:	63323268 	teqvs	r2, #104, 4	; 0x80000006
    13a8:	35653063 	strbcc	r3, [r5, #-99]!	; 0xffffff9d
    13ac:	34343536 	ldrtcc	r3, [r4], #-1334	; 0xfffffaca
    13b0:	30363930 	eorscc	r3, r6, r0, lsr r9
    13b4:	7b004533 	blvc	12888 <_umb_stack_size+0x11888>
    13b8:	6c706d69 	ldclvs	13, cr6, [r0], #-420	; 0xfffffe5c
    13bc:	7d373323 	ldcvc	3, cr3, [r7, #-140]!	; 0xffffff74
    13c0:	4e5a5f00 	cdpmi	15, 5, cr5, cr10, cr0, {0}
    13c4:	245f3734 	ldrbcs	r3, [pc], #-1844	; 13cc <_umb_stack_size+0x3cc>
    13c8:	7524544c 	strvc	r5, [r4, #-1100]!	; 0xfffffbb4
    13cc:	75243631 	strvc	r3, [r4, #-1585]!	; 0xfffff9cf
    13d0:	61243032 			; <UNDEFINED> instruction: 0x61243032
    13d4:	32752473 	rsbscc	r2, r5, #1929379840	; 0x73000000
    13d8:	6f632430 	svcvs	0x00632430
    13dc:	2e2e6572 	mcrcs	5, 1, r6, cr14, cr2, {3}
    13e0:	72657469 	rsbvc	r7, r5, #1761607680	; 0x69000000
    13e4:	61722e2e 	cmnvs	r2, lr, lsr #28
    13e8:	2e65676e 	cdpcs	7, 6, cr6, cr5, cr14, {3}
    13ec:	6574532e 	ldrbvs	r5, [r4, #-814]!	; 0xfffffcd2
    13f0:	54472470 	strbpl	r2, [r7], #-1136	; 0xfffffb90
    13f4:	66373124 	ldrtvs	r3, [r7], -r4, lsr #2
    13f8:	6177726f 	cmnvs	r7, pc, ror #4
    13fc:	755f6472 	ldrbvc	r6, [pc, #-1138]	; f92 <_umb_stack_size-0x6e>
    1400:	6568636e 	strbvs	r6, [r8, #-878]!	; 0xfffffc92
    1404:	64656b63 	strbtvs	r6, [r5], #-2915	; 0xfffff49d
    1408:	30683731 	rsbcc	r3, r8, r1, lsr r7
    140c:	37623636 			; <UNDEFINED> instruction: 0x37623636
    1410:	65343532 	ldrvs	r3, [r4, #-1330]!	; 0xffffface
    1414:	36376264 	ldrtcc	r6, [r7], -r4, ror #4
    1418:	45356130 	ldrmi	r6, [r5, #-304]!	; 0xfffffed0
    141c:	626d7500 	rsbvs	r7, sp, #0, 10
    1420:	6e5f6172 	mrcvs	1, 2, r6, cr15, cr2, {3}
    1424:	615f6373 	cmpvs	pc, r3, ror r3	; <UNPREDICTABLE>
    1428:	73006970 	movwvc	r6, #2416	; 0x970
    142c:	72756365 	rsbsvc	r6, r5, #-1811939327	; 0x94000001
    1430:	6f625f65 	svcvs	0x00625f65
    1434:	7500746f 	strvc	r7, [r0, #-1135]	; 0xfffffb91
    1438:	6172626d 	cmnvs	r2, sp, ror #4
    143c:	636e655f 	cmnvs	lr, #398458880	; 0x17c00000
    1440:	6576616c 	ldrbvs	r6, [r6, #-364]!	; 0xfffffe94
    1444:	6e75725f 	mrcvs	2, 3, r7, cr5, cr15, {2}
    1448:	706d695f 	rsbvc	r6, sp, pc, asr r9
    144c:	7a746700 	bvc	1d1b054 <_umb_stack_size+0x1d1a054>
    1450:	72645f63 	rsbvc	r5, r4, #396	; 0x18c
    1454:	72657669 	rsbvc	r7, r5, #110100480	; 0x6900000
    1458:	75617300 	strbvc	r7, [r1, #-768]!	; 0xfffffd00
    145c:	6972645f 	ldmdbvs	r2!, {r0, r1, r2, r3, r4, r6, sl, sp, lr}^
    1460:	00726576 	rsbseq	r6, r2, r6, ror r5

Disassembly of section .comment:

00000000 <.comment>:
   0:	74737572 	ldrbtvc	r7, [r3], #-1394	; 0xfffffa8e
   4:	65762063 	ldrbvs	r2, [r6, #-99]!	; 0xffffff9d
   8:	6f697372 	svcvs	0x00697372
   c:	2e31206e 	cdpcs	0, 3, cr2, cr1, cr14, {3}
  10:	302e3638 	eorcc	r3, lr, r8, lsr r6
  14:	67696e2d 	strbvs	r6, [r9, -sp, lsr #28]!
  18:	796c7468 	stmdbvc	ip!, {r3, r5, r6, sl, ip, sp, lr}^
  1c:	32392820 	eorscc	r2, r9, #32, 16	; 0x200000
  20:	65646562 	strbvs	r6, [r4, #-1378]!	; 0xfffffa9e
  24:	20633161 	rsbcs	r3, r3, r1, ror #2
  28:	35323032 	ldrcc	r3, [r2, #-50]!	; 0xffffffce
  2c:	2d32302d 	ldccs	0, cr3, [r2, #-180]!	; 0xffffff4c
  30:	00293131 	eoreq	r3, r9, r1, lsr r1

Disassembly of section .ARM.attributes:

00000000 <.ARM.attributes>:
   0:	00002d41 	andeq	r2, r0, r1, asr #26
   4:	61656100 	cmnvs	r5, r0, lsl #2
   8:	01006962 	tsteq	r0, r2, ror #18
   c:	00000023 	andeq	r0, r0, r3, lsr #32
  10:	302e3243 	eorcc	r3, lr, r3, asr #4
  14:	11060039 	tstne	r6, r9, lsr r0
  18:	03094d07 	movweq	r4, #40199	; 0x9d07
  1c:	01140111 	tsteq	r4, r1, lsl r1
  20:	03170115 	tsteq	r7, #1073741829	; 0x40000005
  24:	01190118 	tsteq	r9, r8, lsl r1
  28:	0122021e 			; <UNDEFINED> instruction: 0x0122021e
  2c:	Address 0x000000000000002c is out of bounds.


Disassembly of section .debug_frame:

00000000 <.debug_frame>:
   0:	00000010 	andeq	r0, r0, r0, lsl r0
   4:	ffffffff 			; <UNDEFINED> instruction: 0xffffffff
   8:	00040004 	andeq	r0, r4, r4
   c:	0c0e7c01 	stceq	12, cr7, [lr], {1}
  10:	0000000d 	andeq	r0, r0, sp
  14:	00000018 	andeq	r0, r0, r8, lsl r0
  18:	00000000 	andeq	r0, r0, r0
  1c:	08000088 	stmdaeq	r0, {r3, r7}
  20:	000002a6 	andeq	r0, r0, r6, lsr #5
  24:	8e080e42 	cdphi	14, 0, cr0, cr8, cr2, {2}
  28:	42028701 	andmi	r8, r2, #262144	; 0x40000
  2c:	0000070d 	andeq	r0, r0, sp, lsl #14
  30:	0000000c 	andeq	r0, r0, ip
  34:	00000000 	andeq	r0, r0, r0
  38:	08010000 	stmdaeq	r1, {}	; <UNPREDICTABLE>
  3c:	00000002 	andeq	r0, r0, r2

Disassembly of section .debug_line:

00000000 <.debug_line>:
   0:	0000074c 	andeq	r0, r0, ip, asr #14
   4:	02790004 	rsbseq	r0, r9, #4
   8:	01010000 	mrseq	r0, (UNDEF: 1)
   c:	0d0efb01 	vstreq	d15, [lr, #-4]
  10:	01010100 	mrseq	r0, (UNDEF: 17)
  14:	00000001 	andeq	r0, r0, r1
  18:	01000001 	tsteq	r0, r1
  1c:	00637273 	rsbeq	r7, r3, r3, ror r2
  20:	7375722f 	cmnvc	r5, #-268435454	; 0xf0000002
  24:	392f6374 	stmdbcc	pc!, {r2, r4, r5, r6, r8, r9, sp, lr}	; <UNPREDICTABLE>
  28:	64656232 	strbtvs	r6, [r5], #-562	; 0xfffffdce
  2c:	63316165 	teqvs	r1, #1073741849	; 0x40000019
  30:	33653135 	cmncc	r5, #1073741837	; 0x4000000d
  34:	39363961 	ldmdbcc	r6!, {r0, r5, r6, r8, fp, ip, sp}
  38:	39303664 	ldmdbcc	r0!, {r2, r5, r6, r9, sl, ip, sp}
  3c:	65623237 	strbvs	r3, [r2, #-567]!	; 0xfffffdc9
  40:	35343538 	ldrcc	r3, [r4, #-1336]!	; 0xfffffac8
  44:	66663630 			; <UNDEFINED> instruction: 0x66663630
  48:	35633864 	strbcc	r3, [r3, #-2148]!	; 0xfffff79c
  4c:	2f366263 	svccs	0x00366263
  50:	7262696c 	rsbvc	r6, r2, #108, 18	; 0x1b0000
  54:	2f797261 	svccs	0x00797261
  58:	65726f63 	ldrbvs	r6, [r2, #-3939]!	; 0xfffff09d
  5c:	6372732f 	cmnvs	r2, #-1140850688	; 0xbc000000
  60:	7274702f 	rsbsvc	r7, r4, #47	; 0x2f
  64:	75722f00 	ldrbvc	r2, [r2, #-3840]!	; 0xfffff100
  68:	2f637473 	svccs	0x00637473
  6c:	65623239 	strbvs	r3, [r2, #-569]!	; 0xfffffdc7
  70:	31616564 	cmncc	r1, r4, ror #10
  74:	65313563 	ldrvs	r3, [r1, #-1379]!	; 0xfffffa9d
  78:	36396133 			; <UNDEFINED> instruction: 0x36396133
  7c:	30366439 	eorscc	r6, r6, r9, lsr r4
  80:	62323739 	eorsvs	r3, r2, #14942208	; 0xe40000
  84:	34353865 	ldrtcc	r3, [r5], #-2149	; 0xfffff79b
  88:	66363035 			; <UNDEFINED> instruction: 0x66363035
  8c:	63386466 	teqvs	r8, #1711276032	; 0x66000000
  90:	36626335 			; <UNDEFINED> instruction: 0x36626335
  94:	62696c2f 	rsbvs	r6, r9, #12032	; 0x2f00
  98:	79726172 	ldmdbvc	r2!, {r1, r4, r5, r6, r8, sp, lr}^
  9c:	726f632f 	rsbvc	r6, pc, #-1140850688	; 0xbc000000
  a0:	72732f65 	rsbsvc	r2, r3, #404	; 0x194
  a4:	722f0063 	eorvc	r0, pc, #99	; 0x63
  a8:	63747375 	cmnvs	r4, #-738197503	; 0xd4000001
  ac:	6232392f 	eorsvs	r3, r2, #770048	; 0xbc000
  b0:	61656465 	cmnvs	r5, r5, ror #8
  b4:	31356331 	teqcc	r5, r1, lsr r3
  b8:	39613365 	stmdbcc	r1!, {r0, r2, r5, r6, r8, r9, ip, sp}^
  bc:	36643936 			; <UNDEFINED> instruction: 0x36643936
  c0:	32373930 	eorscc	r3, r7, #48, 18	; 0xc0000
  c4:	35386562 	ldrcc	r6, [r8, #-1378]!	; 0xfffffa9e
  c8:	36303534 			; <UNDEFINED> instruction: 0x36303534
  cc:	38646666 	stmdacc	r4!, {r1, r2, r5, r6, r9, sl, sp, lr}^
  d0:	62633563 	rsbvs	r3, r3, #415236096	; 0x18c00000
  d4:	696c2f36 	stmdbvs	ip!, {r1, r2, r4, r5, r8, r9, sl, fp, sp}^
  d8:	72617262 	rsbvc	r7, r1, #536870918	; 0x20000006
  dc:	6f632f79 	svcvs	0x00632f79
  e0:	732f6572 			; <UNDEFINED> instruction: 0x732f6572
  e4:	692f6372 	stmdbvs	pc!, {r1, r4, r5, r6, r8, r9, sp, lr}	; <UNPREDICTABLE>
  e8:	00726574 	rsbseq	r6, r2, r4, ror r5
  ec:	6d6f682f 	stclvs	8, cr6, [pc, #-188]!	; 38 <_umb_stack_size-0xfc8>
  f0:	74732f65 	ldrbtvc	r2, [r3], #-3941	; 0xfffff09b
  f4:	6e616665 	cdpvs	6, 6, cr6, cr1, cr5, {3}
  f8:	65442f6f 	strbvs	r2, [r4, #-3951]	; 0xfffff091
  fc:	6f746b73 	svcvs	0x00746b73
 100:	6f572f70 	svcvs	0x00572f70
 104:	502f6b72 	eorpl	r6, pc, r2, ror fp	; <UNPREDICTABLE>
 108:	656a6f72 	strbvs	r6, [sl, #-3954]!	; 0xfffff08e
 10c:	2f737463 	svccs	0x00737463
 110:	72626d75 	rsbvc	r6, r2, #7488	; 0x1d40
 114:	72732f61 	rsbsvc	r2, r3, #388	; 0x184
 118:	61682f63 	cmnvs	r8, r3, ror #30
 11c:	61776472 	cmnvs	r7, r2, ror r4
 120:	632f6572 			; <UNDEFINED> instruction: 0x632f6572
 124:	6f6d6d6f 	svcvs	0x006d6d6f
 128:	65702f6e 	ldrbvs	r2, [r0, #-3950]!	; 0xfffff092
 12c:	68706972 	ldmdavs	r0!, {r1, r4, r5, r6, r8, fp, sp, lr}^
 130:	6c617265 	sfmvs	f7, 2, [r1], #-404	; 0xfffffe6c
 134:	6765725f 			; <UNDEFINED> instruction: 0x6765725f
 138:	722f0073 	eorvc	r0, pc, #115	; 0x73
 13c:	63747375 	cmnvs	r4, #-738197503	; 0xd4000001
 140:	6232392f 	eorsvs	r3, r2, #770048	; 0xbc000
 144:	61656465 	cmnvs	r5, r5, ror #8
 148:	31356331 	teqcc	r5, r1, lsr r3
 14c:	39613365 	stmdbcc	r1!, {r0, r2, r5, r6, r8, r9, ip, sp}^
 150:	36643936 			; <UNDEFINED> instruction: 0x36643936
 154:	32373930 	eorscc	r3, r7, #48, 18	; 0xc0000
 158:	35386562 	ldrcc	r6, [r8, #-1378]!	; 0xfffffa9e
 15c:	36303534 			; <UNDEFINED> instruction: 0x36303534
 160:	38646666 	stmdacc	r4!, {r1, r2, r5, r6, r9, sl, sp, lr}^
 164:	62633563 	rsbvs	r3, r3, #415236096	; 0x18c00000
 168:	696c2f36 	stmdbvs	ip!, {r1, r2, r4, r5, r8, r9, sl, fp, sp}^
 16c:	72617262 	rsbvc	r7, r1, #536870918	; 0x20000006
 170:	6f632f79 	svcvs	0x00632f79
 174:	732f6572 			; <UNDEFINED> instruction: 0x732f6572
 178:	6e2f6372 	mcrvs	3, 1, r6, cr15, cr2, {3}
 17c:	2f006d75 	svccs	0x00006d75
 180:	656d6f68 	strbvs	r6, [sp, #-3944]!	; 0xfffff098
 184:	6574732f 	ldrbvs	r7, [r4, #-815]!	; 0xfffffcd1
 188:	6f6e6166 	svcvs	0x006e6166
 18c:	7365442f 	cmnvc	r5, #788529152	; 0x2f000000
 190:	706f746b 	rsbvc	r7, pc, fp, ror #8
 194:	726f572f 	rsbvc	r5, pc, #12320768	; 0xbc0000
 198:	72502f6b 	subsvc	r2, r0, #428	; 0x1ac
 19c:	63656a6f 	cmnvs	r5, #454656	; 0x6f000
 1a0:	752f7374 	strvc	r7, [pc, #-884]!	; fffffe34 <_umb_estack+0xdffc1e38>
 1a4:	6172626d 	cmnvs	r2, sp, ror #4
 1a8:	6372732f 	cmnvs	r2, #-1140850688	; 0xbc000000
 1ac:	7261682f 	rsbvc	r6, r1, #3080192	; 0x2f0000
 1b0:	72617764 	rsbvc	r7, r1, #100, 14	; 0x1900000
 1b4:	72612f65 	rsbvc	r2, r1, #404	; 0x194
 1b8:	74696863 	strbtvc	r6, [r9], #-2147	; 0xfffff79d
 1bc:	75746365 	ldrbvc	r6, [r4, #-869]!	; 0xfffffc9b
 1c0:	612f6572 			; <UNDEFINED> instruction: 0x612f6572
 1c4:	2f006d72 	svccs	0x00006d72
 1c8:	656d6f68 	strbvs	r6, [sp, #-3944]!	; 0xfffff098
 1cc:	6574732f 	ldrbvs	r7, [r4, #-815]!	; 0xfffffcd1
 1d0:	6f6e6166 	svcvs	0x006e6166
 1d4:	7365442f 	cmnvc	r5, #788529152	; 0x2f000000
 1d8:	706f746b 	rsbvc	r7, pc, fp, ror #8
 1dc:	726f572f 	rsbvc	r5, pc, #12320768	; 0xbc0000
 1e0:	72502f6b 	subsvc	r2, r0, #428	; 0x1ac
 1e4:	63656a6f 	cmnvs	r5, #454656	; 0x6f000
 1e8:	752f7374 	strvc	r7, [pc, #-884]!	; fffffe7c <_umb_estack+0xdffc1e80>
 1ec:	6172626d 	cmnvs	r2, sp, ror #4
 1f0:	6372732f 	cmnvs	r2, #-1140850688	; 0xbc000000
 1f4:	7261682f 	rsbvc	r6, r1, #3080192	; 0x2f0000
 1f8:	72617764 	rsbvc	r7, r1, #100, 14	; 0x1900000
 1fc:	6c702f65 	ldclvs	15, cr2, [r0], #-404	; 0xfffffe6c
 200:	6f667461 	svcvs	0x00667461
 204:	732f6d72 			; <UNDEFINED> instruction: 0x732f6d72
 208:	32336d74 	eorscc	r6, r3, #116, 26	; 0x1d00
 20c:	3235356c 	eorscc	r3, r5, #108, 10	; 0x1b000000
 210:	6972642f 	ldmdbvs	r2!, {r0, r1, r2, r3, r5, sl, sp, lr}^
 214:	73726576 	cmnvc	r2, #494927872	; 0x1d800000
 218:	616d0000 	cmnvs	sp, r0
 21c:	722e6e69 	eorvc	r6, lr, #1680	; 0x690
 220:	00010073 	andeq	r0, r1, r3, ror r0
 224:	646f6d00 	strbtvs	r6, [pc], #-3328	; 22c <_umb_stack_size-0xdd4>
 228:	0073722e 	rsbseq	r7, r3, lr, lsr #4
 22c:	63000002 	movwvs	r0, #2
 230:	722e706d 	eorvc	r7, lr, #109	; 0x6d
 234:	00030073 	andeq	r0, r3, r3, ror r0
 238:	6e617200 	cdpvs	2, 6, cr7, cr1, cr0, {0}
 23c:	722e6567 	eorvc	r6, lr, #432013312	; 0x19c00000
 240:	00040073 	andeq	r0, r4, r3, ror r0
 244:	63727300 	cmnvs	r2, #0, 6
 248:	62696c2f 	rsbvs	r6, r9, #12032	; 0x2f00
 24c:	0073722e 	rsbseq	r7, r3, lr, lsr #4
 250:	75000005 	strvc	r0, [r0, #-5]
 254:	5f746e69 	svcpl	0x00746e69
 258:	7263616d 	rsbvc	r6, r3, #1073741851	; 0x4000001b
 25c:	722e736f 	eorvc	r7, lr, #-1140850687	; 0xbc000001
 260:	00060073 	andeq	r0, r6, r3, ror r0
 264:	63727300 	cmnvs	r2, #0, 6
 268:	7561732f 	strbvc	r7, [r1, #-815]!	; 0xfffffcd1
 26c:	0073722e 	rsbseq	r7, r3, lr, lsr #4
 270:	73000007 	movwvc	r0, #7
 274:	672f6372 			; <UNDEFINED> instruction: 0x672f6372
 278:	2e637a74 			; <UNDEFINED> instruction: 0x2e637a74
 27c:	08007372 	stmdaeq	r0, {r1, r4, r5, r6, r8, r9, ip, sp, lr}
 280:	00000000 	andeq	r0, r0, r0
 284:	00880205 	addeq	r0, r8, r5, lsl #4
 288:	27030800 	strcs	r0, [r3, -r0, lsl #16]
 28c:	05020401 	streq	r0, [r2, #-1025]	; 0xfffffbff
 290:	b0030a09 	andlt	r0, r3, r9, lsl #20
 294:	0304ba0d 	movweq	fp, #18957	; 0x4a0d
 298:	c8033405 	stmdagt	r3, {r0, r2, sl, ip, sp}
 29c:	04044a00 	streq	r4, [r4], #-2560	; 0xfffff600
 2a0:	dc030c05 	stcle	12, cr0, [r3], {5}
 2a4:	03062e77 	movweq	r2, #28279	; 0x6e77
 2a8:	03ba7a84 			; <UNDEFINED> instruction: 0x03ba7a84
 2ac:	042e05fc 	strteq	r0, [lr], #-1532	; 0xfffffa04
 2b0:	06090502 	streq	r0, [r9], -r2, lsl #10
 2b4:	6608ac03 	strvs	sl, [r8], -r3, lsl #24
 2b8:	4a7fb003 	bmi	1fec2cc <_umb_stack_size+0x1feb2cc>
 2bc:	33050504 	movwcc	r0, #21764	; 0x5504
 2c0:	2e72dc03 	cdpcs	12, 7, cr13, cr2, cr3, {0}
 2c4:	09050204 	stmdbeq	r5, {r2, r9}
 2c8:	4a0df403 	bmi	37d2dc <_umb_stack_size+0x37c2dc>
 2cc:	03062e06 	movweq	r2, #28166	; 0x6e06
 2d0:	04667fb0 	strbteq	r7, [r6], #-4016	; 0xfffff050
 2d4:	03330505 	teqeq	r3, #20971520	; 0x1400000
 2d8:	042e72dc 	strteq	r7, [lr], #-732	; 0xfffffd24
 2dc:	03090502 	movweq	r0, #38146	; 0x9502
 2e0:	064a0df4 			; <UNDEFINED> instruction: 0x064a0df4
 2e4:	b003062e 	andlt	r0, r3, lr, lsr #12
 2e8:	0504667f 	streq	r6, [r4, #-1663]	; 0xfffff981
 2ec:	dc033305 	stcle	3, cr3, [r3], {5}
 2f0:	02042e72 	andeq	r2, r4, #1824	; 0x720
 2f4:	f4030905 	vst2.8	{d0,d2}, [r3], r5
 2f8:	2e064a0d 	vmlacs.f32	s8, s12, s26
 2fc:	7fb00306 	svcvc	0x00b00306
 300:	05060466 	streq	r0, [r6, #-1126]	; 0xfffffb9a
 304:	76e40311 	usatvc	r0, #4, r1, lsl #6
 308:	0504042e 	streq	r0, [r4, #-1070]	; 0xfffffbd2
 30c:	01c0030c 	biceq	r0, r0, ip, lsl #6
 310:	0505042e 	streq	r0, [r5, #-1070]	; 0xfffffbd2
 314:	7ab80333 	bvc	fee00fe8 <_umb_estack+0xdedc2fec>
 318:	0502042e 	streq	r0, [r2, #-1070]	; 0xfffffbd2
 31c:	0df40309 	ldcleq	3, cr0, [r4, #36]!	; 0x24
 320:	0504044a 	streq	r0, [r4, #-1098]	; 0xfffffbb6
 324:	77d4030c 	ldrbvc	r0, [r4, ip, lsl #6]
 328:	0502042e 	streq	r0, [r2, #-1070]	; 0xfffffbd2
 32c:	08ac0309 	stmiaeq	ip!, {r0, r3, r8, r9}
 330:	0504044a 	streq	r0, [r4, #-1098]	; 0xfffffbb6
 334:	77d4030c 	ldrbvc	r0, [r4, ip, lsl #6]
 338:	0502044a 	streq	r0, [r2, #-1098]	; 0xfffffbb6
 33c:	07dc0309 	ldrbeq	r0, [ip, r9, lsl #6]
 340:	0505042e 	streq	r0, [r5, #-1070]	; 0xfffffbd2
 344:	72dc0333 	sbcsvc	r0, ip, #-872415232	; 0xcc000000
 348:	0502042e 	streq	r0, [r2, #-1070]	; 0xfffffbd2
 34c:	0df40309 	ldcleq	3, cr0, [r4, #36]!	; 0x24
 350:	0504044a 	streq	r0, [r4, #-1098]	; 0xfffffbb6
 354:	77d4030c 	ldrbvc	r0, [r4, ip, lsl #6]
 358:	0506042e 	streq	r0, [r6, #-1070]	; 0xfffffbd2
 35c:	7ec00311 	mcrvc	3, 6, r0, cr0, cr1, {0}
 360:	0502042e 	streq	r0, [r2, #-1070]	; 0xfffffbd2
 364:	09ec0309 	stmibeq	ip!, {r0, r3, r8, r9}^
 368:	7fb0032e 	svcvc	0x00b0032e
 36c:	0504044a 	streq	r0, [r4, #-1098]	; 0xfffffbb6
 370:	78a4030c 	stmiavc	r4!, {r2, r3, r8, r9}
 374:	0505042e 	streq	r0, [r5, #-1070]	; 0xfffffbd2
 378:	7ab80333 	bvc	fee0104c <_umb_estack+0xdedc3050>
 37c:	0502042e 	streq	r0, [r2, #-1070]	; 0xfffffbd2
 380:	0df40309 	ldcleq	3, cr0, [r4, #36]!	; 0x24
 384:	0504044a 	streq	r0, [r4, #-1098]	; 0xfffffbb6
 388:	77d4030c 	ldrbvc	r0, [r4, ip, lsl #6]
 38c:	0506042e 	streq	r0, [r6, #-1070]	; 0xfffffbd2
 390:	7ec00311 	mcrvc	3, 6, r0, cr0, cr1, {0}
 394:	0502042e 	streq	r0, [r2, #-1070]	; 0xfffffbd2
 398:	09ec0309 	stmibeq	ip!, {r0, r3, r8, r9}^
 39c:	7fb0032e 	svcvc	0x00b0032e
 3a0:	0505044a 	streq	r0, [r5, #-1098]	; 0xfffffbb6
 3a4:	72dc0333 	sbcsvc	r0, ip, #-872415232	; 0xcc000000
 3a8:	0502042e 	streq	r0, [r2, #-1070]	; 0xfffffbd2
 3ac:	0df40309 	ldcleq	3, cr0, [r4, #36]!	; 0x24
 3b0:	d803064a 	stmdale	r3, {r1, r3, r6, r9, sl}
 3b4:	a8032e71 	stmdage	r3, {r0, r4, r5, r6, r9, sl, fp, sp}
 3b8:	03062e0e 	movweq	r2, #28174	; 0x6e0e
 3bc:	044a7fb0 	strbeq	r7, [sl], #-4016	; 0xfffff050
 3c0:	03330505 	teqeq	r3, #20971520	; 0x1400000
 3c4:	044a72dc 	strbeq	r7, [sl], #-732	; 0xfffffd24
 3c8:	03090502 	movweq	r0, #38146	; 0x9502
 3cc:	034a0df4 	movteq	r0, #44532	; 0xadf4
 3d0:	044a7fb0 	strbeq	r7, [sl], #-4016	; 0xfffff050
 3d4:	03330505 	teqeq	r3, #20971520	; 0x1400000
 3d8:	044a72d7 	strbeq	r7, [sl], #-727	; 0xfffffd29
 3dc:	03090502 	movweq	r0, #38146	; 0x9502
 3e0:	034a0df9 	movteq	r0, #44537	; 0xadf9
 3e4:	044a7fb0 	strbeq	r7, [sl], #-4016	; 0xfffff050
 3e8:	03340503 	teqeq	r4, #12582912	; 0xc00000
 3ec:	044a00c8 	strbeq	r0, [sl], #-200	; 0xffffff38
 3f0:	03090507 	movweq	r0, #38151	; 0x9507
 3f4:	042e73cb 	strteq	r7, [lr], #-971	; 0xfffffc35
 3f8:	03340503 	teqeq	r4, #12582912	; 0xc00000
 3fc:	04660cb5 	strbteq	r0, [r6], #-3253	; 0xfffff34b
 400:	030c0504 	movweq	r0, #50436	; 0xc504
 404:	052e77dc 	streq	r7, [lr, #-2012]!	; 0xfffff824
 408:	84030600 	strhi	r0, [r3], #-1536	; 0xfffffa00
 40c:	02044a7a 	andeq	r4, r4, #499712	; 0x7a000
 410:	03060905 	movweq	r0, #26885	; 0x6905
 414:	032e0ea8 			; <UNDEFINED> instruction: 0x032e0ea8
 418:	044a7fb0 	strbeq	r7, [sl], #-4016	; 0xfffff050
 41c:	03100507 	tsteq	r0, #29360128	; 0x1c00000
 420:	042e7497 	strteq	r7, [lr], #-1175	; 0xfffffb69
 424:	030c0504 	movweq	r0, #50436	; 0xc504
 428:	044a048d 	strbeq	r0, [sl], #-1165	; 0xfffffb73
 42c:	06000507 	streq	r0, [r0], -r7, lsl #10
 430:	4a7a8403 	bmi	1ea1444 <_umb_stack_size+0x1ea0444>
 434:	09050204 	stmdbeq	r5, {r2, r9}
 438:	0ea80306 	cdpeq	3, 10, cr0, cr8, cr6, {0}
 43c:	7fb0032e 	svcvc	0x00b0032e
 440:	0507044a 	streq	r0, [r7, #-1098]	; 0xfffffbb6
 444:	74970310 	ldrvc	r0, [r7], #784	; 0x310
 448:	0504042e 	streq	r0, [r4, #-1070]	; 0xfffffbd2
 44c:	048d030c 	streq	r0, [sp], #780	; 0x30c
 450:	0507044a 	streq	r0, [r7, #-1098]	; 0xfffffbb6
 454:	84030600 	strhi	r0, [r3], #-1536	; 0xfffffa00
 458:	02044a7a 	andeq	r4, r4, #499712	; 0x7a000
 45c:	03060905 	movweq	r0, #26885	; 0x6905
 460:	032e0ea8 			; <UNDEFINED> instruction: 0x032e0ea8
 464:	044a7fb0 	strbeq	r7, [sl], #-4016	; 0xfffff050
 468:	03100507 	tsteq	r0, #29360128	; 0x1c00000
 46c:	042e7497 	strteq	r7, [lr], #-1175	; 0xfffffb69
 470:	030c0504 	movweq	r0, #50436	; 0xc504
 474:	044a048d 	strbeq	r0, [sl], #-1165	; 0xfffffb73
 478:	06000507 	streq	r0, [r0], -r7, lsl #10
 47c:	4a7a8403 	bmi	1ea1490 <_umb_stack_size+0x1ea0490>
 480:	09050204 	stmdbeq	r5, {r2, r9}
 484:	0ea80306 	cdpeq	3, 10, cr0, cr8, cr6, {0}
 488:	7fb0032e 	svcvc	0x00b0032e
 48c:	0507044a 	streq	r0, [r7, #-1098]	; 0xfffffbb6
 490:	74970310 	ldrvc	r0, [r7], #784	; 0x310
 494:	9103062e 	tstls	r3, lr, lsr #12
 498:	3805667e 	stmdacc	r5, {r1, r2, r3, r4, r5, r6, r9, sl, sp, lr}
 49c:	01e00306 	mvneq	r0, r6, lsl #6
 4a0:	05020466 	streq	r0, [r2, #-1126]	; 0xfffffb9a
 4a4:	0cc80309 	stcleq	3, cr0, [r8], {9}
 4a8:	d803062e 	stmdale	r3, {r1, r2, r3, r5, r9, sl}
 4ac:	a8036671 	stmdage	r3, {r0, r4, r5, r6, r9, sl, sp, lr}
 4b0:	06d64a0e 	ldrbeq	r4, [r6], lr, lsl #20
 4b4:	2e7fb003 	cdpcs	0, 7, cr11, cr15, cr3, {0}
 4b8:	34050304 	strcc	r0, [r5], #-772	; 0xfffffcfc
 4bc:	4a00c803 	bmi	324d0 <_umb_stack_size+0x314d0>
 4c0:	09050704 	stmdbeq	r5, {r2, r8, r9, sl}
 4c4:	2e73cb03 	vaddcs.f64	d28, d3, d3
 4c8:	34050304 	strcc	r0, [r5], #-772	; 0xfffffcfc
 4cc:	660cb503 	strvs	fp, [ip], -r3, lsl #10
 4d0:	0c050404 	cfstrseq	mvf0, [r5], {4}
 4d4:	2e77dc03 	cdpcs	12, 7, cr13, cr7, cr3, {0}
 4d8:	03060005 	movweq	r0, #24581	; 0x6005
 4dc:	044a7a84 	strbeq	r7, [sl], #-2692	; 0xfffff57c
 4e0:	06090502 	streq	r0, [r9], -r2, lsl #10
 4e4:	2e0ea803 	cdpcs	8, 0, cr10, cr14, cr3, {0}
 4e8:	4a7fb003 	bmi	1fec4fc <_umb_stack_size+0x1feb4fc>
 4ec:	10050704 	andne	r0, r5, r4, lsl #14
 4f0:	2e749703 	cdpcs	7, 7, cr9, cr4, cr3, {0}
 4f4:	0c050404 	cfstrseq	mvf0, [r5], {4}
 4f8:	4a048d03 	bmi	12390c <_umb_stack_size+0x12290c>
 4fc:	00050704 	andeq	r0, r5, r4, lsl #14
 500:	7a840306 	bvc	fe101120 <_umb_estack+0xde0c3124>
 504:	0502044a 	streq	r0, [r2, #-1098]	; 0xfffffbb6
 508:	a8030609 	stmdage	r3, {r0, r3, r9, sl}
 50c:	b0032e0e 	andlt	r2, r3, lr, lsl #28
 510:	07044a7f 	smlsdxeq	r4, pc, sl, r4	; <UNPREDICTABLE>
 514:	97031005 	strls	r1, [r3, -r5]
 518:	04042e74 	streq	r2, [r4], #-3700	; 0xfffff18c
 51c:	8d030c05 	stchi	12, cr0, [r3, #-20]	; 0xffffffec
 520:	07044a04 	streq	r4, [r4, -r4, lsl #20]
 524:	03060005 	movweq	r0, #24581	; 0x6005
 528:	044a7a84 	strbeq	r7, [sl], #-2692	; 0xfffff57c
 52c:	06090502 	streq	r0, [r9], -r2, lsl #10
 530:	2e0ea803 	cdpcs	8, 0, cr10, cr14, cr3, {0}
 534:	4a7fb003 	bmi	1fec548 <_umb_stack_size+0x1feb548>
 538:	10050704 	andne	r0, r5, r4, lsl #14
 53c:	2e749703 	cdpcs	7, 7, cr9, cr4, cr3, {0}
 540:	0c050404 	cfstrseq	mvf0, [r5], {4}
 544:	4a048d03 	bmi	123958 <_umb_stack_size+0x122958>
 548:	00050704 	andeq	r0, r5, r4, lsl #14
 54c:	7a840306 	bvc	fe10116c <_umb_estack+0xde0c3170>
 550:	0502044a 	streq	r0, [r2, #-1098]	; 0xfffffbb6
 554:	a8030609 	stmdage	r3, {r0, r3, r9, sl}
 558:	b0032e0e 	andlt	r2, r3, lr, lsl #28
 55c:	07044a7f 	smlsdxeq	r4, pc, sl, r4	; <UNPREDICTABLE>
 560:	97031005 	strls	r1, [r3, -r5]
 564:	03062e74 	movweq	r2, #28276	; 0x6e74
 568:	05667e91 	strbeq	r7, [r6, #-3729]!	; 0xfffff16f
 56c:	e0030638 	and	r0, r3, r8, lsr r6
 570:	02046601 	andeq	r6, r4, #1048576	; 0x100000
 574:	c8030905 	stmdagt	r3, {r0, r2, r8, fp}
 578:	03062e0c 	movweq	r2, #28172	; 0x6e0c
 57c:	036671d8 	cmneq	r6, #216, 2	; 0x36
 580:	4aba0ea8 	bmi	fee84028 <_umb_estack+0xdee4602c>
 584:	9e71d803 	cdpls	8, 7, cr13, cr1, cr3, {0}
 588:	11050604 	tstne	r5, r4, lsl #12
 58c:	04bc0306 	ldrteq	r0, [ip], #774	; 0x306
 590:	030804f2 	movweq	r0, #34034	; 0x84f2
 594:	044a7db7 	strbeq	r7, [sl], #-3511	; 0xfffff249
 598:	030c0504 	movweq	r0, #50436	; 0xc504
 59c:	044a0489 	strbeq	r0, [sl], #-1161	; 0xfffffb77
 5a0:	03140508 	tsteq	r4, #8, 10	; 0x2000000
 5a4:	05667be9 	strbeq	r7, [r6, #-3049]!	; 0xfffff417
 5a8:	7fb2030c 	svcvc	0x00b2030c
 5ac:	0314054a 	tsteq	r4, #310378496	; 0x12800000
 5b0:	058200ce 	streq	r0, [r2, #206]	; 0xce
 5b4:	7fb2030c 	svcvc	0x00b2030c
 5b8:	0314054a 	tsteq	r4, #310378496	; 0x12800000
 5bc:	056600ce 	strbeq	r0, [r6, #-206]!	; 0xffffff32
 5c0:	7fb2030c 	svcvc	0x00b2030c
 5c4:	0311059e 	tsteq	r1, #662700032	; 0x27800000
 5c8:	054a00d8 	strbeq	r0, [sl, #-216]	; 0xffffff28
 5cc:	7fae031d 	svcvc	0x00ae031d
 5d0:	0505044a 	streq	r0, [r5, #-1098]	; 0xfffffbb6
 5d4:	7fad030c 	svcvc	0x00ad030c
 5d8:	0502044a 	streq	r0, [r2, #-1098]	; 0xfffffbb6
 5dc:	0d8e0309 	stceq	3, cr0, [lr, #36]	; 0x24
 5e0:	05050466 	streq	r0, [r5, #-1126]	; 0xfffffb9a
 5e4:	72dc0333 	sbcsvc	r0, ip, #-872415232	; 0xcc000000
 5e8:	05020466 	streq	r0, [r2, #-1126]	; 0xfffffb9a
 5ec:	0df40309 	ldcleq	3, cr0, [r4, #36]!	; 0x24
 5f0:	0505044a 	streq	r0, [r5, #-1098]	; 0xfffffbb6
 5f4:	72a2030c 	adcvc	r0, r2, #12, 6	; 0x30000000
 5f8:	0502042e 	streq	r0, [r2, #-1070]	; 0xfffffbd2
 5fc:	0d8e0309 	stceq	3, cr0, [lr, #36]	; 0x24
 600:	05050466 	streq	r0, [r5, #-1126]	; 0xfffffb9a
 604:	72dc0333 	sbcsvc	r0, ip, #-872415232	; 0xcc000000
 608:	0502044a 	streq	r0, [r2, #-1098]	; 0xfffffbb6
 60c:	0df40309 	ldcleq	3, cr0, [r4, #36]!	; 0x24
 610:	0505042e 	streq	r0, [r5, #-1070]	; 0xfffffbd2
 614:	72a2030c 	adcvc	r0, r2, #12, 6	; 0x30000000
 618:	0502042e 	streq	r0, [r2, #-1070]	; 0xfffffbd2
 61c:	0d8e0309 	stceq	3, cr0, [lr, #36]	; 0x24
 620:	05050466 	streq	r0, [r5, #-1126]	; 0xfffffb9a
 624:	72dc0333 	sbcsvc	r0, ip, #-872415232	; 0xcc000000
 628:	0502044a 	streq	r0, [r2, #-1098]	; 0xfffffbb6
 62c:	0df40309 	ldcleq	3, cr0, [r4, #36]!	; 0x24
 630:	0504042e 	streq	r0, [r4, #-1070]	; 0xfffffbd2
 634:	77d4030c 	ldrbvc	r0, [r4, ip, lsl #6]
 638:	0305042e 	movweq	r0, #21550	; 0x542e
 63c:	044a7ace 	strbeq	r7, [sl], #-2766	; 0xfffff532
 640:	03090502 	movweq	r0, #38146	; 0x9502
 644:	04660d8e 	strbteq	r0, [r6], #-3470	; 0xfffff272
 648:	03330505 	teqeq	r3, #20971520	; 0x1400000
 64c:	044a72dc 	strbeq	r7, [sl], #-732	; 0xfffffd24
 650:	03090502 	movweq	r0, #38146	; 0x9502
 654:	042e0df4 	strteq	r0, [lr], #-3572	; 0xfffff20c
 658:	03110506 	tsteq	r1, #25165824	; 0x1800000
 65c:	042e7694 	strteq	r7, [lr], #-1684	; 0xfffff96c
 660:	030c0505 	movweq	r0, #50437	; 0xc505
 664:	062e7c8e 	strteq	r7, [lr], -lr, lsl #25
 668:	2e7fb603 	cdpcs	6, 7, cr11, cr15, cr3, {0}
 66c:	09050204 	stmdbeq	r5, {r2, r9}
 670:	0dd80306 	ldcleq	3, cr0, [r8, #24]
 674:	050304d6 	streq	r0, [r3, #-1238]	; 0xfffffb2a
 678:	00c80334 	sbceq	r0, r8, r4, lsr r3
 67c:	0507044a 	streq	r0, [r7, #-1098]	; 0xfffffbb6
 680:	73cb0309 	bicvc	r0, fp, #603979776	; 0x24000000
 684:	0503042e 	streq	r0, [r3, #-1070]	; 0xfffffbd2
 688:	0cb50334 	ldceq	3, cr0, [r5], #208	; 0xd0
 68c:	05040466 	streq	r0, [r4, #-1126]	; 0xfffffb9a
 690:	77dc030c 	ldrbvc	r0, [ip, ip, lsl #6]
 694:	0600052e 	streq	r0, [r0], -lr, lsr #10
 698:	4a7a8403 	bmi	1ea16ac <_umb_stack_size+0x1ea06ac>
 69c:	09050204 	stmdbeq	r5, {r2, r9}
 6a0:	0ea80306 	cdpeq	3, 10, cr0, cr8, cr6, {0}
 6a4:	7fb0032e 	svcvc	0x00b0032e
 6a8:	0507044a 	streq	r0, [r7, #-1098]	; 0xfffffbb6
 6ac:	74970310 	ldrvc	r0, [r7], #784	; 0x310
 6b0:	0504042e 	streq	r0, [r4, #-1070]	; 0xfffffbd2
 6b4:	048d030c 	streq	r0, [sp], #780	; 0x30c
 6b8:	0507044a 	streq	r0, [r7, #-1098]	; 0xfffffbb6
 6bc:	84030600 	strhi	r0, [r3], #-1536	; 0xfffffa00
 6c0:	02044a7a 	andeq	r4, r4, #499712	; 0x7a000
 6c4:	03060905 	movweq	r0, #26885	; 0x6905
 6c8:	032e0ea8 			; <UNDEFINED> instruction: 0x032e0ea8
 6cc:	044a7fb0 	strbeq	r7, [sl], #-4016	; 0xfffff050
 6d0:	03100507 	tsteq	r0, #29360128	; 0x1c00000
 6d4:	042e7497 	strteq	r7, [lr], #-1175	; 0xfffffb69
 6d8:	030c0504 	movweq	r0, #50436	; 0xc504
 6dc:	044a048d 	strbeq	r0, [sl], #-1165	; 0xfffffb73
 6e0:	06000507 	streq	r0, [r0], -r7, lsl #10
 6e4:	4a7a8403 	bmi	1ea16f8 <_umb_stack_size+0x1ea06f8>
 6e8:	09050204 	stmdbeq	r5, {r2, r9}
 6ec:	0ea80306 	cdpeq	3, 10, cr0, cr8, cr6, {0}
 6f0:	7fb0032e 	svcvc	0x00b0032e
 6f4:	0507044a 	streq	r0, [r7, #-1098]	; 0xfffffbb6
 6f8:	74970310 	ldrvc	r0, [r7], #784	; 0x310
 6fc:	0504042e 	streq	r0, [r4, #-1070]	; 0xfffffbd2
 700:	048d030c 	streq	r0, [sp], #780	; 0x30c
 704:	0507044a 	streq	r0, [r7, #-1098]	; 0xfffffbb6
 708:	84030600 	strhi	r0, [r3], #-1536	; 0xfffffa00
 70c:	02044a7a 	andeq	r4, r4, #499712	; 0x7a000
 710:	03060905 	movweq	r0, #26885	; 0x6905
 714:	032e0ea8 			; <UNDEFINED> instruction: 0x032e0ea8
 718:	044a7fb0 	strbeq	r7, [sl], #-4016	; 0xfffff050
 71c:	03100507 	tsteq	r0, #29360128	; 0x1c00000
 720:	062e7497 			; <UNDEFINED> instruction: 0x062e7497
 724:	667e9103 	ldrbtvs	r9, [lr], -r3, lsl #2
 728:	03063805 	movweq	r3, #26629	; 0x6805
 72c:	046601e0 	strbteq	r0, [r6], #-480	; 0xfffffe20
 730:	03090502 	movweq	r0, #38146	; 0x9502
 734:	062e0cc8 	strteq	r0, [lr], -r8, asr #25
 738:	4a71d803 	bmi	1c7674c <_umb_stack_size+0x1c7574c>
 73c:	660ea803 	strvs	sl, [lr], -r3, lsl #16
 740:	0501044a 	streq	r0, [r1, #-1098]	; 0xfffffbb6
 744:	c4030605 	strgt	r0, [r3], #-1541	; 0xfffff9fb
 748:	024c2e72 	subeq	r2, ip, #1824	; 0x720
 74c:	01010002 	tsteq	r1, r2
 750:	0000011c 	andeq	r0, r0, ip, lsl r1
 754:	01160004 	tsteq	r6, r4
 758:	01010000 	mrseq	r0, (UNDEF: 1)
 75c:	0d0efb01 	vstreq	d15, [lr, #-4]
 760:	01010100 	mrseq	r0, (UNDEF: 17)
 764:	00000001 	andeq	r0, r0, r1
 768:	01000001 	tsteq	r0, r1
 76c:	00637273 	rsbeq	r7, r3, r3, ror r2
 770:	7375722f 	cmnvc	r5, #-268435454	; 0xf0000002
 774:	392f6374 	stmdbcc	pc!, {r2, r4, r5, r6, r8, r9, sp, lr}	; <UNPREDICTABLE>
 778:	64656232 	strbtvs	r6, [r5], #-562	; 0xfffffdce
 77c:	63316165 	teqvs	r1, #1073741849	; 0x40000019
 780:	33653135 	cmncc	r5, #1073741837	; 0x4000000d
 784:	39363961 	ldmdbcc	r6!, {r0, r5, r6, r8, fp, ip, sp}
 788:	39303664 	ldmdbcc	r0!, {r2, r5, r6, r9, sl, ip, sp}
 78c:	65623237 	strbvs	r3, [r2, #-567]!	; 0xfffffdc9
 790:	35343538 	ldrcc	r3, [r4, #-1336]!	; 0xfffffac8
 794:	66663630 			; <UNDEFINED> instruction: 0x66663630
 798:	35633864 	strbcc	r3, [r3, #-2148]!	; 0xfffff79c
 79c:	2f366263 	svccs	0x00366263
 7a0:	7262696c 	rsbvc	r6, r2, #108, 18	; 0x1b0000
 7a4:	2f797261 	svccs	0x00797261
 7a8:	65726f63 	ldrbvs	r6, [r2, #-3939]!	; 0xfffff09d
 7ac:	6372732f 	cmnvs	r2, #-1140850688	; 0xbc000000
 7b0:	75722f00 	ldrbvc	r2, [r2, #-3840]!	; 0xfffff100
 7b4:	2f637473 	svccs	0x00637473
 7b8:	65623239 	strbvs	r3, [r2, #-569]!	; 0xfffffdc7
 7bc:	31616564 	cmncc	r1, r4, ror #10
 7c0:	65313563 	ldrvs	r3, [r1, #-1379]!	; 0xfffffa9d
 7c4:	36396133 			; <UNDEFINED> instruction: 0x36396133
 7c8:	30366439 	eorscc	r6, r6, r9, lsr r4
 7cc:	62323739 	eorsvs	r3, r2, #14942208	; 0xe40000
 7d0:	34353865 	ldrtcc	r3, [r5], #-2149	; 0xfffff79b
 7d4:	66363035 			; <UNDEFINED> instruction: 0x66363035
 7d8:	63386466 	teqvs	r8, #1711276032	; 0x66000000
 7dc:	36626335 			; <UNDEFINED> instruction: 0x36626335
 7e0:	62696c2f 	rsbvs	r6, r9, #12032	; 0x2f00
 7e4:	79726172 	ldmdbvc	r2!, {r1, r4, r5, r6, r8, sp, lr}^
 7e8:	726f632f 	rsbvc	r6, pc, #-1140850688	; 0xbc000000
 7ec:	72732f65 	rsbsvc	r2, r3, #404	; 0x194
 7f0:	74692f63 	strbtvc	r2, [r9], #-3939	; 0xfffff09d
 7f4:	2f007265 	svccs	0x00007265
 7f8:	74737572 	ldrbtvc	r7, [r3], #-1394	; 0xfffffa8e
 7fc:	32392f63 	eorscc	r2, r9, #396	; 0x18c
 800:	65646562 	strbvs	r6, [r4, #-1378]!	; 0xfffffa9e
 804:	35633161 	strbcc	r3, [r3, #-353]!	; 0xfffffe9f
 808:	61336531 	teqvs	r3, r1, lsr r5
 80c:	64393639 	ldrtvs	r3, [r9], #-1593	; 0xfffff9c7
 810:	37393036 			; <UNDEFINED> instruction: 0x37393036
 814:	38656232 	stmdacc	r5!, {r1, r4, r5, r9, sp, lr}^
 818:	30353435 	eorscc	r3, r5, r5, lsr r4
 81c:	64666636 	strbtvs	r6, [r6], #-1590	; 0xfffff9ca
 820:	63356338 	teqvs	r5, #56, 6	; 0xe0000000
 824:	6c2f3662 	stcvs	6, cr3, [pc], #-392	; 6a4 <_umb_stack_size-0x95c>
 828:	61726269 	cmnvs	r2, r9, ror #4
 82c:	632f7972 			; <UNDEFINED> instruction: 0x632f7972
 830:	2f65726f 	svccs	0x0065726f
 834:	2f637273 	svccs	0x00637273
 838:	006d756e 	rsbeq	r7, sp, lr, ror #10
 83c:	75617300 	strbvc	r7, [r1, #-768]!	; 0xfffffd00
 840:	0073722e 	rsbseq	r7, r3, lr, lsr #4
 844:	63000001 	movwvs	r0, #1
 848:	722e706d 	eorvc	r7, lr, #109	; 0x6d
 84c:	00020073 	andeq	r0, r2, r3, ror r0
 850:	6e617200 	cdpvs	2, 6, cr7, cr1, cr0, {0}
 854:	722e6567 	eorvc	r6, lr, #432013312	; 0x19c00000
 858:	00030073 	andeq	r0, r3, r3, ror r0
 85c:	6e697500 	cdpvs	5, 6, cr7, cr9, cr0, {0}
 860:	616d5f74 	smcvs	54772	; 0xd5f4
 864:	736f7263 	cmnvc	pc, #805306374	; 0x30000006
 868:	0073722e 	rsbseq	r7, r3, lr, lsr #4
 86c:	00000004 	andeq	r0, r0, r4
 870:	000000d2 	ldrdeq	r0, [r0], -r2
 874:	00cc0004 	sbceq	r0, ip, r4
 878:	01010000 	mrseq	r0, (UNDEF: 1)
 87c:	0d0efb01 	vstreq	d15, [lr, #-4]
 880:	01010100 	mrseq	r0, (UNDEF: 17)
 884:	00000001 	andeq	r0, r0, r1
 888:	01000001 	tsteq	r0, r1
 88c:	7375722f 	cmnvc	r5, #-268435454	; 0xf0000002
 890:	392f6374 	stmdbcc	pc!, {r2, r4, r5, r6, r8, r9, sp, lr}	; <UNPREDICTABLE>
 894:	64656232 	strbtvs	r6, [r5], #-562	; 0xfffffdce
 898:	63316165 	teqvs	r1, #1073741849	; 0x40000019
 89c:	33653135 	cmncc	r5, #1073741837	; 0x4000000d
 8a0:	39363961 	ldmdbcc	r6!, {r0, r5, r6, r8, fp, ip, sp}
 8a4:	39303664 	ldmdbcc	r0!, {r2, r5, r6, r9, sl, ip, sp}
 8a8:	65623237 	strbvs	r3, [r2, #-567]!	; 0xfffffdc9
 8ac:	35343538 	ldrcc	r3, [r4, #-1336]!	; 0xfffffac8
 8b0:	66663630 			; <UNDEFINED> instruction: 0x66663630
 8b4:	35633864 	strbcc	r3, [r3, #-2148]!	; 0xfffff79c
 8b8:	2f366263 	svccs	0x00366263
 8bc:	7262696c 	rsbvc	r6, r2, #108, 18	; 0x1b0000
 8c0:	2f797261 	svccs	0x00797261
 8c4:	65726f63 	ldrbvs	r6, [r2, #-3939]!	; 0xfffff09d
 8c8:	6372732f 	cmnvs	r2, #-1140850688	; 0xbc000000
 8cc:	6d756e2f 	ldclvs	14, cr6, [r5, #-188]!	; 0xffffff44
 8d0:	75722f00 	ldrbvc	r2, [r2, #-3840]!	; 0xfffff100
 8d4:	2f637473 	svccs	0x00637473
 8d8:	65623239 	strbvs	r3, [r2, #-569]!	; 0xfffffdc7
 8dc:	31616564 	cmncc	r1, r4, ror #10
 8e0:	65313563 	ldrvs	r3, [r1, #-1379]!	; 0xfffffa9d
 8e4:	36396133 			; <UNDEFINED> instruction: 0x36396133
 8e8:	30366439 	eorscc	r6, r6, r9, lsr r4
 8ec:	62323739 	eorsvs	r3, r2, #14942208	; 0xe40000
 8f0:	34353865 	ldrtcc	r3, [r5], #-2149	; 0xfffff79b
 8f4:	66363035 			; <UNDEFINED> instruction: 0x66363035
 8f8:	63386466 	teqvs	r8, #1711276032	; 0x66000000
 8fc:	36626335 			; <UNDEFINED> instruction: 0x36626335
 900:	62696c2f 	rsbvs	r6, r9, #12032	; 0x2f00
 904:	79726172 	ldmdbvc	r2!, {r1, r4, r5, r6, r8, sp, lr}^
 908:	726f632f 	rsbvc	r6, pc, #-1140850688	; 0xbc000000
 90c:	72732f65 	rsbsvc	r2, r3, #404	; 0x194
 910:	74692f63 	strbtvc	r2, [r9], #-3939	; 0xfffff09d
 914:	73007265 	movwvc	r7, #613	; 0x265
 918:	00006372 	andeq	r6, r0, r2, ror r3
 91c:	746e6975 	strbtvc	r6, [lr], #-2421	; 0xfffff68b
 920:	63616d5f 	cmnvs	r1, #6080	; 0x17c0
 924:	2e736f72 	mrccs	15, 3, r6, cr3, cr2, {3}
 928:	01007372 	tsteq	r0, r2, ror r3
 92c:	61720000 	cmnvs	r2, r0
 930:	2e65676e 	cdpcs	7, 6, cr6, cr5, cr14, {3}
 934:	02007372 	andeq	r7, r0, #-939524095	; 0xc8000001
 938:	74670000 	strbtvc	r0, [r7], #-0
 93c:	722e637a 	eorvc	r6, lr, #-402653183	; 0xe8000001
 940:	00030073 	andeq	r0, r3, r3, ror r0
 944:	00440000 	subeq	r0, r4, r0
 948:	00040000 	andeq	r0, r4, r0
 94c:	0000002c 	andeq	r0, r0, ip, lsr #32
 950:	fb010101 	blx	40d5e <_umb_stack_size+0x3fd5e>
 954:	01000d0e 	tsteq	r0, lr, lsl #26
 958:	00010101 	andeq	r0, r1, r1, lsl #2
 95c:	00010000 	andeq	r0, r1, r0
 960:	72730100 	rsbsvc	r0, r3, #0, 2
 964:	75000063 	strvc	r0, [r0, #-99]	; 0xffffff9d
 968:	6172626d 	cmnvs	r2, sp, ror #4
 96c:	63736e5f 	cmnvs	r3, #1520	; 0x5f0
 970:	6970615f 	ldmdbvs	r0!, {r0, r1, r2, r3, r4, r6, r8, sp, lr}^
 974:	0073722e 	rsbseq	r7, r3, lr, lsr #4
 978:	00000001 	andeq	r0, r0, r1
 97c:	000a0505 	andeq	r0, sl, r5, lsl #10
 980:	00000205 	andeq	r0, r0, r5, lsl #4
 984:	30030801 	andcc	r0, r3, r1, lsl #16
 988:	00020201 	andeq	r0, r2, r1, lsl #4
 98c:	01200101 			; <UNDEFINED> instruction: 0x01200101
 990:	00040000 	andeq	r0, r4, r0
 994:	0000011a 	andeq	r0, r0, sl, lsl r1
 998:	fb010101 	blx	40da6 <_umb_stack_size+0x3fda6>
 99c:	01000d0e 	tsteq	r0, lr, lsl #26
 9a0:	00010101 	andeq	r0, r1, r1, lsl #2
 9a4:	00010000 	andeq	r0, r1, r0
 9a8:	722f0100 	eorvc	r0, pc, #0, 2
 9ac:	63747375 	cmnvs	r4, #-738197503	; 0xd4000001
 9b0:	6232392f 	eorsvs	r3, r2, #770048	; 0xbc000
 9b4:	61656465 	cmnvs	r5, r5, ror #8
 9b8:	31356331 	teqcc	r5, r1, lsr r3
 9bc:	39613365 	stmdbcc	r1!, {r0, r2, r5, r6, r8, r9, ip, sp}^
 9c0:	36643936 			; <UNDEFINED> instruction: 0x36643936
 9c4:	32373930 	eorscc	r3, r7, #48, 18	; 0xc0000
 9c8:	35386562 	ldrcc	r6, [r8, #-1378]!	; 0xfffffa9e
 9cc:	36303534 			; <UNDEFINED> instruction: 0x36303534
 9d0:	38646666 	stmdacc	r4!, {r1, r2, r5, r6, r9, sl, sp, lr}^
 9d4:	62633563 	rsbvs	r3, r3, #415236096	; 0x18c00000
 9d8:	696c2f36 	stmdbvs	ip!, {r1, r2, r4, r5, r8, r9, sl, fp, sp}^
 9dc:	72617262 	rsbvc	r7, r1, #536870918	; 0x20000006
 9e0:	6f632f79 	svcvs	0x00632f79
 9e4:	732f6572 			; <UNDEFINED> instruction: 0x732f6572
 9e8:	702f6372 	eorvc	r6, pc, r2, ror r3	; <UNPREDICTABLE>
 9ec:	73007274 	movwvc	r7, #628	; 0x274
 9f0:	2f006372 	svccs	0x00006372
 9f4:	74737572 	ldrbtvc	r7, [r3], #-1394	; 0xfffffa8e
 9f8:	32392f63 	eorscc	r2, r9, #396	; 0x18c
 9fc:	65646562 	strbvs	r6, [r4, #-1378]!	; 0xfffffa9e
 a00:	35633161 	strbcc	r3, [r3, #-353]!	; 0xfffffe9f
 a04:	61336531 	teqvs	r3, r1, lsr r5
 a08:	64393639 	ldrtvs	r3, [r9], #-1593	; 0xfffff9c7
 a0c:	37393036 			; <UNDEFINED> instruction: 0x37393036
 a10:	38656232 	stmdacc	r5!, {r1, r4, r5, r9, sp, lr}^
 a14:	30353435 	eorscc	r3, r5, r5, lsr r4
 a18:	64666636 	strbtvs	r6, [r6], #-1590	; 0xfffff9ca
 a1c:	63356338 	teqvs	r5, #56, 6	; 0xe0000000
 a20:	6c2f3662 	stcvs	6, cr3, [pc], #-392	; 8a0 <_umb_stack_size-0x760>
 a24:	61726269 	cmnvs	r2, r9, ror #4
 a28:	632f7972 			; <UNDEFINED> instruction: 0x632f7972
 a2c:	2f65726f 	svccs	0x0065726f
 a30:	2f637273 	svccs	0x00637273
 a34:	72657469 	rsbvc	r7, r5, #1761607680	; 0x69000000
 a38:	75722f00 	ldrbvc	r2, [r2, #-3840]!	; 0xfffff100
 a3c:	2f637473 	svccs	0x00637473
 a40:	65623239 	strbvs	r3, [r2, #-569]!	; 0xfffffdc7
 a44:	31616564 	cmncc	r1, r4, ror #10
 a48:	65313563 	ldrvs	r3, [r1, #-1379]!	; 0xfffffa9d
 a4c:	36396133 			; <UNDEFINED> instruction: 0x36396133
 a50:	30366439 	eorscc	r6, r6, r9, lsr r4
 a54:	62323739 	eorsvs	r3, r2, #14942208	; 0xe40000
 a58:	34353865 	ldrtcc	r3, [r5], #-2149	; 0xfffff79b
 a5c:	66363035 			; <UNDEFINED> instruction: 0x66363035
 a60:	63386466 	teqvs	r8, #1711276032	; 0x66000000
 a64:	36626335 			; <UNDEFINED> instruction: 0x36626335
 a68:	62696c2f 	rsbvs	r6, r9, #12032	; 0x2f00
 a6c:	79726172 	ldmdbvc	r2!, {r1, r4, r5, r6, r8, sp, lr}^
 a70:	726f632f 	rsbvc	r6, pc, #-1140850688	; 0xbc000000
 a74:	72732f65 	rsbsvc	r2, r3, #404	; 0x194
 a78:	756e2f63 	strbvc	r2, [lr, #-3939]!	; 0xfffff09d
 a7c:	6d00006d 	stcvs	0, cr0, [r0, #-436]	; 0xfffffe4c
 a80:	722e646f 	eorvc	r6, lr, #1862270976	; 0x6f000000
 a84:	00010073 	andeq	r0, r1, r3, ror r0
 a88:	62696c00 	rsbvs	r6, r9, #0, 24
 a8c:	0073722e 	rsbseq	r7, r3, lr, lsr #4
 a90:	72000002 	andvc	r0, r0, #2
 a94:	65676e61 	strbvs	r6, [r7, #-3681]!	; 0xfffff19f
 a98:	0073722e 	rsbseq	r7, r3, lr, lsr #4
 a9c:	75000003 	strvc	r0, [r0, #-3]
 aa0:	5f746e69 	svcpl	0x00746e69
 aa4:	7263616d 	rsbvc	r6, r3, #1073741851	; 0x4000001b
 aa8:	722e736f 	eorvc	r7, lr, #-1140850687	; 0xbc000001
 aac:	00040073 	andeq	r0, r4, r3, ror r0
	...
