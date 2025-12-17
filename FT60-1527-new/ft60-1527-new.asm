//Deviec:FT60F01X
//-----------------------Variable---------------------------------
//		bag_1527@Data		EQU		45H
//		bag_1527@frame_num		EQU		49H
//		bag_1527@slp_time		EQU		4BH
//		coding_1527@Bit_Mask		EQU		40H
//		coding_1527@k		EQU		44H
//		coding_1527@Temp_Data		EQU		72H
//		DelayMs@Time		EQU		72H
//		DelayMs@b		EQU		74H
//		DelayMs@a		EQU		73H
//		DelayMs@Time		EQU		72H
//		DelayMs@Time		EQU		72H
//		DelayUs@Time		EQU		70H
//		DelayUs@a		EQU		71H
//		DelayUs@Time		EQU		70H
//		DelayUs@Time		EQU		70H
//-----------------------Variable END---------------------------------

		LJUMP 	3FEH 			//0000 	3BFE
		ORG		0361H

		//;coding.c: 36: (PA4 = 1);
		BSR 	5H,4 			//0361 	1A05

		//;coding.c: 37: DelayUs(12);
		LDWI 	CH 			//0362 	2A0C
		LCALL 	376H 			//0363 	3376

		//;coding.c: 38: (PA4 = 0);
		BCR 	STATUS,5 		//0364 	1283
		BCR 	5H,4 			//0365 	1205

		//;coding.c: 39: DelayUs(4);
		LDWI 	4H 			//0366 	2A04
		LJUMP 	376H 			//0367 	3B76

		//;coding.c: 24: (PA4 = 1);
		BSR 	5H,4 			//0368 	1A05

		//;coding.c: 25: DelayUs(4);
		LDWI 	4H 			//0369 	2A04
		LCALL 	376H 			//036A 	3376

		//;coding.c: 26: (PA4 = 0);
		BCR 	STATUS,5 		//036B 	1283
		BCR 	5H,4 			//036C 	1205

		//;coding.c: 27: DelayUs(12);
		LDWI 	CH 			//036D 	2A0C
		LJUMP 	376H 			//036E 	3B76

		//;coding.c: 12: (PA4 = 1);
		BSR 	5H,4 			//036F 	1A05

		//;coding.c: 13: DelayUs(4);
		LDWI 	4H 			//0370 	2A04
		LCALL 	376H 			//0371 	3376

		//;coding.c: 14: (PA4 = 0);
		BCR 	STATUS,5 		//0372 	1283
		BCR 	5H,4 			//0373 	1205

		//;coding.c: 15: DelayUs(124);
		LDWI 	7CH 			//0374 	2A7C
		LJUMP 	376H 			//0375 	3B76
		STR 	70H 			//0376 	01F0

		//;init.c: 12: unsigned char a;
		//;init.c: 13: for(a = 0; a < Time; a++)
		CLRR 	71H 			//0377 	0171
		LDR 	70H,0 			//0378 	0870
		SUBWR 	71H,0 			//0379 	0C71
		BTSC 	STATUS,0 		//037A 	1403
		RET		 					//037B 	0004

		//;init.c: 14: {
		//;init.c: 15: __nop();
		NOP		 					//037C 	0000
		INCR	71H,1 			//037D 	09F1
		LJUMP 	378H 			//037E 	3B78
		STR 	72H 			//037F 	01F2

		//;init.c: 26: unsigned char a, b;
		//;init.c: 27: for(a = 0; a < Time; a++)
		CLRR 	73H 			//0380 	0173
		LDR 	72H,0 			//0381 	0872
		SUBWR 	73H,0 			//0382 	0C73
		BTSC 	STATUS,0 		//0383 	1403
		RET		 					//0384 	0004

		//;init.c: 28: {
		//;init.c: 29: for(b = 0; b < 5; b++)
		CLRR 	74H 			//0385 	0174

		//;init.c: 30: {
		//;init.c: 31: DelayUs(98);
		LDWI 	62H 			//0386 	2A62
		LCALL 	376H 			//0387 	3376
		LDWI 	5H 			//0388 	2A05
		INCR	74H,1 			//0389 	09F4
		SUBWR 	74H,0 			//038A 	0C74
		BTSS 	STATUS,0 		//038B 	1C03
		LJUMP 	386H 			//038C 	3B86
		INCR	73H,1 			//038D 	09F3
		LJUMP 	381H 			//038E 	3B81
		CLRWDT	 			//038F 	0001

		//;init.c: 43: OSCCON = 0B01011001;
		LDWI 	59H 			//0390 	2A59
		BSR 	STATUS,5 		//0391 	1A83
		STR 	FH 			//0392 	018F

		//;init.c: 44: INTCON = 0;
		CLRR 	INTCON 			//0393 	010B

		//;init.c: 46: PORTA = 0B00000000;
		BCR 	STATUS,5 		//0394 	1283
		CLRR 	5H 			//0395 	0105

		//;init.c: 47: TRISA = 0B00000100;
		LDWI 	4H 			//0396 	2A04
		BSR 	STATUS,5 		//0397 	1A83
		STR 	5H 			//0398 	0185

		//;init.c: 48: WPUA = 0B00000100;
		STR 	15H 			//0399 	0195

		//;init.c: 50: OPTION = 0B00000000;
		CLRR 	1H 			//039A 	0101

		//;init.c: 51: MSCKCON = 0B00000000;
		BCR 	STATUS,5 		//039B 	1283
		CLRR 	1BH 			//039C 	011B

		//;init.c: 52: WDTCON = 0B00010011;
		LDWI 	13H 			//039D 	2A13
		STR 	18H 			//039E 	0198

		//;init.c: 54: PEIE = 0;
		BCR 	INTCON,6 		//039F 	130B

		//;init.c: 55: GIE = 0;
		BCR 	INTCON,7 		//03A0 	138B
		RET		 					//03A1 	0004

		//;main.c: 20: Sys_Init();
		LCALL 	38FH 			//03A2 	338F

		//;main.c: 22: {
		//;main.c: 23: if(PA2 == 0)
		BCR 	STATUS,5 		//03A3 	1283
		BTSC 	5H,2 			//03A4 	1505
		LJUMP 	3B9H 			//03A5 	3BB9

		//;main.c: 24: {
		//;main.c: 25: DelayMs(10);
		LDWI 	AH 			//03A6 	2A0A
		LCALL 	37FH 			//03A7 	337F

		//;main.c: 26: if(PA2 == 0)
		BCR 	STATUS,5 		//03A8 	1283
		BTSC 	5H,2 			//03A9 	1505
		LJUMP 	3B9H 			//03AA 	3BB9

		//;main.c: 27: {
		//;main.c: 28: bag_1527(0xeeffef,256,3);
		LDWI 	EEH 			//03AB 	2AEE
		CLRR 	48H 			//03AC 	0148
		STR 	47H 			//03AD 	01C7
		LDWI 	FFH 			//03AE 	2AFF
		STR 	46H 			//03AF 	01C6
		LDWI 	EFH 			//03B0 	2AEF
		STR 	45H 			//03B1 	01C5
		LDWI 	1H 			//03B2 	2A01
		CLRR 	49H 			//03B3 	0149
		STR 	4AH 			//03B4 	01CA
		LDWI 	3H 			//03B5 	2A03
		STR 	4BH 			//03B6 	01CB
		CLRR 	4CH 			//03B7 	014C
		LCALL 	3BBH 			//03B8 	33BB
		CLRWDT	 			//03B9 	0001
		LJUMP 	3A3H 			//03BA 	3BA3

		//;coding.c: 77: (PA5 = 1);
		BSR 	5H,5 			//03BB 	1A85

		//;coding.c: 79: while(frame_num--)
		LDWI 	1H 			//03BC 	2A01
		BCR 	STATUS,5 		//03BD 	1283
		SUBWR 	49H,1 			//03BE 	0CC9
		LDWI 	0H 			//03BF 	2A00
		BTSS 	STATUS,0 		//03C0 	1C03
		DECR 	4AH,1 			//03C1 	0DCA
		SUBWR 	4AH,1 			//03C2 	0CCA
		INCRSZ 	49H,0 		//03C3 	0A49
		LJUMP 	3C8H 			//03C4 	3BC8
		INCR	4AH,0 			//03C5 	094A
		BTSC 	STATUS,2 		//03C6 	1503
		LJUMP 	3D4H 			//03C7 	3BD4

		//;coding.c: 80: {
		//;coding.c: 81: coding_1527(Data);
		LDR 	48H,0 			//03C8 	0848
		STR 	75H 			//03C9 	01F5
		LDR 	47H,0 			//03CA 	0847
		STR 	74H 			//03CB 	01F4
		LDR 	46H,0 			//03CC 	0846
		STR 	73H 			//03CD 	01F3
		LDR 	45H,0 			//03CE 	0845
		STR 	72H 			//03CF 	01F2
		LCALL 	3D6H 			//03D0 	33D6

		//;coding.c: 83: DelayMs(slp_time);
		LDR 	4BH,0 			//03D1 	084B
		LCALL 	37FH 			//03D2 	337F
		LJUMP 	3BCH 			//03D3 	3BBC

		//;coding.c: 84: }
		//;coding.c: 85: (PA5 = 0);
		BCR 	5H,5 			//03D4 	1285
		RET		 					//03D5 	0004

		//;coding.c: 49: unsigned char k;
		//;coding.c: 50: unsigned long Bit_Mask = 0x800000;
		LDWI 	80H 			//03D6 	2A80
		CLRR 	43H 			//03D7 	0143
		STR 	42H 			//03D8 	01C2
		CLRR 	41H 			//03D9 	0141
		CLRR 	40H 			//03DA 	0140

		//;coding.c: 52: coding_syn_1527();
		LCALL 	36FH 			//03DB 	336F

		//;coding.c: 54: for(k = 0; k < 24; k++)
		BCR 	STATUS,5 		//03DC 	1283
		CLRR 	44H 			//03DD 	0144

		//;coding.c: 55: {
		//;coding.c: 56: if(Temp_Data & Bit_Mask)
		LDR 	40H,0 			//03DE 	0840
		ANDWR 	72H,0 			//03DF 	0272
		STR 	76H 			//03E0 	01F6
		LDR 	41H,0 			//03E1 	0841
		ANDWR 	73H,0 			//03E2 	0273
		STR 	77H 			//03E3 	01F7
		LDR 	42H,0 			//03E4 	0842
		ANDWR 	74H,0 			//03E5 	0274
		STR 	78H 			//03E6 	01F8
		LDR 	43H,0 			//03E7 	0843
		ANDWR 	75H,0 			//03E8 	0275
		STR 	79H 			//03E9 	01F9
		IORWR 	78H,0 			//03EA 	0378
		IORWR 	77H,0 			//03EB 	0377
		IORWR 	76H,0 			//03EC 	0376
		BTSC 	STATUS,2 		//03ED 	1503
		LJUMP 	3F1H 			//03EE 	3BF1

		//;coding.c: 57: {
		//;coding.c: 58: coding_H_1527();
		LCALL 	361H 			//03EF 	3361

		//;coding.c: 59: }
		LJUMP 	3F2H 			//03F0 	3BF2

		//;coding.c: 60: else
		//;coding.c: 61: {
		//;coding.c: 62: coding_L_1527();
		LCALL 	368H 			//03F1 	3368
		LDWI 	18H 			//03F2 	2A18

		//;coding.c: 63: }
		//;coding.c: 64: Bit_Mask >>= 1;
		BCR 	STATUS,0 		//03F3 	1003
		BCR 	STATUS,5 		//03F4 	1283
		RRR	43H,1 			//03F5 	06C3
		RRR	42H,1 			//03F6 	06C2
		RRR	41H,1 			//03F7 	06C1
		RRR	40H,1 			//03F8 	06C0
		INCR	44H,1 			//03F9 	09C4
		SUBWR 	44H,0 			//03FA 	0C44
		BTSC 	STATUS,0 		//03FB 	1403
		RET		 					//03FC 	0004
		LJUMP 	3DEH 			//03FD 	3BDE
		CLRR 	STATUS 			//03FE 	0103
		LJUMP 	3A2H 			//03FF 	3BA2
			END
