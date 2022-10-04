--------------------------------------------------------------------
startup:
0801 : 0b __ __ INV
0802 : 08 __ __ PHP
0803 : 0a __ __ ASL
0804 : 00 __ __ BRK
0805 : 9e __ __ INV
0806 : 32 __ __ INV
0807 : 30 36 __ BMI $083f
0809 : 31 00 __ AND ($00),y 
080b : 00 __ __ BRK
080c : 00 __ __ BRK
080d : ba __ __ TSX
080e : 8e fe 0c STX $0cfe ; (spentry + 0)
0811 : a9 be __ LDA #$be
0813 : 85 19 __ STA IP + 0 
0815 : a9 3c __ LDA #$3c
0817 : 85 1a __ STA IP + 1 
0819 : 38 __ __ SEC
081a : a9 46 __ LDA #$46
081c : e9 3c __ SBC #$3c
081e : f0 0f __ BEQ $082f
0820 : aa __ __ TAX
0821 : a9 00 __ LDA #$00
0823 : a0 00 __ LDY #$00
0825 : 91 19 __ STA (IP + 0),y 
0827 : c8 __ __ INY
0828 : d0 fb __ BNE $0825
082a : e6 1a __ INC IP + 1 
082c : ca __ __ DEX
082d : d0 f6 __ BNE $0825
082f : 38 __ __ SEC
0830 : a9 ce __ LDA #$ce
0832 : e9 be __ SBC #$be
0834 : f0 08 __ BEQ $083e
0836 : a8 __ __ TAY
0837 : a9 00 __ LDA #$00
0839 : 88 __ __ DEY
083a : 91 19 __ STA (IP + 0),y 
083c : d0 fb __ BNE $0839
083e : a9 fe __ LDA #$fe
0840 : 85 23 __ STA SP + 0 
0842 : a9 9f __ LDA #$9f
0844 : 85 24 __ STA SP + 1 
0846 : 20 00 09 JSR $0900 ; (main + 0)
0849 : a9 4c __ LDA #$4c
084b : 85 54 __ STA $54 
084d : a9 00 __ LDA #$00
084f : 85 13 __ STA P6 
0851 : a9 19 __ LDA #$19
0853 : 85 16 __ STA P9 
0855 : 60 __ __ RTS
--------------------------------------------------------------------
spentry:
0cfe : __ __ __ BYT 00                                              : .
--------------------------------------------------------------------
main:
0900 : 20 16 09 JSR $0916 ; (init + 0)
0903 : 20 f5 09 JSR $09f5 ; (project_init + 0)
0906 : ad f5 33 LDA $33f5 ; (scene_tree + 23)
0909 : 85 1b __ STA ACCU + 0 
090b : ad f6 33 LDA $33f6 ; (scene_tree + 24)
090e : 85 1c __ STA ACCU + 1 
0910 : 20 fd 0f JSR $0ffd ; (bcexec + 0)
0913 : 4c 06 09 JMP $0906 ; (main + 6)
--------------------------------------------------------------------
init:
0916 : a9 37 __ LDA #$37
0918 : 8d f5 31 STA $31f5 ; (PLAShadow + 0)
091b : 85 01 __ STA $01 
091d : 20 44 09 JSR $0944 ; (cia_init + 0)
0920 : a9 00 __ LDA #$00
0922 : 85 0d __ STA P0 
0924 : 85 0e __ STA P1 
0926 : 85 10 __ STA P3 
0928 : a9 04 __ LDA #$04
092a : 85 0f __ STA P2 
092c : a9 18 __ LDA #$18
092e : 85 11 __ STA P4 
0930 : 20 75 09 JSR $0975 ; (vic_setmode + 0)
0933 : a9 00 __ LDA #$00
0935 : 8d 21 d0 STA $d021 
0938 : 8d 20 d0 STA $d020 
093b : 20 cd 09 JSR $09cd ; (sidfx_init + 0)
093e : a9 0f __ LDA #$0f
0940 : 8d 18 d4 STA $d418 
0943 : 60 __ __ RTS
--------------------------------------------------------------------
PLAShadow:
31f5 : __ __ __ BSS	1
--------------------------------------------------------------------
cia_init:
0944 : a9 7f __ LDA #$7f
0946 : 8d 0d dc STA $dc0d 
0949 : 8d 0d dd STA $dd0d 
094c : 8d 00 dc STA $dc00 
094f : a9 08 __ LDA #$08
0951 : 8d 0e dc STA $dc0e 
0954 : 8d 0f dc STA $dc0f 
0957 : 8d 0e dd STA $dd0e 
095a : 8d 0f dd STA $dd0f 
095d : a9 00 __ LDA #$00
095f : 8d 03 dc STA $dc03 
0962 : 8d 03 dd STA $dd03 
0965 : a9 ff __ LDA #$ff
0967 : 8d 02 dc STA $dc02 
096a : a9 07 __ LDA #$07
096c : 8d 01 dd STA $dd01 
096f : a9 3f __ LDA #$3f
0971 : 8d 02 dd STA $dd02 
0974 : 60 __ __ RTS
--------------------------------------------------------------------
vic_setmode:
0975 : a5 0d __ LDA P0 
0977 : a6 0f __ LDX P2 
0979 : c9 03 __ CMP #$03
097b : d0 04 __ BNE $0981
097d : a9 3b __ LDA #$3b
097f : d0 45 __ BNE $09c6
0981 : 90 31 __ BCC $09b4
0983 : a9 3b __ LDA #$3b
0985 : 8d 11 d0 STA $d011 
0988 : a9 18 __ LDA #$18
098a : 8d 16 d0 STA $d016 
098d : ad 00 dd LDA $dd00 
0990 : 29 fc __ AND #$fc
0992 : 85 43 __ STA T2 + 0 
0994 : 8a __ __ TXA
0995 : 0a __ __ ASL
0996 : 2a __ __ ROL
0997 : 29 01 __ AND #$01
0999 : 2a __ __ ROL
099a : 49 03 __ EOR #$03
099c : 05 43 __ ORA T2 + 0 
099e : 8d 00 dd STA $dd00 
09a1 : 8a __ __ TXA
09a2 : 0a __ __ ASL
09a3 : 0a __ __ ASL
09a4 : 29 f0 __ AND #$f0
09a6 : 85 43 __ STA T2 + 0 
09a8 : a5 11 __ LDA P4 
09aa : 4a __ __ LSR
09ab : 4a __ __ LSR
09ac : 29 0e __ AND #$0e
09ae : 05 43 __ ORA T2 + 0 
09b0 : 8d 18 d0 STA $d018 
09b3 : 60 __ __ RTS
09b4 : 09 00 __ ORA #$00
09b6 : d0 04 __ BNE $09bc
09b8 : a9 1b __ LDA #$1b
09ba : d0 0a __ BNE $09c6
09bc : c9 01 __ CMP #$01
09be : d0 04 __ BNE $09c4
09c0 : a9 1b __ LDA #$1b
09c2 : d0 c1 __ BNE $0985
09c4 : a9 5b __ LDA #$5b
09c6 : 8d 11 d0 STA $d011 
09c9 : a9 08 __ LDA #$08
09cb : d0 bd __ BNE $098a
--------------------------------------------------------------------
sidfx_init:
09cd : a9 c0 __ LDA #$c0
09cf : 85 43 __ STA T1 + 0 
09d1 : a9 33 __ LDA #$33
09d3 : 85 44 __ STA T1 + 1 
09d5 : a2 03 __ LDX #$03
09d7 : a9 00 __ LDA #$00
09d9 : a0 04 __ LDY #$04
09db : 91 43 __ STA (T1 + 0),y 
09dd : c8 __ __ INY
09de : 91 43 __ STA (T1 + 0),y 
09e0 : a8 __ __ TAY
09e1 : 91 43 __ STA (T1 + 0),y 
09e3 : c8 __ __ INY
09e4 : 91 43 __ STA (T1 + 0),y 
09e6 : 18 __ __ CLC
09e7 : a5 43 __ LDA T1 + 0 
09e9 : 69 0a __ ADC #$0a
09eb : 85 43 __ STA T1 + 0 
09ed : 90 02 __ BCC $09f1
09ef : e6 44 __ INC T1 + 1 
09f1 : ca __ __ DEX
09f2 : d0 e3 __ BNE $09d7
09f4 : 60 __ __ RTS
--------------------------------------------------------------------
channels:
33c0 : __ __ __ BSS	30
--------------------------------------------------------------------
project_init:
09f5 : 38 __ __ SEC
09f6 : a5 23 __ LDA SP + 0 
09f8 : e9 04 __ SBC #$04
09fa : 85 23 __ STA SP + 0 
09fc : b0 02 __ BCS $0a00
09fe : c6 24 __ DEC SP + 1 
0a00 : a0 02 __ LDY #$02
0a02 : b9 53 00 LDA $0053,y 
0a05 : 91 23 __ STA (SP + 0),y 
0a07 : 88 __ __ DEY
0a08 : 10 f8 __ BPL $0a02
0a0a : 20 57 0a JSR $0a57 ; (scene_tree_assign_pointers + 0)
0a0d : a9 00 __ LDA #$00
0a0f : 85 53 __ STA T0 + 0 
0a11 : a9 df __ LDA #$df
0a13 : 85 54 __ STA T1 + 0 
0a15 : a9 33 __ LDA #$33
0a17 : 85 55 __ STA T1 + 1 
0a19 : a0 00 __ LDY #$00
0a1b : b1 54 __ LDA (T1 + 0),y 
0a1d : 85 1b __ STA ACCU + 0 
0a1f : c8 __ __ INY
0a20 : b1 54 __ LDA (T1 + 0),y 
0a22 : 85 1c __ STA ACCU + 1 
0a24 : 20 fd 0f JSR $0ffd ; (bcexec + 0)
0a27 : 18 __ __ CLC
0a28 : a5 54 __ LDA T1 + 0 
0a2a : 69 04 __ ADC #$04
0a2c : 85 54 __ STA T1 + 0 
0a2e : 90 02 __ BCC $0a32
0a30 : e6 55 __ INC T1 + 1 
0a32 : e6 53 __ INC T0 + 0 
0a34 : a5 53 __ LDA T0 + 0 
0a36 : c9 05 __ CMP #$05
0a38 : 90 df __ BCC $0a19
0a3a : a9 02 __ LDA #$02
0a3c : 85 0d __ STA P0 
0a3e : 20 0c 22 JSR $220c ; (change_main_scene_to + 0)
0a41 : a0 02 __ LDY #$02
0a43 : b1 23 __ LDA (SP + 0),y 
0a45 : 99 53 00 STA $0053,y 
0a48 : 88 __ __ DEY
0a49 : 10 f8 __ BPL $0a43
0a4b : 18 __ __ CLC
0a4c : a5 23 __ LDA SP + 0 
0a4e : 69 04 __ ADC #$04
0a50 : 85 23 __ STA SP + 0 
0a52 : 90 02 __ BCC $0a56
0a54 : e6 24 __ INC SP + 1 
0a56 : 60 __ __ RTS
--------------------------------------------------------------------
scene_tree_assign_pointers:
0a57 : a9 00 __ LDA #$00
0a59 : 85 0d __ STA P0 
0a5b : a9 de __ LDA #$de
0a5d : 8d f3 33 STA $33f3 ; (scene_tree + 21)
0a60 : a9 0a __ LDA #$0a
0a62 : 8d f4 33 STA $33f4 ; (scene_tree + 22)
0a65 : a9 de __ LDA #$de
0a67 : 8d f5 33 STA $33f5 ; (scene_tree + 23)
0a6a : a9 0a __ LDA #$0a
0a6c : 8d f6 33 STA $33f6 ; (scene_tree + 24)
0a6f : a9 f9 __ LDA #$f9
0a71 : 85 0e __ STA P1 
0a73 : a9 0a __ LDA #$0a
0a75 : 85 0f __ STA P2 
0a77 : a9 da __ LDA #$da
0a79 : 85 10 __ STA P3 
0a7b : a9 12 __ LDA #$12
0a7d : 85 11 __ STA P4 
0a7f : 20 df 0a JSR $0adf ; (set_scene_pointers + 0)
0a82 : a9 01 __ LDA #$01
0a84 : 85 0d __ STA P0 
0a86 : a9 de __ LDA #$de
0a88 : 85 0e __ STA P1 
0a8a : a9 0a __ LDA #$0a
0a8c : 85 0f __ STA P2 
0a8e : a9 2f __ LDA #$2f
0a90 : 85 10 __ STA P3 
0a92 : a9 22 __ LDA #$22
0a94 : 85 11 __ STA P4 
0a96 : 20 df 0a JSR $0adf ; (set_scene_pointers + 0)
0a99 : a9 02 __ LDA #$02
0a9b : 85 0d __ STA P0 
0a9d : a9 fa __ LDA #$fa
0a9f : 85 0e __ STA P1 
0aa1 : a9 0f __ LDA #$0f
0aa3 : 85 0f __ STA P2 
0aa5 : a9 00 __ LDA #$00
0aa7 : 85 10 __ STA P3 
0aa9 : a9 28 __ LDA #$28
0aab : 85 11 __ STA P4 
0aad : 20 df 0a JSR $0adf ; (set_scene_pointers + 0)
0ab0 : a9 03 __ LDA #$03
0ab2 : 85 0d __ STA P0 
0ab4 : a9 de __ LDA #$de
0ab6 : 85 0e __ STA P1 
0ab8 : a9 0a __ LDA #$0a
0aba : 85 0f __ STA P2 
0abc : a9 00 __ LDA #$00
0abe : 85 10 __ STA P3 
0ac0 : a9 2c __ LDA #$2c
0ac2 : 85 11 __ STA P4 
0ac4 : 20 df 0a JSR $0adf ; (set_scene_pointers + 0)
0ac7 : a9 04 __ LDA #$04
0ac9 : 85 0d __ STA P0 
0acb : a9 de __ LDA #$de
0acd : 85 0e __ STA P1 
0acf : a9 0a __ LDA #$0a
0ad1 : 85 0f __ STA P2 
0ad3 : a9 b1 __ LDA #$b1
0ad5 : 85 10 __ STA P3 
0ad7 : a9 2f __ LDA #$2f
0ad9 : 85 11 __ STA P4 
0adb : 4c df 0a JMP $0adf ; (set_scene_pointers + 0)
--------------------------------------------------------------------
null:
0ade : 60 __ __ RTS
--------------------------------------------------------------------
scene_tree:
33de : __ __ __ BSS	25
--------------------------------------------------------------------
set_scene_pointers:
0adf : a5 0d __ LDA P0 
0ae1 : 0a __ __ ASL
0ae2 : 0a __ __ ASL
0ae3 : aa __ __ TAX
0ae4 : a5 0e __ LDA P1 
0ae6 : 9d df 33 STA $33df,x ; (scene_tree + 1)
0ae9 : a5 0f __ LDA P2 
0aeb : 9d e0 33 STA $33e0,x ; (scene_tree + 2)
0aee : a5 10 __ LDA P3 
0af0 : 9d e1 33 STA $33e1,x ; (scene_tree + 3)
0af3 : a5 11 __ LDA P4 
0af5 : 9d e2 33 STA $33e2,x ; (scene_tree + 4)
0af8 : 60 __ __ RTS
--------------------------------------------------------------------
edit_window_init:
0af9 : 4c fc 0a JMP $0afc ; (edit_window_init_options_struct + 0)
--------------------------------------------------------------------
edit_window_init_options_struct:
0afc : a9 00 __ LDA #$00
0afe : 8d 67 3b STA $3b67 ; (menu + 6)
0b01 : 8d 68 3b STA $3b68 ; (menu + 7)
0b04 : 8d 6a 3b STA $3b6a ; (menu + 9)
0b07 : 8d cf 3b STA $3bcf ; (menu + 110)
0b0a : a9 01 __ LDA #$01
0b0c : 8d 69 3b STA $3b69 ; (menu + 8)
0b0f : a9 00 __ LDA #$00
0b11 : 8d 61 3b STA $3b61 ; (menu + 0)
0b14 : a9 0d __ LDA #$0d
0b16 : 8d 62 3b STA $3b62 ; (menu + 1)
0b19 : a9 00 __ LDA #$00
0b1b : 8d 63 3b STA $3b63 ; (menu + 2)
0b1e : a9 0e __ LDA #$0e
0b20 : 8d 64 3b STA $3b64 ; (menu + 3)
0b23 : a9 de __ LDA #$de
0b25 : 8d 65 3b STA $3b65 ; (menu + 4)
0b28 : a9 0a __ LDA #$0a
0b2a : 8d 66 3b STA $3b66 ; (menu + 5)
0b2d : a9 00 __ LDA #$00
0b2f : 8d 72 3b STA $3b72 ; (menu + 17)
0b32 : 8d 75 3b STA $3b75 ; (menu + 20)
0b35 : a9 01 __ LDA #$01
0b37 : 8d 73 3b STA $3b73 ; (menu + 18)
0b3a : 8d 74 3b STA $3b74 ; (menu + 19)
0b3d : a9 02 __ LDA #$02
0b3f : 8d 76 3b STA $3b76 ; (menu + 21)
0b42 : a9 14 __ LDA #$14
0b44 : 8d 6c 3b STA $3b6c ; (menu + 11)
0b47 : a9 0e __ LDA #$0e
0b49 : 8d 6d 3b STA $3b6d ; (menu + 12)
0b4c : a9 f3 __ LDA #$f3
0b4e : 8d 6e 3b STA $3b6e ; (menu + 13)
0b51 : a9 0c __ LDA #$0c
0b53 : 8d 6f 3b STA $3b6f ; (menu + 14)
0b56 : a9 84 __ LDA #$84
0b58 : 8d 70 3b STA $3b70 ; (menu + 15)
0b5b : a9 0e __ LDA #$0e
0b5d : 8d 71 3b STA $3b71 ; (menu + 16)
0b60 : a9 00 __ LDA #$00
0b62 : 8d 7d 3b STA $3b7d ; (menu + 28)
0b65 : 8d 7e 3b STA $3b7e ; (menu + 29)
0b68 : 8d 80 3b STA $3b80 ; (menu + 31)
0b6b : 8d 81 3b STA $3b81 ; (menu + 32)
0b6e : a9 01 __ LDA #$01
0b70 : 8d 7f 3b STA $3b7f ; (menu + 30)
0b73 : a9 00 __ LDA #$00
0b75 : 8d 77 3b STA $3b77 ; (menu + 22)
0b78 : a9 0f __ LDA #$0f
0b7a : 8d 78 3b STA $3b78 ; (menu + 23)
0b7d : a9 f3 __ LDA #$f3
0b7f : 8d 79 3b STA $3b79 ; (menu + 24)
0b82 : a9 0d __ LDA #$0d
0b84 : 8d 7a 3b STA $3b7a ; (menu + 25)
0b87 : a9 4a __ LDA #$4a
0b89 : 8d 7b 3b STA $3b7b ; (menu + 26)
0b8c : a9 0f __ LDA #$0f
0b8e : 8d 7c 3b STA $3b7c ; (menu + 27)
0b91 : a9 0f __ LDA #$0f
0b93 : 8d 88 3b STA $3b88 ; (menu + 39)
0b96 : a9 00 __ LDA #$00
0b98 : 8d 89 3b STA $3b89 ; (menu + 40)
0b9b : 8d 8b 3b STA $3b8b ; (menu + 42)
0b9e : 8d 8c 3b STA $3b8c ; (menu + 43)
0ba1 : a9 01 __ LDA #$01
0ba3 : 8d 8a 3b STA $3b8a ; (menu + 41)
0ba6 : a9 7d __ LDA #$7d
0ba8 : 8d 82 3b STA $3b82 ; (menu + 33)
0bab : a9 0f __ LDA #$0f
0bad : 8d 83 3b STA $3b83 ; (menu + 34)
0bb0 : a9 e2 __ LDA #$e2
0bb2 : 8d 84 3b STA $3b84 ; (menu + 35)
0bb5 : a9 0e __ LDA #$0e
0bb7 : 8d 85 3b STA $3b85 ; (menu + 36)
0bba : a9 c7 __ LDA #$c7
0bbc : 8d 86 3b STA $3b86 ; (menu + 37)
0bbf : a9 0f __ LDA #$0f
0bc1 : 8d 87 3b STA $3b87 ; (menu + 38)
0bc4 : a9 00 __ LDA #$00
0bc6 : 8d 93 3b STA $3b93 ; (menu + 50)
0bc9 : 8d 94 3b STA $3b94 ; (menu + 51)
0bcc : 8d 96 3b STA $3b96 ; (menu + 53)
0bcf : 8d 97 3b STA $3b97 ; (menu + 54)
0bd2 : a9 01 __ LDA #$01
0bd4 : 8d 95 3b STA $3b95 ; (menu + 52)
0bd7 : a9 00 __ LDA #$00
0bd9 : 8d 8d 3b STA $3b8d ; (menu + 44)
0bdc : a9 10 __ LDA #$10
0bde : 8d 8e 3b STA $3b8e ; (menu + 45)
0be1 : a9 ea __ LDA #$ea
0be3 : 8d 8f 3b STA $3b8f ; (menu + 46)
0be6 : a9 0e __ LDA #$0e
0be8 : 8d 90 3b STA $3b90 ; (menu + 47)
0beb : a9 4a __ LDA #$4a
0bed : 8d 91 3b STA $3b91 ; (menu + 48)
0bf0 : a9 10 __ LDA #$10
0bf2 : 8d 92 3b STA $3b92 ; (menu + 49)
0bf5 : a9 00 __ LDA #$00
0bf7 : 8d 9e 3b STA $3b9e ; (menu + 61)
0bfa : 8d 9f 3b STA $3b9f ; (menu + 62)
0bfd : 8d a1 3b STA $3ba1 ; (menu + 64)
0c00 : 8d a2 3b STA $3ba2 ; (menu + 65)
0c03 : a9 01 __ LDA #$01
0c05 : 8d a0 3b STA $3ba0 ; (menu + 63)
0c08 : a9 7d __ LDA #$7d
0c0a : 8d 98 3b STA $3b98 ; (menu + 55)
0c0d : a9 10 __ LDA #$10
0c0f : 8d 99 3b STA $3b99 ; (menu + 56)
0c12 : a9 f2 __ LDA #$f2
0c14 : 8d 9a 3b STA $3b9a ; (menu + 57)
0c17 : a9 0e __ LDA #$0e
0c19 : 8d 9b 3b STA $3b9b ; (menu + 58)
0c1c : a9 c7 __ LDA #$c7
0c1e : 8d 9c 3b STA $3b9c ; (menu + 59)
0c21 : a9 10 __ LDA #$10
0c23 : 8d 9d 3b STA $3b9d ; (menu + 60)
0c26 : a9 00 __ LDA #$00
0c28 : 8d a9 3b STA $3ba9 ; (menu + 72)
0c2b : 8d aa 3b STA $3baa ; (menu + 73)
0c2e : 8d ac 3b STA $3bac ; (menu + 75)
0c31 : a9 01 __ LDA #$01
0c33 : 8d ab 3b STA $3bab ; (menu + 74)
0c36 : a9 03 __ LDA #$03
0c38 : 8d ad 3b STA $3bad ; (menu + 76)
0c3b : a9 00 __ LDA #$00
0c3d : 8d a3 3b STA $3ba3 ; (menu + 66)
0c40 : a9 11 __ LDA #$11
0c42 : 8d a4 3b STA $3ba4 ; (menu + 67)
0c45 : a9 7b __ LDA #$7b
0c47 : 8d a5 3b STA $3ba5 ; (menu + 68)
0c4a : a9 11 __ LDA #$11
0c4c : 8d a6 3b STA $3ba6 ; (menu + 69)
0c4f : a9 86 __ LDA #$86
0c51 : 8d a7 3b STA $3ba7 ; (menu + 70)
0c54 : a9 11 __ LDA #$11
0c56 : 8d a8 3b STA $3ba8 ; (menu + 71)
0c59 : a9 00 __ LDA #$00
0c5b : 8d b4 3b STA $3bb4 ; (menu + 83)
0c5e : 8d b5 3b STA $3bb5 ; (menu + 84)
0c61 : 8d b7 3b STA $3bb7 ; (menu + 86)
0c64 : a9 01 __ LDA #$01
0c66 : 8d b6 3b STA $3bb6 ; (menu + 85)
0c69 : a9 02 __ LDA #$02
0c6b : 8d b8 3b STA $3bb8 ; (menu + 87)
0c6e : a9 00 __ LDA #$00
0c70 : 8d ae 3b STA $3bae ; (menu + 77)
0c73 : a9 12 __ LDA #$12
0c75 : 8d af 3b STA $3baf ; (menu + 78)
0c78 : a9 ec __ LDA #$ec
0c7a : 8d b0 3b STA $3bb0 ; (menu + 79)
0c7d : a9 11 __ LDA #$11
0c7f : 8d b1 3b STA $3bb1 ; (menu + 80)
0c82 : a9 66 __ LDA #$66
0c84 : 8d b2 3b STA $3bb2 ; (menu + 81)
0c87 : a9 12 __ LDA #$12
0c89 : 8d b3 3b STA $3bb3 ; (menu + 82)
0c8c : a9 08 __ LDA #$08
0c8e : 8d bf 3b STA $3bbf ; (menu + 94)
0c91 : a9 00 __ LDA #$00
0c93 : 8d c0 3b STA $3bc0 ; (menu + 95)
0c96 : 8d c2 3b STA $3bc2 ; (menu + 97)
0c99 : a9 01 __ LDA #$01
0c9b : 8d c1 3b STA $3bc1 ; (menu + 96)
0c9e : 8d c3 3b STA $3bc3 ; (menu + 98)
0ca1 : a9 00 __ LDA #$00
0ca3 : 8d b9 3b STA $3bb9 ; (menu + 88)
0ca6 : a9 13 __ LDA #$13
0ca8 : 8d ba 3b STA $3bba ; (menu + 89)
0cab : a9 c4 __ LDA #$c4
0cad : 8d bb 3b STA $3bbb ; (menu + 90)
0cb0 : a9 12 __ LDA #$12
0cb2 : 8d bc 3b STA $3bbc ; (menu + 91)
0cb5 : a9 4e __ LDA #$4e
0cb7 : 8d bd 3b STA $3bbd ; (menu + 92)
0cba : a9 13 __ LDA #$13
0cbc : 8d be 3b STA $3bbe ; (menu + 93)
0cbf : a9 08 __ LDA #$08
0cc1 : 8d ca 3b STA $3bca ; (menu + 105)
0cc4 : a9 00 __ LDA #$00
0cc6 : 8d cb 3b STA $3bcb ; (menu + 106)
0cc9 : 8d cd 3b STA $3bcd ; (menu + 108)
0ccc : a9 01 __ LDA #$01
0cce : 8d cc 3b STA $3bcc ; (menu + 107)
0cd1 : 8d ce 3b STA $3bce ; (menu + 109)
0cd4 : a9 8a __ LDA #$8a
0cd6 : 8d c4 3b STA $3bc4 ; (menu + 99)
0cd9 : a9 13 __ LDA #$13
0cdb : 8d c5 3b STA $3bc5 ; (menu + 100)
0cde : a9 cf __ LDA #$cf
0ce0 : 8d c6 3b STA $3bc6 ; (menu + 101)
0ce3 : a9 12 __ LDA #$12
0ce5 : 8d c7 3b STA $3bc7 ; (menu + 102)
0ce8 : a9 00 __ LDA #$00
0cea : 8d c8 3b STA $3bc8 ; (menu + 103)
0ced : a9 14 __ LDA #$14
0cef : 8d c9 3b STA $3bc9 ; (menu + 104)
0cf2 : 60 __ __ RTS
--------------------------------------------------------------------
menu:
3b61 : __ __ __ BSS	111
--------------------------------------------------------------------
waveform_menu_change_option:
0d00 : ad 68 3b LDA $3b68 ; (menu + 7)
0d03 : d0 0e __ BNE $0d13
0d05 : ad 67 3b LDA $3b67 ; (menu + 6)
0d08 : c9 02 __ CMP #$02
0d0a : d0 07 __ BNE $0d13
0d0c : a9 0b __ LDA #$0b
0d0e : 85 13 __ STA P6 
0d10 : 20 47 0d JSR $0d47 ; (waveform_menu_set_option + 0)
0d13 : a0 02 __ LDY #$02
0d15 : b1 23 __ LDA (SP + 0),y 
0d17 : d0 0e __ BNE $0d27
0d19 : ad 67 3b LDA $3b67 ; (menu + 6)
0d1c : d0 03 __ BNE $0d21
0d1e : ce 68 3b DEC $3b68 ; (menu + 7)
0d21 : ce 67 3b DEC $3b67 ; (menu + 6)
0d24 : 4c 33 0d JMP $0d33 ; (waveform_menu_change_option + 51)
0d27 : c9 02 __ CMP #$02
0d29 : d0 08 __ BNE $0d33
0d2b : ee 67 3b INC $3b67 ; (menu + 6)
0d2e : d0 03 __ BNE $0d33
0d30 : ee 68 3b INC $3b68 ; (menu + 7)
0d33 : a9 0f __ LDA #$0f
0d35 : 85 13 __ STA P6 
0d37 : ad 67 3b LDA $3b67 ; (menu + 6)
0d3a : 29 03 __ AND #$03
0d3c : 8d 67 3b STA $3b67 ; (menu + 6)
0d3f : a9 00 __ LDA #$00
0d41 : 8d 68 3b STA $3b68 ; (menu + 7)
0d44 : 4c 47 0d JMP $0d47 ; (waveform_menu_set_option + 0)
--------------------------------------------------------------------
waveform_menu_set_option:
0d47 : ad 67 3b LDA $3b67 ; (menu + 6)
0d4a : d0 12 __ BNE $0d5e
0d4c : a9 20 __ LDA #$20
0d4e : 85 0d __ STA P0 
0d50 : 85 0e __ STA P1 
0d52 : a9 14 __ LDA #$14
0d54 : 85 0f __ STA P2 
0d56 : a9 12 __ LDA #$12
0d58 : 85 10 __ STA P3 
0d5a : a9 09 __ LDA #$09
0d5c : d0 31 __ BNE $0d8f
0d5e : c9 01 __ CMP #$01
0d60 : d0 12 __ BNE $0d74
0d62 : a9 20 __ LDA #$20
0d64 : 85 0d __ STA P0 
0d66 : 85 0e __ STA P1 
0d68 : a9 13 __ LDA #$13
0d6a : 85 0f __ STA P2 
0d6c : a9 01 __ LDA #$01
0d6e : 85 10 __ STA P3 
0d70 : a9 17 __ LDA #$17
0d72 : d0 1b __ BNE $0d8f
0d74 : c9 02 __ CMP #$02
0d76 : f0 1c __ BEQ $0d94
0d78 : c9 03 __ CMP #$03
0d7a : f0 01 __ BEQ $0d7d
0d7c : 60 __ __ RTS
0d7d : a9 0e __ LDA #$0e
0d7f : 85 0d __ STA P0 
0d81 : a9 0f __ LDA #$0f
0d83 : 85 0e __ STA P1 
0d85 : a9 09 __ LDA #$09
0d87 : 85 0f __ STA P2 
0d89 : a9 13 __ LDA #$13
0d8b : 85 10 __ STA P3 
0d8d : a9 05 __ LDA #$05
0d8f : 85 11 __ STA P4 
0d91 : 4c 9b 0d JMP $0d9b ; (waveform_menu_option_put + 0)
0d94 : a5 13 __ LDA P6 
0d96 : 85 12 __ STA P5 
0d98 : 4c b5 0d JMP $0db5 ; (waveform_menu_option_pulse + 0)
--------------------------------------------------------------------
waveform_menu_option_put:
0d9b : a5 0d __ LDA P0 
0d9d : 8d 16 04 STA $0416 
0da0 : a5 0e __ LDA P1 
0da2 : 8d 17 04 STA $0417 
0da5 : a5 0f __ LDA P2 
0da7 : 8d 18 04 STA $0418 
0daa : a5 10 __ LDA P3 
0dac : 8d 19 04 STA $0419 
0daf : a5 11 __ LDA P4 
0db1 : 8d 1a 04 STA $041a 
0db4 : 60 __ __ RTS
--------------------------------------------------------------------
waveform_menu_option_pulse:
0db5 : a5 12 __ LDA P5 
0db7 : c9 0f __ CMP #$0f
0db9 : d0 1d __ BNE $0dd8
0dbb : a9 10 __ LDA #$10
0dbd : 85 0d __ STA P0 
0dbf : a9 15 __ LDA #$15
0dc1 : 85 0e __ STA P1 
0dc3 : a9 0c __ LDA #$0c
0dc5 : 85 0f __ STA P2 
0dc7 : a9 13 __ LDA #$13
0dc9 : 85 10 __ STA P3 
0dcb : a9 05 __ LDA #$05
0dcd : 85 11 __ STA P4 
0dcf : 20 9b 0d JSR $0d9b ; (waveform_menu_option_put + 0)
0dd2 : a5 12 __ LDA P5 
0dd4 : c9 0f __ CMP #$0f
0dd6 : f0 04 __ BEQ $0ddc
0dd8 : a9 00 __ LDA #$00
0dda : f0 02 __ BEQ $0dde
0ddc : a9 0b __ LDA #$0b
0dde : a0 00 __ LDY #$00
0de0 : 99 33 d8 STA $d833,y 
0de3 : c8 __ __ INY
0de4 : c0 1c __ CPY #$1c
0de6 : 90 f8 __ BCC $0de0
0de8 : a0 00 __ LDY #$00
0dea : 99 23 d9 STA $d923,y 
0ded : c8 __ __ INY
0dee : c0 1c __ CPY #$1c
0df0 : 90 f8 __ BCC $0dea
0df2 : 60 __ __ RTS
--------------------------------------------------------------------
waveform_menu_change_color:
0e00 : a0 02 __ LDY #$02
0e02 : b1 23 __ LDA (SP + 0),y 
0e04 : 8d 16 d8 STA $d816 
0e07 : 8d 17 d8 STA $d817 
0e0a : 8d 18 d8 STA $d818 
0e0d : 8d 19 d8 STA $d819 
0e10 : 8d 1a d8 STA $d81a 
0e13 : 60 __ __ RTS
--------------------------------------------------------------------
pwm_menu_change_value:
0e14 : ad 68 3b LDA $3b68 ; (menu + 7)
0e17 : d0 6a __ BNE $0e83
0e19 : ad 67 3b LDA $3b67 ; (menu + 6)
0e1c : c9 02 __ CMP #$02
0e1e : d0 63 __ BNE $0e83
0e20 : a0 02 __ LDY #$02
0e22 : b1 23 __ LDA (SP + 0),y 
0e24 : d0 16 __ BNE $0e3c
0e26 : ad 72 3b LDA $3b72 ; (menu + 17)
0e29 : 38 __ __ SEC
0e2a : ed 74 3b SBC $3b74 ; (menu + 19)
0e2d : 8d 72 3b STA $3b72 ; (menu + 17)
0e30 : ad 73 3b LDA $3b73 ; (menu + 18)
0e33 : ed 75 3b SBC $3b75 ; (menu + 20)
0e36 : 8d 73 3b STA $3b73 ; (menu + 18)
0e39 : 4c 53 0e JMP $0e53 ; (pwm_menu_change_value + 63)
0e3c : c9 02 __ CMP #$02
0e3e : d0 13 __ BNE $0e53
0e40 : ad 74 3b LDA $3b74 ; (menu + 19)
0e43 : 18 __ __ CLC
0e44 : 6d 72 3b ADC $3b72 ; (menu + 17)
0e47 : 8d 72 3b STA $3b72 ; (menu + 17)
0e4a : ad 75 3b LDA $3b75 ; (menu + 20)
0e4d : 6d 73 3b ADC $3b73 ; (menu + 18)
0e50 : 8d 73 3b STA $3b73 ; (menu + 18)
0e53 : ad 73 3b LDA $3b73 ; (menu + 18)
0e56 : 29 0f __ AND #$0f
0e58 : aa __ __ TAX
0e59 : bd b0 31 LDA $31b0,x ; (int2hexpetscii + 0)
0e5c : 8d 40 04 STA $0440 
0e5f : ad 73 3b LDA $3b73 ; (menu + 18)
0e62 : 4a __ __ LSR
0e63 : 85 44 __ STA T3 + 1 
0e65 : ad 72 3b LDA $3b72 ; (menu + 17)
0e68 : 6a __ __ ROR
0e69 : 46 44 __ LSR T3 + 1 
0e6b : 6a __ __ ROR
0e6c : 4a __ __ LSR
0e6d : 4a __ __ LSR
0e6e : 29 0f __ AND #$0f
0e70 : aa __ __ TAX
0e71 : bd b0 31 LDA $31b0,x ; (int2hexpetscii + 0)
0e74 : 8d 41 04 STA $0441 
0e77 : ad 72 3b LDA $3b72 ; (menu + 17)
0e7a : 29 0f __ AND #$0f
0e7c : aa __ __ TAX
0e7d : bd b0 31 LDA $31b0,x ; (int2hexpetscii + 0)
0e80 : 8d 42 04 STA $0442 
0e83 : 60 __ __ RTS
--------------------------------------------------------------------
int2hexpetscii:
31b0 : __ __ __ BYT 30 31 32 33 34 35 36 37 38 39 01 02 03 04 05 06 : 0123456789......
--------------------------------------------------------------------
pwm_menu_change_color:
0cf3 : a0 02 __ LDY #$02
0cf5 : b1 23 __ LDA (SP + 0),y 
0cf7 : ae 76 3b LDX $3b76 ; (menu + 21)
0cfa : 9d 40 d8 STA $d840,x 
0cfd : 60 __ __ RTS
--------------------------------------------------------------------
pwm_menu_cycle_step:
0e84 : a9 0b __ LDA #$0b
0e86 : ac 76 3b LDY $3b76 ; (menu + 21)
0e89 : 99 40 d8 STA $d840,y 
0e8c : ad 75 3b LDA $3b75 ; (menu + 20)
0e8f : c9 01 __ CMP #$01
0e91 : d0 09 __ BNE $0e9c
0e93 : ad 74 3b LDA $3b74 ; (menu + 19)
0e96 : d0 04 __ BNE $0e9c
0e98 : a9 10 __ LDA #$10
0e9a : d0 3c __ BNE $0ed8
0e9c : ad 75 3b LDA $3b75 ; (menu + 20)
0e9f : d0 21 __ BNE $0ec2
0ea1 : ad 74 3b LDA $3b74 ; (menu + 19)
0ea4 : c9 10 __ CMP #$10
0ea6 : d0 04 __ BNE $0eac
0ea8 : a9 01 __ LDA #$01
0eaa : d0 2c __ BNE $0ed8
0eac : ad 75 3b LDA $3b75 ; (menu + 20)
0eaf : d0 11 __ BNE $0ec2
0eb1 : ad 74 3b LDA $3b74 ; (menu + 19)
0eb4 : c9 01 __ CMP #$01
0eb6 : d0 0a __ BNE $0ec2
0eb8 : a9 00 __ LDA #$00
0eba : 8d 74 3b STA $3b74 ; (menu + 19)
0ebd : a9 01 __ LDA #$01
0ebf : 8d 75 3b STA $3b75 ; (menu + 20)
0ec2 : c8 __ __ INY
0ec3 : 8c 76 3b STY $3b76 ; (menu + 21)
0ec6 : c0 03 __ CPY #$03
0ec8 : 90 05 __ BCC $0ecf
0eca : a9 00 __ LDA #$00
0ecc : 8d 76 3b STA $3b76 ; (menu + 21)
0ecf : a9 0f __ LDA #$0f
0ed1 : ae 76 3b LDX $3b76 ; (menu + 21)
0ed4 : 9d 40 d8 STA $d840,x 
0ed7 : 60 __ __ RTS
0ed8 : 8d 74 3b STA $3b74 ; (menu + 19)
0edb : a9 00 __ LDA #$00
0edd : 8d 75 3b STA $3b75 ; (menu + 20)
0ee0 : f0 e0 __ BEQ $0ec2
--------------------------------------------------------------------
attack_menu_change_value:
0f00 : a0 02 __ LDY #$02
0f02 : b1 23 __ LDA (SP + 0),y 
0f04 : d0 16 __ BNE $0f1c
0f06 : ad 7d 3b LDA $3b7d ; (menu + 28)
0f09 : 38 __ __ SEC
0f0a : ed 7f 3b SBC $3b7f ; (menu + 30)
0f0d : 8d 7d 3b STA $3b7d ; (menu + 28)
0f10 : ad 7e 3b LDA $3b7e ; (menu + 29)
0f13 : ed 80 3b SBC $3b80 ; (menu + 31)
0f16 : 8d 7e 3b STA $3b7e ; (menu + 29)
0f19 : 4c 33 0f JMP $0f33 ; (attack_menu_change_value + 51)
0f1c : c9 02 __ CMP #$02
0f1e : d0 13 __ BNE $0f33
0f20 : ad 7f 3b LDA $3b7f ; (menu + 30)
0f23 : 18 __ __ CLC
0f24 : 6d 7d 3b ADC $3b7d ; (menu + 28)
0f27 : 8d 7d 3b STA $3b7d ; (menu + 28)
0f2a : ad 80 3b LDA $3b80 ; (menu + 31)
0f2d : 6d 7e 3b ADC $3b7e ; (menu + 29)
0f30 : 8d 7e 3b STA $3b7e ; (menu + 29)
0f33 : ad 7d 3b LDA $3b7d ; (menu + 28)
0f36 : 29 0f __ AND #$0f
0f38 : 8d 7d 3b STA $3b7d ; (menu + 28)
0f3b : a9 00 __ LDA #$00
0f3d : 8d 7e 3b STA $3b7e ; (menu + 29)
0f40 : ae 7d 3b LDX $3b7d ; (menu + 28)
0f43 : bd b0 31 LDA $31b0,x ; (int2hexpetscii + 0)
0f46 : 8d 6a 04 STA $046a 
0f49 : 60 __ __ RTS
--------------------------------------------------------------------
attack_menu_change_color:
0df3 : a0 02 __ LDY #$02
0df5 : b1 23 __ LDA (SP + 0),y 
0df7 : 8d 6a d8 STA $d86a 
0dfa : 60 __ __ RTS
--------------------------------------------------------------------
attack_menu_cycle_step:
0f4a : ad 80 3b LDA $3b80 ; (menu + 31)
0f4d : d0 21 __ BNE $0f70
0f4f : ad 7f 3b LDA $3b7f ; (menu + 30)
0f52 : c9 01 __ CMP #$01
0f54 : d0 04 __ BNE $0f5a
0f56 : a9 02 __ LDA #$02
0f58 : d0 0e __ BNE $0f68
0f5a : ad 80 3b LDA $3b80 ; (menu + 31)
0f5d : d0 11 __ BNE $0f70
0f5f : ad 7f 3b LDA $3b7f ; (menu + 30)
0f62 : c9 02 __ CMP #$02
0f64 : d0 0a __ BNE $0f70
0f66 : a9 01 __ LDA #$01
0f68 : 8d 7f 3b STA $3b7f ; (menu + 30)
0f6b : a9 00 __ LDA #$00
0f6d : 8d 80 3b STA $3b80 ; (menu + 31)
0f70 : ad 7f 3b LDA $3b7f ; (menu + 30)
0f73 : 29 0f __ AND #$0f
0f75 : aa __ __ TAX
0f76 : bd b0 31 LDA $31b0,x ; (int2hexpetscii + 0)
0f79 : 8d 75 04 STA $0475 
0f7c : 60 __ __ RTS
--------------------------------------------------------------------
decay_menu_change_value:
0f7d : a0 02 __ LDY #$02
0f7f : b1 23 __ LDA (SP + 0),y 
0f81 : d0 16 __ BNE $0f99
0f83 : ad 88 3b LDA $3b88 ; (menu + 39)
0f86 : 38 __ __ SEC
0f87 : ed 8a 3b SBC $3b8a ; (menu + 41)
0f8a : 8d 88 3b STA $3b88 ; (menu + 39)
0f8d : ad 89 3b LDA $3b89 ; (menu + 40)
0f90 : ed 8b 3b SBC $3b8b ; (menu + 42)
0f93 : 8d 89 3b STA $3b89 ; (menu + 40)
0f96 : 4c b0 0f JMP $0fb0 ; (decay_menu_change_value + 51)
0f99 : c9 02 __ CMP #$02
0f9b : d0 13 __ BNE $0fb0
0f9d : ad 8a 3b LDA $3b8a ; (menu + 41)
0fa0 : 18 __ __ CLC
0fa1 : 6d 88 3b ADC $3b88 ; (menu + 39)
0fa4 : 8d 88 3b STA $3b88 ; (menu + 39)
0fa7 : ad 8b 3b LDA $3b8b ; (menu + 42)
0faa : 6d 89 3b ADC $3b89 ; (menu + 40)
0fad : 8d 89 3b STA $3b89 ; (menu + 40)
0fb0 : ad 88 3b LDA $3b88 ; (menu + 39)
0fb3 : 29 0f __ AND #$0f
0fb5 : 8d 88 3b STA $3b88 ; (menu + 39)
0fb8 : a9 00 __ LDA #$00
0fba : 8d 89 3b STA $3b89 ; (menu + 40)
0fbd : ae 88 3b LDX $3b88 ; (menu + 39)
0fc0 : bd b0 31 LDA $31b0,x ; (int2hexpetscii + 0)
0fc3 : 8d 92 04 STA $0492 
0fc6 : 60 __ __ RTS
--------------------------------------------------------------------
decay_menu_change_color:
0ee2 : a0 02 __ LDY #$02
0ee4 : b1 23 __ LDA (SP + 0),y 
0ee6 : 8d 92 d8 STA $d892 
0ee9 : 60 __ __ RTS
--------------------------------------------------------------------
decay_menu_cycle_step:
0fc7 : ad 8b 3b LDA $3b8b ; (menu + 42)
0fca : d0 21 __ BNE $0fed
0fcc : ad 8a 3b LDA $3b8a ; (menu + 41)
0fcf : c9 01 __ CMP #$01
0fd1 : d0 04 __ BNE $0fd7
0fd3 : a9 02 __ LDA #$02
0fd5 : d0 0e __ BNE $0fe5
0fd7 : ad 8b 3b LDA $3b8b ; (menu + 42)
0fda : d0 11 __ BNE $0fed
0fdc : ad 8a 3b LDA $3b8a ; (menu + 41)
0fdf : c9 02 __ CMP #$02
0fe1 : d0 0a __ BNE $0fed
0fe3 : a9 01 __ LDA #$01
0fe5 : 8d 8a 3b STA $3b8a ; (menu + 41)
0fe8 : a9 00 __ LDA #$00
0fea : 8d 8b 3b STA $3b8b ; (menu + 42)
0fed : ad 8a 3b LDA $3b8a ; (menu + 41)
0ff0 : 29 0f __ AND #$0f
0ff2 : aa __ __ TAX
0ff3 : bd b0 31 LDA $31b0,x ; (int2hexpetscii + 0)
0ff6 : 8d 9d 04 STA $049d 
0ff9 : 60 __ __ RTS
--------------------------------------------------------------------
sustain_menu_change_value:
1000 : a0 02 __ LDY #$02
1002 : b1 23 __ LDA (SP + 0),y 
1004 : d0 16 __ BNE $101c
1006 : ad 93 3b LDA $3b93 ; (menu + 50)
1009 : 38 __ __ SEC
100a : ed 95 3b SBC $3b95 ; (menu + 52)
100d : 8d 93 3b STA $3b93 ; (menu + 50)
1010 : ad 94 3b LDA $3b94 ; (menu + 51)
1013 : ed 96 3b SBC $3b96 ; (menu + 53)
1016 : 8d 94 3b STA $3b94 ; (menu + 51)
1019 : 4c 33 10 JMP $1033 ; (sustain_menu_change_value + 51)
101c : c9 02 __ CMP #$02
101e : d0 13 __ BNE $1033
1020 : ad 95 3b LDA $3b95 ; (menu + 52)
1023 : 18 __ __ CLC
1024 : 6d 93 3b ADC $3b93 ; (menu + 50)
1027 : 8d 93 3b STA $3b93 ; (menu + 50)
102a : ad 96 3b LDA $3b96 ; (menu + 53)
102d : 6d 94 3b ADC $3b94 ; (menu + 51)
1030 : 8d 94 3b STA $3b94 ; (menu + 51)
1033 : ad 93 3b LDA $3b93 ; (menu + 50)
1036 : 29 0f __ AND #$0f
1038 : 8d 93 3b STA $3b93 ; (menu + 50)
103b : a9 00 __ LDA #$00
103d : 8d 94 3b STA $3b94 ; (menu + 51)
1040 : ae 93 3b LDX $3b93 ; (menu + 50)
1043 : bd b0 31 LDA $31b0,x ; (int2hexpetscii + 0)
1046 : 8d ba 04 STA $04ba 
1049 : 60 __ __ RTS
--------------------------------------------------------------------
sustain_menu_change_color:
0eea : a0 02 __ LDY #$02
0eec : b1 23 __ LDA (SP + 0),y 
0eee : 8d ba d8 STA $d8ba 
0ef1 : 60 __ __ RTS
--------------------------------------------------------------------
sustain_menu_cycle_step:
104a : ad 96 3b LDA $3b96 ; (menu + 53)
104d : d0 21 __ BNE $1070
104f : ad 95 3b LDA $3b95 ; (menu + 52)
1052 : c9 01 __ CMP #$01
1054 : d0 04 __ BNE $105a
1056 : a9 02 __ LDA #$02
1058 : d0 0e __ BNE $1068
105a : ad 96 3b LDA $3b96 ; (menu + 53)
105d : d0 11 __ BNE $1070
105f : ad 95 3b LDA $3b95 ; (menu + 52)
1062 : c9 02 __ CMP #$02
1064 : d0 0a __ BNE $1070
1066 : a9 01 __ LDA #$01
1068 : 8d 95 3b STA $3b95 ; (menu + 52)
106b : a9 00 __ LDA #$00
106d : 8d 96 3b STA $3b96 ; (menu + 53)
1070 : ad 95 3b LDA $3b95 ; (menu + 52)
1073 : 29 0f __ AND #$0f
1075 : aa __ __ TAX
1076 : bd b0 31 LDA $31b0,x ; (int2hexpetscii + 0)
1079 : 8d c5 04 STA $04c5 
107c : 60 __ __ RTS
--------------------------------------------------------------------
release_menu_change_value:
107d : a0 02 __ LDY #$02
107f : b1 23 __ LDA (SP + 0),y 
1081 : d0 16 __ BNE $1099
1083 : ad 9e 3b LDA $3b9e ; (menu + 61)
1086 : 38 __ __ SEC
1087 : ed a0 3b SBC $3ba0 ; (menu + 63)
108a : 8d 9e 3b STA $3b9e ; (menu + 61)
108d : ad 9f 3b LDA $3b9f ; (menu + 62)
1090 : ed a1 3b SBC $3ba1 ; (menu + 64)
1093 : 8d 9f 3b STA $3b9f ; (menu + 62)
1096 : 4c b0 10 JMP $10b0 ; (release_menu_change_value + 51)
1099 : c9 02 __ CMP #$02
109b : d0 13 __ BNE $10b0
109d : ad a0 3b LDA $3ba0 ; (menu + 63)
10a0 : 18 __ __ CLC
10a1 : 6d 9e 3b ADC $3b9e ; (menu + 61)
10a4 : 8d 9e 3b STA $3b9e ; (menu + 61)
10a7 : ad a1 3b LDA $3ba1 ; (menu + 64)
10aa : 6d 9f 3b ADC $3b9f ; (menu + 62)
10ad : 8d 9f 3b STA $3b9f ; (menu + 62)
10b0 : ad 9e 3b LDA $3b9e ; (menu + 61)
10b3 : 29 0f __ AND #$0f
10b5 : 8d 9e 3b STA $3b9e ; (menu + 61)
10b8 : a9 00 __ LDA #$00
10ba : 8d 9f 3b STA $3b9f ; (menu + 62)
10bd : ae 9e 3b LDX $3b9e ; (menu + 61)
10c0 : bd b0 31 LDA $31b0,x ; (int2hexpetscii + 0)
10c3 : 8d e2 04 STA $04e2 
10c6 : 60 __ __ RTS
--------------------------------------------------------------------
release_menu_change_color:
0ef2 : a0 02 __ LDY #$02
0ef4 : b1 23 __ LDA (SP + 0),y 
0ef6 : 8d e2 d8 STA $d8e2 
0ef9 : 60 __ __ RTS
--------------------------------------------------------------------
release_menu_cycle_step:
10c7 : ad a1 3b LDA $3ba1 ; (menu + 64)
10ca : d0 21 __ BNE $10ed
10cc : ad a0 3b LDA $3ba0 ; (menu + 63)
10cf : c9 01 __ CMP #$01
10d1 : d0 04 __ BNE $10d7
10d3 : a9 02 __ LDA #$02
10d5 : d0 0e __ BNE $10e5
10d7 : ad a1 3b LDA $3ba1 ; (menu + 64)
10da : d0 11 __ BNE $10ed
10dc : ad a0 3b LDA $3ba0 ; (menu + 63)
10df : c9 02 __ CMP #$02
10e1 : d0 0a __ BNE $10ed
10e3 : a9 01 __ LDA #$01
10e5 : 8d a0 3b STA $3ba0 ; (menu + 63)
10e8 : a9 00 __ LDA #$00
10ea : 8d a1 3b STA $3ba1 ; (menu + 64)
10ed : ad a0 3b LDA $3ba0 ; (menu + 63)
10f0 : 29 0f __ AND #$0f
10f2 : aa __ __ TAX
10f3 : bd b0 31 LDA $31b0,x ; (int2hexpetscii + 0)
10f6 : 8d ed 04 STA $04ed 
10f9 : 60 __ __ RTS
--------------------------------------------------------------------
dfreq_menu_change_value:
1100 : a0 02 __ LDY #$02
1102 : b1 23 __ LDA (SP + 0),y 
1104 : d0 16 __ BNE $111c
1106 : ad a9 3b LDA $3ba9 ; (menu + 72)
1109 : 38 __ __ SEC
110a : ed ab 3b SBC $3bab ; (menu + 74)
110d : 8d a9 3b STA $3ba9 ; (menu + 72)
1110 : ad aa 3b LDA $3baa ; (menu + 73)
1113 : ed ac 3b SBC $3bac ; (menu + 75)
1116 : 8d aa 3b STA $3baa ; (menu + 73)
1119 : 4c 33 11 JMP $1133 ; (dfreq_menu_change_value + 51)
111c : c9 02 __ CMP #$02
111e : d0 13 __ BNE $1133
1120 : ad ab 3b LDA $3bab ; (menu + 74)
1123 : 18 __ __ CLC
1124 : 6d a9 3b ADC $3ba9 ; (menu + 72)
1127 : 8d a9 3b STA $3ba9 ; (menu + 72)
112a : ad ac 3b LDA $3bac ; (menu + 75)
112d : 6d aa 3b ADC $3baa ; (menu + 73)
1130 : 8d aa 3b STA $3baa ; (menu + 73)
1133 : ad aa 3b LDA $3baa ; (menu + 73)
1136 : 4a __ __ LSR
1137 : 4a __ __ LSR
1138 : 4a __ __ LSR
1139 : 4a __ __ LSR
113a : 49 08 __ EOR #$08
113c : 38 __ __ SEC
113d : e9 08 __ SBC #$08
113f : 29 0f __ AND #$0f
1141 : aa __ __ TAX
1142 : bd b0 31 LDA $31b0,x ; (int2hexpetscii + 0)
1145 : 8d 07 05 STA $0507 
1148 : ad aa 3b LDA $3baa ; (menu + 73)
114b : 29 0f __ AND #$0f
114d : aa __ __ TAX
114e : bd b0 31 LDA $31b0,x ; (int2hexpetscii + 0)
1151 : 8d 08 05 STA $0508 
1154 : ad a9 3b LDA $3ba9 ; (menu + 72)
1157 : 85 43 __ STA T3 + 0 
1159 : ad aa 3b LDA $3baa ; (menu + 73)
115c : 4a __ __ LSR
115d : 66 43 __ ROR T3 + 0 
115f : 4a __ __ LSR
1160 : a5 43 __ LDA T3 + 0 
1162 : 6a __ __ ROR
1163 : 4a __ __ LSR
1164 : 4a __ __ LSR
1165 : 29 0f __ AND #$0f
1167 : aa __ __ TAX
1168 : bd b0 31 LDA $31b0,x ; (int2hexpetscii + 0)
116b : 8d 09 05 STA $0509 
116e : ad a9 3b LDA $3ba9 ; (menu + 72)
1171 : 29 0f __ AND #$0f
1173 : aa __ __ TAX
1174 : bd b0 31 LDA $31b0,x ; (int2hexpetscii + 0)
1177 : 8d 0a 05 STA $050a 
117a : 60 __ __ RTS
--------------------------------------------------------------------
dfreq_menu_change_color:
117b : a0 02 __ LDY #$02
117d : b1 23 __ LDA (SP + 0),y 
117f : ae ad 3b LDX $3bad ; (menu + 76)
1182 : 9d 07 d9 STA $d907,x 
1185 : 60 __ __ RTS
--------------------------------------------------------------------
dfreq_menu_cycle_step:
1186 : a9 0b __ LDA #$0b
1188 : ac ad 3b LDY $3bad ; (menu + 76)
118b : 99 07 d9 STA $d907,y 
118e : ad ac 3b LDA $3bac ; (menu + 75)
1191 : c9 10 __ CMP #$10
1193 : d0 11 __ BNE $11a6
1195 : ad ab 3b LDA $3bab ; (menu + 74)
1198 : d0 0c __ BNE $11a6
119a : a9 00 __ LDA #$00
119c : 8d ab 3b STA $3bab ; (menu + 74)
119f : a9 01 __ LDA #$01
11a1 : 8d ac 3b STA $3bac ; (menu + 75)
11a4 : d0 2e __ BNE $11d4
11a6 : ad ac 3b LDA $3bac ; (menu + 75)
11a9 : c9 01 __ CMP #$01
11ab : d0 09 __ BNE $11b6
11ad : ad ab 3b LDA $3bab ; (menu + 74)
11b0 : d0 04 __ BNE $11b6
11b2 : a9 10 __ LDA #$10
11b4 : d0 2c __ BNE $11e2
11b6 : ad ac 3b LDA $3bac ; (menu + 75)
11b9 : d0 19 __ BNE $11d4
11bb : ad ab 3b LDA $3bab ; (menu + 74)
11be : c9 10 __ CMP #$10
11c0 : d0 04 __ BNE $11c6
11c2 : a9 01 __ LDA #$01
11c4 : d0 1c __ BNE $11e2
11c6 : c9 01 __ CMP #$01
11c8 : d0 0a __ BNE $11d4
11ca : a9 00 __ LDA #$00
11cc : 8d ab 3b STA $3bab ; (menu + 74)
11cf : a9 10 __ LDA #$10
11d1 : 8d ac 3b STA $3bac ; (menu + 75)
11d4 : c8 __ __ INY
11d5 : 98 __ __ TYA
11d6 : 29 03 __ AND #$03
11d8 : 8d ad 3b STA $3bad ; (menu + 76)
11db : aa __ __ TAX
11dc : a9 0f __ LDA #$0f
11de : 9d 07 d9 STA $d907,x 
11e1 : 60 __ __ RTS
11e2 : 8d ab 3b STA $3bab ; (menu + 74)
11e5 : a9 00 __ LDA #$00
11e7 : 8d ac 3b STA $3bac ; (menu + 75)
11ea : f0 e8 __ BEQ $11d4
--------------------------------------------------------------------
dpwm_menu_change_value:
1200 : a0 02 __ LDY #$02
1202 : b1 23 __ LDA (SP + 0),y 
1204 : d0 16 __ BNE $121c
1206 : ad b4 3b LDA $3bb4 ; (menu + 83)
1209 : 38 __ __ SEC
120a : ed b6 3b SBC $3bb6 ; (menu + 85)
120d : 8d b4 3b STA $3bb4 ; (menu + 83)
1210 : ad b5 3b LDA $3bb5 ; (menu + 84)
1213 : ed b7 3b SBC $3bb7 ; (menu + 86)
1216 : 8d b5 3b STA $3bb5 ; (menu + 84)
1219 : 4c 33 12 JMP $1233 ; (dpwm_menu_change_value + 51)
121c : c9 02 __ CMP #$02
121e : d0 13 __ BNE $1233
1220 : ad b6 3b LDA $3bb6 ; (menu + 85)
1223 : 18 __ __ CLC
1224 : 6d b4 3b ADC $3bb4 ; (menu + 83)
1227 : 8d b4 3b STA $3bb4 ; (menu + 83)
122a : ad b7 3b LDA $3bb7 ; (menu + 86)
122d : 6d b5 3b ADC $3bb5 ; (menu + 84)
1230 : 8d b5 3b STA $3bb5 ; (menu + 84)
1233 : ad b5 3b LDA $3bb5 ; (menu + 84)
1236 : 29 0f __ AND #$0f
1238 : aa __ __ TAX
1239 : bd b0 31 LDA $31b0,x ; (int2hexpetscii + 0)
123c : 8d 30 05 STA $0530 
123f : ad b4 3b LDA $3bb4 ; (menu + 83)
1242 : 85 43 __ STA T3 + 0 
1244 : ad b5 3b LDA $3bb5 ; (menu + 84)
1247 : 4a __ __ LSR
1248 : 66 43 __ ROR T3 + 0 
124a : 4a __ __ LSR
124b : a5 43 __ LDA T3 + 0 
124d : 6a __ __ ROR
124e : 4a __ __ LSR
124f : 4a __ __ LSR
1250 : 29 0f __ AND #$0f
1252 : aa __ __ TAX
1253 : bd b0 31 LDA $31b0,x ; (int2hexpetscii + 0)
1256 : 8d 31 05 STA $0531 
1259 : ad b4 3b LDA $3bb4 ; (menu + 83)
125c : 29 0f __ AND #$0f
125e : aa __ __ TAX
125f : bd b0 31 LDA $31b0,x ; (int2hexpetscii + 0)
1262 : 8d 32 05 STA $0532 
1265 : 60 __ __ RTS
--------------------------------------------------------------------
dpwm_menu_change_color:
11ec : a0 02 __ LDY #$02
11ee : b1 23 __ LDA (SP + 0),y 
11f0 : ae b8 3b LDX $3bb8 ; (menu + 87)
11f3 : 9d 30 d9 STA $d930,x 
11f6 : 60 __ __ RTS
--------------------------------------------------------------------
dpwm_menu_cycle_step:
1266 : a9 0b __ LDA #$0b
1268 : ac b8 3b LDY $3bb8 ; (menu + 87)
126b : 99 30 d9 STA $d930,y 
126e : ad b7 3b LDA $3bb7 ; (menu + 86)
1271 : c9 01 __ CMP #$01
1273 : d0 09 __ BNE $127e
1275 : ad b6 3b LDA $3bb6 ; (menu + 85)
1278 : d0 04 __ BNE $127e
127a : a9 10 __ LDA #$10
127c : d0 3c __ BNE $12ba
127e : ad b7 3b LDA $3bb7 ; (menu + 86)
1281 : d0 21 __ BNE $12a4
1283 : ad b6 3b LDA $3bb6 ; (menu + 85)
1286 : c9 10 __ CMP #$10
1288 : d0 04 __ BNE $128e
128a : a9 01 __ LDA #$01
128c : d0 2c __ BNE $12ba
128e : ad b7 3b LDA $3bb7 ; (menu + 86)
1291 : d0 11 __ BNE $12a4
1293 : ad b6 3b LDA $3bb6 ; (menu + 85)
1296 : c9 01 __ CMP #$01
1298 : d0 0a __ BNE $12a4
129a : a9 00 __ LDA #$00
129c : 8d b6 3b STA $3bb6 ; (menu + 85)
129f : a9 01 __ LDA #$01
12a1 : 8d b7 3b STA $3bb7 ; (menu + 86)
12a4 : c8 __ __ INY
12a5 : 8c b8 3b STY $3bb8 ; (menu + 87)
12a8 : c0 03 __ CPY #$03
12aa : 90 05 __ BCC $12b1
12ac : a9 00 __ LDA #$00
12ae : 8d b8 3b STA $3bb8 ; (menu + 87)
12b1 : a9 0f __ LDA #$0f
12b3 : ae b8 3b LDX $3bb8 ; (menu + 87)
12b6 : 9d 30 d9 STA $d930,x 
12b9 : 60 __ __ RTS
12ba : 8d b6 3b STA $3bb6 ; (menu + 85)
12bd : a9 00 __ LDA #$00
12bf : 8d b7 3b STA $3bb7 ; (menu + 86)
12c2 : f0 e0 __ BEQ $12a4
--------------------------------------------------------------------
time1_menu_change_value:
1300 : a0 02 __ LDY #$02
1302 : b1 23 __ LDA (SP + 0),y 
1304 : d0 16 __ BNE $131c
1306 : ad bf 3b LDA $3bbf ; (menu + 94)
1309 : 38 __ __ SEC
130a : ed c1 3b SBC $3bc1 ; (menu + 96)
130d : 8d bf 3b STA $3bbf ; (menu + 94)
1310 : ad c0 3b LDA $3bc0 ; (menu + 95)
1313 : ed c2 3b SBC $3bc2 ; (menu + 97)
1316 : 8d c0 3b STA $3bc0 ; (menu + 95)
1319 : 4c 33 13 JMP $1333 ; (time1_menu_change_value + 51)
131c : c9 02 __ CMP #$02
131e : d0 13 __ BNE $1333
1320 : ad c1 3b LDA $3bc1 ; (menu + 96)
1323 : 18 __ __ CLC
1324 : 6d bf 3b ADC $3bbf ; (menu + 94)
1327 : 8d bf 3b STA $3bbf ; (menu + 94)
132a : ad c2 3b LDA $3bc2 ; (menu + 97)
132d : 6d c0 3b ADC $3bc0 ; (menu + 95)
1330 : 8d c0 3b STA $3bc0 ; (menu + 95)
1333 : ad bf 3b LDA $3bbf ; (menu + 94)
1336 : 4a __ __ LSR
1337 : 4a __ __ LSR
1338 : 4a __ __ LSR
1339 : 4a __ __ LSR
133a : aa __ __ TAX
133b : bd b0 31 LDA $31b0,x ; (int2hexpetscii + 0)
133e : 8d 59 05 STA $0559 
1341 : ad bf 3b LDA $3bbf ; (menu + 94)
1344 : 29 0f __ AND #$0f
1346 : aa __ __ TAX
1347 : bd b0 31 LDA $31b0,x ; (int2hexpetscii + 0)
134a : 8d 5a 05 STA $055a 
134d : 60 __ __ RTS
--------------------------------------------------------------------
time1_menu_change_color:
12c4 : a0 02 __ LDY #$02
12c6 : b1 23 __ LDA (SP + 0),y 
12c8 : ae c3 3b LDX $3bc3 ; (menu + 98)
12cb : 9d 59 d9 STA $d959,x 
12ce : 60 __ __ RTS
--------------------------------------------------------------------
time1_menu_cycle_step:
134e : a9 0b __ LDA #$0b
1350 : ac c3 3b LDY $3bc3 ; (menu + 98)
1353 : 99 59 d9 STA $d959,y 
1356 : ad c2 3b LDA $3bc2 ; (menu + 97)
1359 : d0 21 __ BNE $137c
135b : ad c1 3b LDA $3bc1 ; (menu + 96)
135e : c9 10 __ CMP #$10
1360 : d0 04 __ BNE $1366
1362 : a9 01 __ LDA #$01
1364 : d0 0e __ BNE $1374
1366 : ad c2 3b LDA $3bc2 ; (menu + 97)
1369 : d0 11 __ BNE $137c
136b : ad c1 3b LDA $3bc1 ; (menu + 96)
136e : c9 01 __ CMP #$01
1370 : d0 0a __ BNE $137c
1372 : a9 10 __ LDA #$10
1374 : 8d c1 3b STA $3bc1 ; (menu + 96)
1377 : a9 00 __ LDA #$00
1379 : 8d c2 3b STA $3bc2 ; (menu + 97)
137c : c8 __ __ INY
137d : 98 __ __ TYA
137e : 29 01 __ AND #$01
1380 : 8d c3 3b STA $3bc3 ; (menu + 98)
1383 : aa __ __ TAX
1384 : a9 0f __ LDA #$0f
1386 : 9d 59 d9 STA $d959,x 
1389 : 60 __ __ RTS
--------------------------------------------------------------------
time0_menu_change_value:
138a : a0 02 __ LDY #$02
138c : b1 23 __ LDA (SP + 0),y 
138e : d0 16 __ BNE $13a6
1390 : ad ca 3b LDA $3bca ; (menu + 105)
1393 : 38 __ __ SEC
1394 : ed cc 3b SBC $3bcc ; (menu + 107)
1397 : 8d ca 3b STA $3bca ; (menu + 105)
139a : ad cb 3b LDA $3bcb ; (menu + 106)
139d : ed cd 3b SBC $3bcd ; (menu + 108)
13a0 : 8d cb 3b STA $3bcb ; (menu + 106)
13a3 : 4c bd 13 JMP $13bd ; (time0_menu_change_value + 51)
13a6 : c9 02 __ CMP #$02
13a8 : d0 13 __ BNE $13bd
13aa : ad cc 3b LDA $3bcc ; (menu + 107)
13ad : 18 __ __ CLC
13ae : 6d ca 3b ADC $3bca ; (menu + 105)
13b1 : 8d ca 3b STA $3bca ; (menu + 105)
13b4 : ad cd 3b LDA $3bcd ; (menu + 108)
13b7 : 6d cb 3b ADC $3bcb ; (menu + 106)
13ba : 8d cb 3b STA $3bcb ; (menu + 106)
13bd : ad ca 3b LDA $3bca ; (menu + 105)
13c0 : 4a __ __ LSR
13c1 : 4a __ __ LSR
13c2 : 4a __ __ LSR
13c3 : 4a __ __ LSR
13c4 : aa __ __ TAX
13c5 : bd b0 31 LDA $31b0,x ; (int2hexpetscii + 0)
13c8 : 8d 81 05 STA $0581 
13cb : ad ca 3b LDA $3bca ; (menu + 105)
13ce : 29 0f __ AND #$0f
13d0 : aa __ __ TAX
13d1 : bd b0 31 LDA $31b0,x ; (int2hexpetscii + 0)
13d4 : 8d 82 05 STA $0582 
13d7 : 60 __ __ RTS
--------------------------------------------------------------------
time0_menu_change_color:
12cf : a0 02 __ LDY #$02
12d1 : b1 23 __ LDA (SP + 0),y 
12d3 : ae ce 3b LDX $3bce ; (menu + 109)
12d6 : 9d 81 d9 STA $d981,x 
12d9 : 60 __ __ RTS
--------------------------------------------------------------------
time0_menu_cycle_step:
1400 : a9 0b __ LDA #$0b
1402 : ac ce 3b LDY $3bce ; (menu + 109)
1405 : 99 81 d9 STA $d981,y 
1408 : ad cd 3b LDA $3bcd ; (menu + 108)
140b : d0 21 __ BNE $142e
140d : ad cc 3b LDA $3bcc ; (menu + 107)
1410 : c9 10 __ CMP #$10
1412 : d0 04 __ BNE $1418
1414 : a9 01 __ LDA #$01
1416 : d0 0e __ BNE $1426
1418 : ad cd 3b LDA $3bcd ; (menu + 108)
141b : d0 11 __ BNE $142e
141d : ad cc 3b LDA $3bcc ; (menu + 107)
1420 : c9 01 __ CMP #$01
1422 : d0 0a __ BNE $142e
1424 : a9 10 __ LDA #$10
1426 : 8d cc 3b STA $3bcc ; (menu + 107)
1429 : a9 00 __ LDA #$00
142b : 8d cd 3b STA $3bcd ; (menu + 108)
142e : c8 __ __ INY
142f : 98 __ __ TYA
1430 : 29 01 __ AND #$01
1432 : 8d ce 3b STA $3bce ; (menu + 109)
1435 : aa __ __ TAX
1436 : a9 0f __ LDA #$0f
1438 : 9d 81 d9 STA $d981,x 
143b : 60 __ __ RTS
--------------------------------------------------------------------
edit_window_mainloop:
12da : 20 3c 14 JSR $143c ; (edit_window_show + 0)
12dd : 20 c0 18 JSR $18c0 ; (edit_window_process_joystick_events + 0)
12e0 : 20 c0 1b JSR $1bc0 ; (edit_window_process_keyboard_events + 0)
12e3 : a5 1b __ LDA ACCU + 0 
12e5 : d0 10 __ BNE $12f7
12e7 : 20 7e 1f JSR $1f7e ; (sidfx_loop + 0)
12ea : ad 11 d0 LDA $d011 
12ed : 30 fb __ BMI $12ea
12ef : ad 11 d0 LDA $d011 
12f2 : 10 fb __ BPL $12ef
12f4 : 4c dd 12 JMP $12dd ; (edit_window_mainloop + 3)
12f7 : a9 02 __ LDA #$02
12f9 : 85 0d __ STA P0 
12fb : 4c 0c 22 JMP $220c ; (change_main_scene_to + 0)
--------------------------------------------------------------------
edit_window_show:
143c : a9 0b __ LDA #$0b
143e : 85 0d __ STA P0 
1440 : 20 d8 13 JSR $13d8 ; (clear_screen + 0)
1443 : 20 9b 14 JSR $149b ; (update_menu_selections + 0)
1446 : 20 38 15 JSR $1538 ; (edit_window_fill_buffers_with_values + 0)
1449 : 20 d6 16 JSR $16d6 ; (edit_window_select_default_menu_options + 0)
144c : a9 0b __ LDA #$0b
144e : 85 0f __ STA P2 
1450 : a9 00 __ LDA #$00
1452 : 85 10 __ STA P3 
1454 : a9 10 __ LDA #$10
1456 : 85 11 __ STA P4 
1458 : a9 0a __ LDA #$0a
145a : 85 12 __ STA P5 
145c : a9 00 __ LDA #$00
145e : 85 0d __ STA P0 
1460 : a9 32 __ LDA #$32
1462 : 85 0e __ STA P1 
1464 : 20 2a 18 JSR $182a ; (win_put_at + 0)
1467 : a9 00 __ LDA #$00
1469 : 85 0f __ STA P2 
146b : a9 17 __ LDA #$17
146d : 85 10 __ STA P3 
146f : a9 28 __ LDA #$28
1471 : 85 11 __ STA P4 
1473 : a9 01 __ LDA #$01
1475 : 85 12 __ STA P5 
1477 : a9 a0 __ LDA #$a0
1479 : 85 0d __ STA P0 
147b : a9 32 __ LDA #$32
147d : 85 0e __ STA P1 
147f : 20 2a 18 JSR $182a ; (win_put_at + 0)
1482 : a9 08 __ LDA #$08
1484 : 85 0f __ STA P2 
1486 : 85 12 __ STA P5 
1488 : a9 0c __ LDA #$0c
148a : 85 10 __ STA P3 
148c : a9 19 __ LDA #$19
148e : 85 11 __ STA P4 
1490 : a9 00 __ LDA #$00
1492 : 85 0d __ STA P0 
1494 : a9 34 __ LDA #$34
1496 : 85 0e __ STA P1 
1498 : 4c 2a 18 JMP $182a ; (win_put_at + 0)
--------------------------------------------------------------------
clear_screen:
13d8 : a0 00 __ LDY #$00
13da : a6 0d __ LDX P0 
13dc : a9 20 __ LDA #$20
13de : 99 00 04 STA $0400,y 
13e1 : 8a __ __ TXA
13e2 : 99 00 d8 STA $d800,y 
13e5 : 99 fa d8 STA $d8fa,y 
13e8 : 99 f4 d9 STA $d9f4,y 
13eb : 99 ee da STA $daee,y 
13ee : a9 20 __ LDA #$20
13f0 : 99 fa 04 STA $04fa,y 
13f3 : 99 f4 05 STA $05f4,y 
13f6 : 99 ee 06 STA $06ee,y 
13f9 : c8 __ __ INY
13fa : c0 fa __ CPY #$fa
13fc : 90 de __ BCC $13dc
13fe : 60 __ __ RTS
--------------------------------------------------------------------
update_menu_selections:
149b : ad c5 31 LDA $31c5 ; (SIDFXExplosion + 5)
149e : 85 43 __ STA T0 + 0 
14a0 : ad c6 31 LDA $31c6 ; (SIDFXExplosion + 6)
14a3 : 85 44 __ STA T2 + 0 
14a5 : ad c4 31 LDA $31c4 ; (SIDFXExplosion + 4)
14a8 : 29 f0 __ AND #$f0
14aa : aa __ __ TAX
14ab : a9 00 __ LDA #$00
14ad : 85 45 __ STA T3 + 0 
14af : 8a __ __ TXA
14b0 : a4 45 __ LDY T3 + 0 
14b2 : d9 f7 11 CMP $11f7,y ; (sid_waveforms + 0)
14b5 : f0 77 __ BEQ $152e
14b7 : e6 45 __ INC T3 + 0 
14b9 : a9 03 __ LDA #$03
14bb : c5 45 __ CMP T3 + 0 
14bd : b0 f0 __ BCS $14af
14bf : ad c2 31 LDA $31c2 ; (SIDFXExplosion + 2)
14c2 : 8d 72 3b STA $3b72 ; (menu + 17)
14c5 : ad c3 31 LDA $31c3 ; (SIDFXExplosion + 3)
14c8 : 8d 73 3b STA $3b73 ; (menu + 18)
14cb : a5 43 __ LDA T0 + 0 
14cd : 4a __ __ LSR
14ce : 4a __ __ LSR
14cf : 4a __ __ LSR
14d0 : 4a __ __ LSR
14d1 : 8d 7d 3b STA $3b7d ; (menu + 28)
14d4 : a9 00 __ LDA #$00
14d6 : 8d 7e 3b STA $3b7e ; (menu + 29)
14d9 : a5 43 __ LDA T0 + 0 
14db : 29 0f __ AND #$0f
14dd : 8d 88 3b STA $3b88 ; (menu + 39)
14e0 : a9 00 __ LDA #$00
14e2 : 8d 89 3b STA $3b89 ; (menu + 40)
14e5 : a5 44 __ LDA T2 + 0 
14e7 : 4a __ __ LSR
14e8 : 4a __ __ LSR
14e9 : 4a __ __ LSR
14ea : 4a __ __ LSR
14eb : 8d 93 3b STA $3b93 ; (menu + 50)
14ee : a9 00 __ LDA #$00
14f0 : 8d 94 3b STA $3b94 ; (menu + 51)
14f3 : a5 44 __ LDA T2 + 0 
14f5 : 29 0f __ AND #$0f
14f7 : 8d 9e 3b STA $3b9e ; (menu + 61)
14fa : a9 00 __ LDA #$00
14fc : 8d 9f 3b STA $3b9f ; (menu + 62)
14ff : ad c7 31 LDA $31c7 ; (SIDFXExplosion + 7)
1502 : 8d a9 3b STA $3ba9 ; (menu + 72)
1505 : ad c8 31 LDA $31c8 ; (SIDFXExplosion + 8)
1508 : 8d aa 3b STA $3baa ; (menu + 73)
150b : ad c9 31 LDA $31c9 ; (SIDFXExplosion + 9)
150e : 8d b4 3b STA $3bb4 ; (menu + 83)
1511 : ad ca 31 LDA $31ca ; (SIDFXExplosion + 10)
1514 : 8d b5 3b STA $3bb5 ; (menu + 84)
1517 : ad cb 31 LDA $31cb ; (SIDFXExplosion + 11)
151a : 8d bf 3b STA $3bbf ; (menu + 94)
151d : a9 00 __ LDA #$00
151f : 8d c0 3b STA $3bc0 ; (menu + 95)
1522 : ad cc 31 LDA $31cc ; (SIDFXExplosion + 12)
1525 : 8d ca 3b STA $3bca ; (menu + 105)
1528 : a9 00 __ LDA #$00
152a : 8d cb 3b STA $3bcb ; (menu + 106)
152d : 60 __ __ RTS
152e : 8c 67 3b STY $3b67 ; (menu + 6)
1531 : a9 00 __ LDA #$00
1533 : 8d 68 3b STA $3b68 ; (menu + 7)
1536 : f0 87 __ BEQ $14bf
--------------------------------------------------------------------
SIDFXExplosion:
31c0 : __ __ __ BYT 85 06 00 01 41 00 fa 00 00 00 00 08 08 00       : ....A.........
--------------------------------------------------------------------
sid_waveforms:
11f7 : __ __ __ BYT 10 20 40 80                                     : . @.
--------------------------------------------------------------------
edit_window_fill_buffers_with_values:
1538 : 20 49 16 JSR $1649 ; (edit_window_update_buffer_wave_name + 0)
153b : ad c3 31 LDA $31c3 ; (SIDFXExplosion + 3)
153e : 29 0f __ AND #$0f
1540 : aa __ __ TAX
1541 : bd b0 31 LDA $31b0,x ; (int2hexpetscii + 0)
1544 : 8d 1d 32 STA $321d ; (edit_window_sfx_properties + 29)
1547 : ad c3 31 LDA $31c3 ; (SIDFXExplosion + 3)
154a : 4a __ __ LSR
154b : 85 45 __ STA T1 + 1 
154d : ad c2 31 LDA $31c2 ; (SIDFXExplosion + 2)
1550 : 6a __ __ ROR
1551 : 46 45 __ LSR T1 + 1 
1553 : 6a __ __ ROR
1554 : 4a __ __ LSR
1555 : 4a __ __ LSR
1556 : 29 0f __ AND #$0f
1558 : aa __ __ TAX
1559 : bd b0 31 LDA $31b0,x ; (int2hexpetscii + 0)
155c : 8d 1e 32 STA $321e ; (edit_window_sfx_properties + 30)
155f : ad c2 31 LDA $31c2 ; (SIDFXExplosion + 2)
1562 : 29 0f __ AND #$0f
1564 : aa __ __ TAX
1565 : bd b0 31 LDA $31b0,x ; (int2hexpetscii + 0)
1568 : 8d 1f 32 STA $321f ; (edit_window_sfx_properties + 31)
156b : ad 7d 3b LDA $3b7d ; (menu + 28)
156e : 29 0f __ AND #$0f
1570 : aa __ __ TAX
1571 : bd b0 31 LDA $31b0,x ; (int2hexpetscii + 0)
1574 : 8d 2f 32 STA $322f ; (edit_window_sfx_properties + 47)
1577 : ad 88 3b LDA $3b88 ; (menu + 39)
157a : 29 0f __ AND #$0f
157c : aa __ __ TAX
157d : bd b0 31 LDA $31b0,x ; (int2hexpetscii + 0)
1580 : 8d 3f 32 STA $323f ; (edit_window_sfx_properties + 63)
1583 : ad 93 3b LDA $3b93 ; (menu + 50)
1586 : 29 0f __ AND #$0f
1588 : aa __ __ TAX
1589 : bd b0 31 LDA $31b0,x ; (int2hexpetscii + 0)
158c : 8d 4f 32 STA $324f ; (edit_window_sfx_properties + 79)
158f : ad 9e 3b LDA $3b9e ; (menu + 61)
1592 : 29 0f __ AND #$0f
1594 : aa __ __ TAX
1595 : bd b0 31 LDA $31b0,x ; (int2hexpetscii + 0)
1598 : 8d 5f 32 STA $325f ; (edit_window_sfx_properties + 95)
159b : ad aa 3b LDA $3baa ; (menu + 73)
159e : 4a __ __ LSR
159f : 4a __ __ LSR
15a0 : 4a __ __ LSR
15a1 : 4a __ __ LSR
15a2 : 49 08 __ EOR #$08
15a4 : 38 __ __ SEC
15a5 : e9 08 __ SBC #$08
15a7 : 29 0f __ AND #$0f
15a9 : aa __ __ TAX
15aa : bd b0 31 LDA $31b0,x ; (int2hexpetscii + 0)
15ad : 8d 6c 32 STA $326c ; (edit_window_sfx_properties + 108)
15b0 : ad aa 3b LDA $3baa ; (menu + 73)
15b3 : 29 0f __ AND #$0f
15b5 : aa __ __ TAX
15b6 : bd b0 31 LDA $31b0,x ; (int2hexpetscii + 0)
15b9 : 8d 6d 32 STA $326d ; (edit_window_sfx_properties + 109)
15bc : ad a9 3b LDA $3ba9 ; (menu + 72)
15bf : 85 44 __ STA T1 + 0 
15c1 : ad aa 3b LDA $3baa ; (menu + 73)
15c4 : 4a __ __ LSR
15c5 : 66 44 __ ROR T1 + 0 
15c7 : 4a __ __ LSR
15c8 : a5 44 __ LDA T1 + 0 
15ca : 6a __ __ ROR
15cb : 4a __ __ LSR
15cc : 4a __ __ LSR
15cd : 29 0f __ AND #$0f
15cf : aa __ __ TAX
15d0 : bd b0 31 LDA $31b0,x ; (int2hexpetscii + 0)
15d3 : 8d 6e 32 STA $326e ; (edit_window_sfx_properties + 110)
15d6 : ad a9 3b LDA $3ba9 ; (menu + 72)
15d9 : 29 0f __ AND #$0f
15db : aa __ __ TAX
15dc : bd b0 31 LDA $31b0,x ; (int2hexpetscii + 0)
15df : 8d 6f 32 STA $326f ; (edit_window_sfx_properties + 111)
15e2 : ad b5 3b LDA $3bb5 ; (menu + 84)
15e5 : 29 0f __ AND #$0f
15e7 : aa __ __ TAX
15e8 : bd b0 31 LDA $31b0,x ; (int2hexpetscii + 0)
15eb : 8d 7d 32 STA $327d ; (edit_window_sfx_properties + 125)
15ee : ad b4 3b LDA $3bb4 ; (menu + 83)
15f1 : 85 44 __ STA T1 + 0 
15f3 : ad b5 3b LDA $3bb5 ; (menu + 84)
15f6 : 4a __ __ LSR
15f7 : 66 44 __ ROR T1 + 0 
15f9 : 4a __ __ LSR
15fa : a5 44 __ LDA T1 + 0 
15fc : 6a __ __ ROR
15fd : 4a __ __ LSR
15fe : 4a __ __ LSR
15ff : 29 0f __ AND #$0f
1601 : aa __ __ TAX
1602 : bd b0 31 LDA $31b0,x ; (int2hexpetscii + 0)
1605 : 8d 7e 32 STA $327e ; (edit_window_sfx_properties + 126)
1608 : ad b4 3b LDA $3bb4 ; (menu + 83)
160b : 29 0f __ AND #$0f
160d : aa __ __ TAX
160e : bd b0 31 LDA $31b0,x ; (int2hexpetscii + 0)
1611 : 8d 7f 32 STA $327f ; (edit_window_sfx_properties + 127)
1614 : ad bf 3b LDA $3bbf ; (menu + 94)
1617 : 4a __ __ LSR
1618 : 4a __ __ LSR
1619 : 4a __ __ LSR
161a : 4a __ __ LSR
161b : aa __ __ TAX
161c : bd b0 31 LDA $31b0,x ; (int2hexpetscii + 0)
161f : 8d 8e 32 STA $328e ; (edit_window_sfx_properties + 142)
1622 : ad bf 3b LDA $3bbf ; (menu + 94)
1625 : 29 0f __ AND #$0f
1627 : aa __ __ TAX
1628 : bd b0 31 LDA $31b0,x ; (int2hexpetscii + 0)
162b : 8d 8f 32 STA $328f ; (edit_window_sfx_properties + 143)
162e : ad ca 3b LDA $3bca ; (menu + 105)
1631 : 4a __ __ LSR
1632 : 4a __ __ LSR
1633 : 4a __ __ LSR
1634 : 4a __ __ LSR
1635 : aa __ __ TAX
1636 : bd b0 31 LDA $31b0,x ; (int2hexpetscii + 0)
1639 : 8d 9e 32 STA $329e ; (edit_window_sfx_properties + 158)
163c : ad ca 3b LDA $3bca ; (menu + 105)
163f : 29 0f __ AND #$0f
1641 : aa __ __ TAX
1642 : bd b0 31 LDA $31b0,x ; (int2hexpetscii + 0)
1645 : 8d 9f 32 STA $329f ; (edit_window_sfx_properties + 159)
1648 : 60 __ __ RTS
--------------------------------------------------------------------
edit_window_update_buffer_wave_name:
1649 : ad 67 3b LDA $3b67 ; (menu + 6)
164c : 85 43 __ STA T0 + 0 
164e : 0d 68 3b ORA $3b68 ; (menu + 7)
1651 : d0 12 __ BNE $1665
1653 : a9 20 __ LDA #$20
1655 : 85 0d __ STA P0 
1657 : 85 0e __ STA P1 
1659 : a9 14 __ LDA #$14
165b : 85 0f __ STA P2 
165d : a9 12 __ LDA #$12
165f : 85 10 __ STA P3 
1661 : a9 09 __ LDA #$09
1663 : d0 52 __ BNE $16b7
1665 : ad 68 3b LDA $3b68 ; (menu + 7)
1668 : d0 3a __ BNE $16a4
166a : a5 43 __ LDA T0 + 0 
166c : c9 01 __ CMP #$01
166e : d0 12 __ BNE $1682
1670 : a9 20 __ LDA #$20
1672 : 85 0d __ STA P0 
1674 : 85 0e __ STA P1 
1676 : a9 13 __ LDA #$13
1678 : 85 0f __ STA P2 
167a : a9 01 __ LDA #$01
167c : 85 10 __ STA P3 
167e : a9 17 __ LDA #$17
1680 : d0 35 __ BNE $16b7
1682 : ad 68 3b LDA $3b68 ; (menu + 7)
1685 : d0 1d __ BNE $16a4
1687 : a5 43 __ LDA T0 + 0 
1689 : c9 02 __ CMP #$02
168b : d0 0c __ BNE $1699
168d : a9 10 __ LDA #$10
168f : 85 0d __ STA P0 
1691 : a9 15 __ LDA #$15
1693 : 85 0e __ STA P1 
1695 : a9 0c __ LDA #$0c
1697 : d0 16 __ BNE $16af
1699 : ad 68 3b LDA $3b68 ; (menu + 7)
169c : d0 06 __ BNE $16a4
169e : a5 43 __ LDA T0 + 0 
16a0 : c9 03 __ CMP #$03
16a2 : f0 01 __ BEQ $16a5
16a4 : 60 __ __ RTS
16a5 : a9 0e __ LDA #$0e
16a7 : 85 0d __ STA P0 
16a9 : a9 0f __ LDA #$0f
16ab : 85 0e __ STA P1 
16ad : a9 09 __ LDA #$09
16af : 85 0f __ STA P2 
16b1 : a9 13 __ LDA #$13
16b3 : 85 10 __ STA P3 
16b5 : a9 05 __ LDA #$05
16b7 : 85 11 __ STA P4 
16b9 : 4c bc 16 JMP $16bc ; (edit_window_fill_wave_name + 0)
--------------------------------------------------------------------
edit_window_fill_wave_name:
16bc : a5 0d __ LDA P0 
16be : 8d 0b 32 STA $320b ; (edit_window_sfx_properties + 11)
16c1 : a5 0e __ LDA P1 
16c3 : 8d 0c 32 STA $320c ; (edit_window_sfx_properties + 12)
16c6 : a5 0f __ LDA P2 
16c8 : 8d 0d 32 STA $320d ; (edit_window_sfx_properties + 13)
16cb : a5 10 __ LDA P3 
16cd : 8d 0e 32 STA $320e ; (edit_window_sfx_properties + 14)
16d0 : a5 11 __ LDA P4 
16d2 : 8d 0f 32 STA $320f ; (edit_window_sfx_properties + 15)
16d5 : 60 __ __ RTS
--------------------------------------------------------------------
edit_window_sfx_properties:
3200 : __ __ __ BYT 17 01 16 05 06 0f 12 0d 20 3a 20 10 15 0c 13 05 : ........ : .....
3210 : __ __ __ BYT 10 17 0d 20 20 20 20 20 20 3a 20 20 20 30 38 30 : ...      :   080
3220 : __ __ __ BYT 01 14 14 01 03 0b 20 20 20 3a 20 20 20 20 20 30 : ......   :     0
3230 : __ __ __ BYT 04 05 03 01 19 20 20 20 20 3a 20 20 20 20 20 06 : .....    :     .
3240 : __ __ __ BYT 13 15 13 14 01 09 0e 20 20 3a 20 20 20 20 20 30 : .......  :     0
3250 : __ __ __ BYT 12 05 0c 05 01 13 05 20 20 3a 20 20 20 20 20 30 : .......  :     0
3260 : __ __ __ BYT 04 06 12 05 11 20 20 20 20 3a 20 20 20 20 35 30 : .....    :    50
3270 : __ __ __ BYT 04 10 17 0d 20 20 20 20 20 3a 20 20 20 20 35 30 : ....     :    50
3280 : __ __ __ BYT 14 09 0d 05 31 20 20 20 20 3a 20 20 20 20 06 38 : ....1    :    .8
3290 : __ __ __ BYT 14 09 0d 05 30 20 20 20 20 3a 20 20 20 20 20 38 : ....0    :     8
--------------------------------------------------------------------
edit_window_select_default_menu_options:
16d6 : 38 __ __ SEC
16d7 : a5 23 __ LDA SP + 0 
16d9 : e9 03 __ SBC #$03
16db : 85 23 __ STA SP + 0 
16dd : b0 02 __ BCS $16e1
16df : c6 24 __ DEC SP + 1 
16e1 : a9 08 __ LDA #$08
16e3 : a0 02 __ LDY #$02
16e5 : 91 23 __ STA (SP + 0),y 
16e7 : 20 00 0d JSR $0d00 ; (waveform_menu_change_option + 0)
16ea : ad cf 3b LDA $3bcf ; (menu + 110)
16ed : d0 09 __ BNE $16f8
16ef : a9 0f __ LDA #$0f
16f1 : a0 02 __ LDY #$02
16f3 : 91 23 __ STA (SP + 0),y 
16f5 : 20 00 0e JSR $0e00 ; (waveform_menu_change_color + 0)
16f8 : ad 68 3b LDA $3b68 ; (menu + 7)
16fb : d0 07 __ BNE $1704
16fd : ad 67 3b LDA $3b67 ; (menu + 6)
1700 : c9 02 __ CMP #$02
1702 : f0 22 __ BEQ $1726
1704 : a0 00 __ LDY #$00
1706 : 98 __ __ TYA
1707 : 99 33 d8 STA $d833,y 
170a : c8 __ __ INY
170b : c0 1c __ CPY #$1c
170d : 90 f8 __ BCC $1707
170f : a8 __ __ TAY
1710 : 99 23 d9 STA $d923,y 
1713 : c8 __ __ INY
1714 : c0 1c __ CPY #$1c
1716 : 90 f8 __ BCC $1710
1718 : ad cf 3b LDA $3bcf ; (menu + 110)
171b : c9 01 __ CMP #$01
171d : f0 04 __ BEQ $1723
171f : c9 07 __ CMP #$07
1721 : d0 03 __ BNE $1726
1723 : ee cf 3b INC $3bcf ; (menu + 110)
1726 : ad cf 3b LDA $3bcf ; (menu + 110)
1729 : 85 44 __ STA T1 + 0 
172b : 0a __ __ ASL
172c : 85 07 __ STA WORK + 4 
172e : a9 00 __ LDA #$00
1730 : 2a __ __ ROL
1731 : 06 07 __ ASL WORK + 4 
1733 : 2a __ __ ROL
1734 : aa __ __ TAX
1735 : a5 07 __ LDA WORK + 4 
1737 : 6d cf 3b ADC $3bcf ; (menu + 110)
173a : 85 46 __ STA T2 + 0 
173c : 8a __ __ TXA
173d : 69 00 __ ADC #$00
173f : 06 46 __ ASL T2 + 0 
1741 : 2a __ __ ROL
1742 : 06 46 __ ASL T2 + 0 
1744 : 2a __ __ ROL
1745 : 06 46 __ ASL T2 + 0 
1747 : 2a __ __ ROL
1748 : aa __ __ TAX
1749 : 18 __ __ CLC
174a : a9 0b __ LDA #$0b
174c : 65 46 __ ADC T2 + 0 
174e : 85 46 __ STA T2 + 0 
1750 : 8a __ __ TXA
1751 : 69 d8 __ ADC #$d8
1753 : 85 47 __ STA T2 + 1 
1755 : a0 00 __ LDY #$00
1757 : a9 0f __ LDA #$0f
1759 : 91 46 __ STA (T2 + 0),y 
175b : c8 __ __ INY
175c : c0 09 __ CPY #$09
175e : 90 f9 __ BCC $1759
1760 : a0 02 __ LDY #$02
1762 : 91 23 __ STA (SP + 0),y 
1764 : a6 44 __ LDX T1 + 0 
1766 : bc 76 31 LDY $3176,x ; (__multab11L + 0)
1769 : b9 63 3b LDA $3b63,y ; (menu + 2)
176c : 85 1b __ STA ACCU + 0 
176e : b9 64 3b LDA $3b64,y ; (menu + 3)
1771 : 85 1c __ STA ACCU + 1 
1773 : 20 fd 0f JSR $0ffd ; (bcexec + 0)
1776 : ad c0 31 LDA $31c0 ; (SIDFXExplosion + 0)
1779 : 85 0d __ STA P0 
177b : ad c1 31 LDA $31c1 ; (SIDFXExplosion + 1)
177e : 85 0e __ STA P1 
1780 : 20 09 18 JSR $1809 ; (find_note + 0)
1783 : a5 1b __ LDA ACCU + 0 
1785 : 85 44 __ STA T1 + 0 
1787 : a9 00 __ LDA #$00
1789 : 85 1c __ STA ACCU + 1 
178b : 85 04 __ STA WORK + 1 
178d : a9 0c __ LDA #$0c
178f : 85 03 __ STA WORK + 0 
1791 : 20 f1 30 JSR $30f1 ; (divmod + 0)
1794 : a5 05 __ LDA WORK + 2 
1796 : 8d fd 11 STA $11fd ; (note + 0)
1799 : a5 06 __ LDA WORK + 3 
179b : 8d fe 11 STA $11fe ; (note + 1)
179e : a5 44 __ LDA T1 + 0 
17a0 : 85 1b __ STA ACCU + 0 
17a2 : a9 00 __ LDA #$00
17a4 : 85 1c __ STA ACCU + 1 
17a6 : 85 04 __ STA WORK + 1 
17a8 : a9 0c __ LDA #$0c
17aa : 85 03 __ STA WORK + 0 
17ac : 20 f1 30 JSR $30f1 ; (divmod + 0)
17af : a6 1b __ LDX ACCU + 0 
17b1 : bd b0 31 LDA $31b0,x ; (int2hexpetscii + 0)
17b4 : 8d 07 34 STA $3407 ; (edit_window_piano + 7)
17b7 : bd f8 2b LDA $2bf8,x ; (octaves_color_positions + 0)
17ba : 8d fe 12 STA $12fe ; (prev_octave_position + 0)
17bd : a9 00 __ LDA #$00
17bf : 8d ff 12 STA $12ff ; (prev_octave_position + 1)
17c2 : ae fd 11 LDX $11fd ; (note + 0)
17c5 : bd ce 31 LDA $31ce,x ; (piano_notes_color_positions + 0)
17c8 : 8d da 31 STA $31da ; (prev_note_position + 0)
17cb : a9 00 __ LDA #$00
17cd : 8d db 31 STA $31db ; (prev_note_position + 1)
17d0 : a9 0f __ LDA #$0f
17d2 : ae fe 12 LDX $12fe ; (prev_octave_position + 0)
17d5 : 9d f8 d9 STA $d9f8,x 
17d8 : ae da 31 LDX $31da ; (prev_note_position + 0)
17db : 9d 39 da STA $da39,x 
17de : a5 1b __ LDA ACCU + 0 
17e0 : 0a __ __ ASL
17e1 : aa __ __ TAX
17e2 : a5 1c __ LDA ACCU + 1 
17e4 : 2a __ __ ROL
17e5 : a8 __ __ TAY
17e6 : 8a __ __ TXA
17e7 : 18 __ __ CLC
17e8 : 65 1b __ ADC ACCU + 0 
17ea : 85 44 __ STA T1 + 0 
17ec : 98 __ __ TYA
17ed : 65 1c __ ADC ACCU + 1 
17ef : 06 44 __ ASL T1 + 0 
17f1 : 2a __ __ ROL
17f2 : 06 44 __ ASL T1 + 0 
17f4 : 2a __ __ ROL
17f5 : 8d fc 11 STA $11fc ; (octave + 1)
17f8 : a5 44 __ LDA T1 + 0 
17fa : 8d fb 11 STA $11fb ; (octave + 0)
17fd : 18 __ __ CLC
17fe : a5 23 __ LDA SP + 0 
1800 : 69 03 __ ADC #$03
1802 : 85 23 __ STA SP + 0 
1804 : 90 02 __ BCC $1808
1806 : e6 24 __ INC SP + 1 
1808 : 60 __ __ RTS
--------------------------------------------------------------------
find_note:
1809 : a2 00 __ LDX #$00
180b : 8a __ __ TXA
180c : 0a __ __ ASL
180d : a8 __ __ TAY
180e : b9 01 33 LDA $3301,y ; (notes_pal_table + 1)
1811 : c5 0e __ CMP P1 
1813 : d0 07 __ BNE $181c
1815 : b9 00 33 LDA $3300,y ; (notes_pal_table + 0)
1818 : c5 0d __ CMP P0 
181a : f0 0a __ BEQ $1826
181c : e8 __ __ INX
181d : e0 60 __ CPX #$60
181f : 90 ea __ BCC $180b
1821 : a9 00 __ LDA #$00
1823 : 85 1b __ STA ACCU + 0 
1825 : 60 __ __ RTS
1826 : 8a __ __ TXA
1827 : 4c 23 18 JMP $1823 ; (find_note + 26)
--------------------------------------------------------------------
notes_pal_table:
3300 : __ __ __ BYT 17 01 27 01 39 01 4b 01 5f 01 74 01 8a 01 a1 01 : ..'.9.K._.t.....
3310 : __ __ __ BYT ba 01 d4 01 f0 01 0e 02 2d 02 4e 02 71 02 96 02 : ........-.N.q...
3320 : __ __ __ BYT be 02 e8 02 14 03 43 03 74 03 a9 03 e1 03 1c 04 : ......C.t.......
3330 : __ __ __ BYT 5a 04 9c 04 e2 04 2d 05 7c 05 cf 05 28 06 85 06 : Z.....-.|...(...
3340 : __ __ __ BYT e8 06 52 07 c1 07 37 08 b4 08 39 09 c5 09 5a 0a : ..R...7...9...Z.
3350 : __ __ __ BYT f7 0a 9e 0b 4f 0c 0a 0d d1 0d a3 0e 82 0f 6e 10 : ....O.........n.
3360 : __ __ __ BYT 68 11 71 12 8a 13 b3 14 ee 15 3c 17 9e 18 15 1a : h.q.......<.....
3370 : __ __ __ BYT a2 1b 46 1d 04 1f dc 20 d0 22 e2 24 14 27 67 29 : ..F.... .".$.'g)
3380 : __ __ __ BYT dd 2b 79 2e 3c 31 29 34 44 37 8d 3a 08 3e b8 41 : .+y.<1)4D7.:.>.A
3390 : __ __ __ BYT a1 45 c5 49 28 4e cd 52 ba 57 f1 5c 78 62 53 68 : .E.I(N.R.W.\xbSh
33a0 : __ __ __ BYT 87 6e 1a 75 10 7c 71 83 42 8b 89 93 4f 9c 9b a5 : .n.u.|q.B...O...
33b0 : __ __ __ BYT 74 af e2 b9 f0 c4 a6 d0 0e dd 33 ea 20 f8 ff ff : t.........3. ...
--------------------------------------------------------------------
octave:
11fb : __ __ __ BYT 02 00                                           : ..
--------------------------------------------------------------------
note:
11fd : __ __ __ BYT 07 00                                           : ..
--------------------------------------------------------------------
edit_window_piano:
3400 : __ __ __ BYT 0f 03 14 01 16 05 20 32 20 20 20 20 20 20 20 1b : ...... 2       .
3410 : __ __ __ BYT 01 13 04 06 07 08 0a 0b 1d 70 72 40 72 40 72 72 : .........pr@r@rr
3420 : __ __ __ BYT 72 40 72 40 72 40 72 72 72 40 72 40 72 72 72 40 : r@r@r@rrr@r@rrr@
3430 : __ __ __ BYT 72 6e 5d 5d 20 5d 20 5d 5d 5d 20 5d 20 5d 20 5d : rn]] ] ]]] ] ] ]
3440 : __ __ __ BYT 5d 5d 20 5d 20 5d 5d 5d 20 5d 5d 5d 5d 32 5d 33 : ]] ] ]]] ]]]]2]3
3450 : __ __ __ BYT 5d 5d 5d 35 5d 36 5d 37 5d 5d 5d 39 5d 30 5d 5d : ]]]5]6]7]]]9]0]]
3460 : __ __ __ BYT 5d 2d 5d 5d 5d 6d 72 71 72 7d 5d 6d 72 71 72 71 : ]-]]]mrqr}]mrqrq
3470 : __ __ __ BYT 72 7d 5d 6d 72 71 72 7d 5d 6d 72 7d 5d 5d 20 5d : r}]mrqr}]mr}]] ]
3480 : __ __ __ BYT 20 5d 20 5d 20 5d 20 5d 20 5d 20 5d 20 5d 20 5d :  ] ] ] ] ] ] ] ]
3490 : __ __ __ BYT 20 5d 20 5d 20 5d 5d 11 5d 17 5d 05 5d 12 5d 14 :  ] ] ]].].].].].
34a0 : __ __ __ BYT 5d 19 5d 15 5d 09 5d 0f 5d 10 5d 00 5d 2a 5d 6d : ].].].].].].]*]m
34b0 : __ __ __ BYT 40 71 40 71 40 71 40 71 40 71 40 71 40 71 40 71 : @q@q@q@q@q@q@q@q
34c0 : __ __ __ BYT 40 71 40 71 40 71 40 7d                         : @q@q@q@}
--------------------------------------------------------------------
octaves_color_positions:
2bf8 : __ __ __ BYT 00 01 02 03 04 05 06 07                         : ........
--------------------------------------------------------------------
prev_octave_position:
12fe : __ __ __ BYT 02 00                                           : ..
--------------------------------------------------------------------
piano_notes_color_positions:
31ce : __ __ __ BYT a0 29 a2 2b a4 a6 2f a8 31 aa 33 ac             : .).+../.1.3.
--------------------------------------------------------------------
prev_note_position:
31da : __ __ __ BYT a8 00                                           : ..
--------------------------------------------------------------------
win_put_at:
182a : a5 12 __ LDA P5 
182c : d0 03 __ BNE $1831
182e : 4c bf 18 JMP $18bf ; (win_put_at + 149)
1831 : a5 10 __ LDA P3 
1833 : 0a __ __ ASL
1834 : 85 07 __ STA WORK + 4 
1836 : a9 00 __ LDA #$00
1838 : 2a __ __ ROL
1839 : 06 07 __ ASL WORK + 4 
183b : 2a __ __ ROL
183c : aa __ __ TAX
183d : a5 07 __ LDA WORK + 4 
183f : 65 10 __ ADC P3 
1841 : 85 43 __ STA T1 + 0 
1843 : 8a __ __ TXA
1844 : 69 00 __ ADC #$00
1846 : 06 43 __ ASL T1 + 0 
1848 : 2a __ __ ROL
1849 : 06 43 __ ASL T1 + 0 
184b : 2a __ __ ROL
184c : 06 43 __ ASL T1 + 0 
184e : 2a __ __ ROL
184f : aa __ __ TAX
1850 : 18 __ __ CLC
1851 : a5 0f __ LDA P2 
1853 : 65 43 __ ADC T1 + 0 
1855 : 85 43 __ STA T1 + 0 
1857 : 90 01 __ BCC $185a
1859 : e8 __ __ INX
185a : 86 44 __ STX T1 + 1 
185c : a9 00 __ LDA #$00
185e : 85 45 __ STA T2 + 0 
1860 : 85 46 __ STA T2 + 1 
1862 : 85 47 __ STA T3 + 0 
1864 : a5 11 __ LDA P4 
1866 : d0 22 __ BNE $188a
1868 : 38 __ __ SEC
1869 : a9 28 __ LDA #$28
186b : e5 11 __ SBC P4 
186d : aa __ __ TAX
186e : a9 00 __ LDA #$00
1870 : e9 00 __ SBC #$00
1872 : a8 __ __ TAY
1873 : 8a __ __ TXA
1874 : 18 __ __ CLC
1875 : 65 43 __ ADC T1 + 0 
1877 : 85 43 __ STA T1 + 0 
1879 : 98 __ __ TYA
187a : 65 44 __ ADC T1 + 1 
187c : 85 44 __ STA T1 + 1 
187e : e6 47 __ INC T3 + 0 
1880 : a5 47 __ LDA T3 + 0 
1882 : c5 12 __ CMP P5 
1884 : b0 39 __ BCS $18bf
1886 : a5 11 __ LDA P4 
1888 : f0 de __ BEQ $1868
188a : aa __ __ TAX
188b : a0 00 __ LDY #$00
188d : 18 __ __ CLC
188e : a5 0d __ LDA P0 
1890 : 65 45 __ ADC T2 + 0 
1892 : 85 49 __ STA T8 + 0 
1894 : a5 0e __ LDA P1 
1896 : 65 46 __ ADC T2 + 1 
1898 : 85 4a __ STA T8 + 1 
189a : b1 49 __ LDA (T8 + 0),y 
189c : 85 48 __ STA T4 + 0 
189e : a5 43 __ LDA T1 + 0 
18a0 : 85 49 __ STA T8 + 0 
18a2 : 18 __ __ CLC
18a3 : a9 04 __ LDA #$04
18a5 : 65 44 __ ADC T1 + 1 
18a7 : 85 4a __ STA T8 + 1 
18a9 : a5 48 __ LDA T4 + 0 
18ab : 91 49 __ STA (T8 + 0),y 
18ad : e6 43 __ INC T1 + 0 
18af : d0 02 __ BNE $18b3
18b1 : e6 44 __ INC T1 + 1 
18b3 : e6 45 __ INC T2 + 0 
18b5 : d0 02 __ BNE $18b9
18b7 : e6 46 __ INC T2 + 1 
18b9 : ca __ __ DEX
18ba : d0 d1 __ BNE $188d
18bc : 4c 68 18 JMP $1868 ; (win_put_at + 62)
18bf : 60 __ __ RTS
--------------------------------------------------------------------
edit_window_info_bar:
32a0 : __ __ __ BYT 20 20 20 20 20 20 20 20 20 20 20 20 1b 20 13 10 :             . ..
32b0 : __ __ __ BYT 01 03 05 20 2d 20 02 01 03 0b 20 1d 20 20 20 20 : ... - .... .    
32c0 : __ __ __ BYT 20 20 20 20 20 20 20 20                         :         
--------------------------------------------------------------------
edit_window_process_joystick_events:
18c0 : 38 __ __ SEC
18c1 : a5 23 __ LDA SP + 0 
18c3 : e9 03 __ SBC #$03
18c5 : 85 23 __ STA SP + 0 
18c7 : b0 02 __ BCS $18cb
18c9 : c6 24 __ DEC SP + 1 
18cb : a9 00 __ LDA #$00
18cd : 85 0d __ STA P0 
18cf : 20 90 19 JSR $1990 ; (joy_poll + 0)
18d2 : ad f6 31 LDA $31f6 ; (joyy + 0)
18d5 : 29 80 __ AND #$80
18d7 : 10 02 __ BPL $18db
18d9 : a9 ff __ LDA #$ff
18db : cd dd 31 CMP $31dd ; (prevy + 1)
18de : d0 08 __ BNE $18e8
18e0 : ad f6 31 LDA $31f6 ; (joyy + 0)
18e3 : cd dc 31 CMP $31dc ; (prevy + 0)
18e6 : f0 1b __ BEQ $1903
18e8 : ad f6 31 LDA $31f6 ; (joyy + 0)
18eb : f0 07 __ BEQ $18f4
18ed : a0 02 __ LDY #$02
18ef : 91 23 __ STA (SP + 0),y 
18f1 : 20 d2 19 JSR $19d2 ; (update_vertical_menu + 0)
18f4 : ad f6 31 LDA $31f6 ; (joyy + 0)
18f7 : 8d dc 31 STA $31dc ; (prevy + 0)
18fa : 29 80 __ AND #$80
18fc : 10 02 __ BPL $1900
18fe : a9 ff __ LDA #$ff
1900 : 8d dd 31 STA $31dd ; (prevy + 1)
1903 : ad f8 31 LDA $31f8 ; (joyx + 0)
1906 : 29 80 __ AND #$80
1908 : 10 02 __ BPL $190c
190a : a9 ff __ LDA #$ff
190c : cd df 31 CMP $31df ; (prevx + 1)
190f : d0 08 __ BNE $1919
1911 : ad f8 31 LDA $31f8 ; (joyx + 0)
1914 : cd de 31 CMP $31de ; (prevx + 0)
1917 : f0 1e __ BEQ $1937
1919 : ad f8 31 LDA $31f8 ; (joyx + 0)
191c : f0 0a __ BEQ $1928
191e : 18 __ __ CLC
191f : 69 01 __ ADC #$01
1921 : a0 02 __ LDY #$02
1923 : 91 23 __ STA (SP + 0),y 
1925 : 20 07 1b JSR $1b07 ; (update_horizontal_menu + 0)
1928 : ad f8 31 LDA $31f8 ; (joyx + 0)
192b : 8d de 31 STA $31de ; (prevx + 0)
192e : 29 80 __ AND #$80
1930 : 10 02 __ BPL $1934
1932 : a9 ff __ LDA #$ff
1934 : 8d df 31 STA $31df ; (prevx + 1)
1937 : ad e1 31 LDA $31e1 ; (prevb + 1)
193a : d0 08 __ BNE $1944
193c : ad fa 31 LDA $31fa ; (joyb + 0)
193f : cd e0 31 CMP $31e0 ; (prevb + 0)
1942 : f0 40 __ BEQ $1984
1944 : ad fa 31 LDA $31fa ; (joyb + 0)
1947 : c9 01 __ CMP #$01
1949 : d0 2e __ BNE $1979
194b : ad c5 33 LDA $33c5 ; (channels + 5)
194e : d0 04 __ BNE $1954
1950 : a2 03 __ LDX #$03
1952 : d0 0a __ BNE $195e
1954 : ad cd 31 LDA $31cd ; (SIDFXExplosion + 13)
1957 : cd c4 33 CMP $33c4 ; (channels + 4)
195a : 90 1d __ BCC $1979
195c : a2 01 __ LDX #$01
195e : a9 00 __ LDA #$00
1960 : 8d c5 33 STA $33c5 ; (channels + 5)
1963 : 8d c3 33 STA $33c3 ; (channels + 3)
1966 : a9 c0 __ LDA #$c0
1968 : 8d c0 33 STA $33c0 ; (channels + 0)
196b : a9 31 __ LDA #$31
196d : 8d c1 33 STA $33c1 ; (channels + 1)
1970 : ad cd 31 LDA $31cd ; (SIDFXExplosion + 13)
1973 : 8d c4 33 STA $33c4 ; (channels + 4)
1976 : 8e c5 33 STX $33c5 ; (channels + 5)
1979 : ad fa 31 LDA $31fa ; (joyb + 0)
197c : 8d e0 31 STA $31e0 ; (prevb + 0)
197f : a9 00 __ LDA #$00
1981 : 8d e1 31 STA $31e1 ; (prevb + 1)
1984 : 18 __ __ CLC
1985 : a5 23 __ LDA SP + 0 
1987 : 69 03 __ ADC #$03
1989 : 85 23 __ STA SP + 0 
198b : 90 02 __ BCC $198f
198d : e6 24 __ INC SP + 1 
198f : 60 __ __ RTS
--------------------------------------------------------------------
joy_poll:
1990 : a4 0d __ LDY P0 
1992 : b9 00 dc LDA $dc00,y 
1995 : aa __ __ TAX
1996 : 29 10 __ AND #$10
1998 : d0 04 __ BNE $199e
199a : a9 01 __ LDA #$01
199c : d0 02 __ BNE $19a0
199e : a9 00 __ LDA #$00
19a0 : 99 fa 31 STA $31fa,y ; (joyb + 0)
19a3 : 8a __ __ TXA
19a4 : 29 01 __ AND #$01
19a6 : d0 1d __ BNE $19c5
19a8 : a9 ff __ LDA #$ff
19aa : 99 f6 31 STA $31f6,y ; (joyy + 0)
19ad : 8a __ __ TXA
19ae : 29 04 __ AND #$04
19b0 : d0 06 __ BNE $19b8
19b2 : a9 ff __ LDA #$ff
19b4 : 99 f8 31 STA $31f8,y ; (joyx + 0)
19b7 : 60 __ __ RTS
19b8 : 8a __ __ TXA
19b9 : 29 08 __ AND #$08
19bb : d0 04 __ BNE $19c1
19bd : a9 01 __ LDA #$01
19bf : d0 f3 __ BNE $19b4
19c1 : a9 00 __ LDA #$00
19c3 : f0 ef __ BEQ $19b4
19c5 : 8a __ __ TXA
19c6 : 29 02 __ AND #$02
19c8 : d0 04 __ BNE $19ce
19ca : a9 01 __ LDA #$01
19cc : d0 dc __ BNE $19aa
19ce : a9 00 __ LDA #$00
19d0 : f0 d8 __ BEQ $19aa
--------------------------------------------------------------------
joyy:
31f6 : __ __ __ BSS	2
--------------------------------------------------------------------
joyx:
31f8 : __ __ __ BSS	2
--------------------------------------------------------------------
joyb:
31fa : __ __ __ BSS	2
--------------------------------------------------------------------
prevy:
31dc : __ __ __ BYT 00 00                                           : ..
--------------------------------------------------------------------
update_vertical_menu:
19d2 : 38 __ __ SEC
19d3 : a5 23 __ LDA SP + 0 
19d5 : e9 05 __ SBC #$05
19d7 : 85 23 __ STA SP + 0 
19d9 : b0 02 __ BCS $19dd
19db : c6 24 __ DEC SP + 1 
19dd : a0 03 __ LDY #$03
19df : a5 53 __ LDA T3 + 0 
19e1 : 91 23 __ STA (SP + 0),y 
19e3 : a0 07 __ LDY #$07
19e5 : b1 23 __ LDA (SP + 0),y 
19e7 : 18 __ __ CLC
19e8 : 6d cf 3b ADC $3bcf ; (menu + 110)
19eb : 85 44 __ STA T1 + 0 
19ed : 85 53 __ STA T3 + 0 
19ef : c9 01 __ CMP #$01
19f1 : f0 04 __ BEQ $19f7
19f3 : c9 07 __ CMP #$07
19f5 : d0 47 __ BNE $1a3e
19f7 : ad 68 3b LDA $3b68 ; (menu + 7)
19fa : d0 07 __ BNE $1a03
19fc : ad 67 3b LDA $3b67 ; (menu + 6)
19ff : c9 02 __ CMP #$02
1a01 : f0 3b __ BEQ $1a3e
1a03 : 18 __ __ CLC
1a04 : a5 44 __ LDA T1 + 0 
1a06 : 71 23 __ ADC (SP + 0),y 
1a08 : 85 53 __ STA T3 + 0 
1a0a : c9 0a __ CMP #$0a
1a0c : d0 06 __ BNE $1a14
1a0e : a9 00 __ LDA #$00
1a10 : 85 53 __ STA T3 + 0 
1a12 : f0 0a __ BEQ $1a1e
1a14 : a9 0a __ LDA #$0a
1a16 : c5 53 __ CMP T3 + 0 
1a18 : b0 04 __ BCS $1a1e
1a1a : a9 09 __ LDA #$09
1a1c : 85 53 __ STA T3 + 0 
1a1e : a5 53 __ LDA T3 + 0 
1a20 : a0 02 __ LDY #$02
1a22 : 91 23 __ STA (SP + 0),y 
1a24 : 20 47 1a JSR $1a47 ; (select_option + 0)
1a27 : a5 53 __ LDA T3 + 0 
1a29 : 8d cf 3b STA $3bcf ; (menu + 110)
1a2c : a0 03 __ LDY #$03
1a2e : b1 23 __ LDA (SP + 0),y 
1a30 : 85 53 __ STA T3 + 0 
1a32 : 18 __ __ CLC
1a33 : a5 23 __ LDA SP + 0 
1a35 : 69 05 __ ADC #$05
1a37 : 85 23 __ STA SP + 0 
1a39 : 90 02 __ BCC $1a3d
1a3b : e6 24 __ INC SP + 1 
1a3d : 60 __ __ RTS
1a3e : a5 44 __ LDA T1 + 0 
1a40 : c9 0a __ CMP #$0a
1a42 : d0 d0 __ BNE $1a14
1a44 : 4c 0e 1a JMP $1a0e ; (update_vertical_menu + 60)
--------------------------------------------------------------------
select_option:
1a47 : 38 __ __ SEC
1a48 : a5 23 __ LDA SP + 0 
1a4a : e9 05 __ SBC #$05
1a4c : 85 23 __ STA SP + 0 
1a4e : b0 02 __ BCS $1a52
1a50 : c6 24 __ DEC SP + 1 
1a52 : a0 03 __ LDY #$03
1a54 : a5 53 __ LDA T1 + 0 
1a56 : 91 23 __ STA (SP + 0),y 
1a58 : a0 07 __ LDY #$07
1a5a : b1 23 __ LDA (SP + 0),y 
1a5c : 85 53 __ STA T1 + 0 
1a5e : 0a __ __ ASL
1a5f : 85 07 __ STA WORK + 4 
1a61 : a9 00 __ LDA #$00
1a63 : 2a __ __ ROL
1a64 : 06 07 __ ASL WORK + 4 
1a66 : 2a __ __ ROL
1a67 : aa __ __ TAX
1a68 : a5 07 __ LDA WORK + 4 
1a6a : 71 23 __ ADC (SP + 0),y 
1a6c : 85 44 __ STA T2 + 0 
1a6e : 8a __ __ TXA
1a6f : 69 00 __ ADC #$00
1a71 : 06 44 __ ASL T2 + 0 
1a73 : 2a __ __ ROL
1a74 : 06 44 __ ASL T2 + 0 
1a76 : 2a __ __ ROL
1a77 : 06 44 __ ASL T2 + 0 
1a79 : 2a __ __ ROL
1a7a : aa __ __ TAX
1a7b : 18 __ __ CLC
1a7c : a9 0b __ LDA #$0b
1a7e : 65 44 __ ADC T2 + 0 
1a80 : 85 44 __ STA T2 + 0 
1a82 : 8a __ __ TXA
1a83 : 69 d8 __ ADC #$d8
1a85 : 85 45 __ STA T2 + 1 
1a87 : ad cf 3b LDA $3bcf ; (menu + 110)
1a8a : 85 43 __ STA T0 + 0 
1a8c : 0a __ __ ASL
1a8d : 85 07 __ STA WORK + 4 
1a8f : a9 00 __ LDA #$00
1a91 : 2a __ __ ROL
1a92 : 06 07 __ ASL WORK + 4 
1a94 : 2a __ __ ROL
1a95 : aa __ __ TAX
1a96 : a5 07 __ LDA WORK + 4 
1a98 : 6d cf 3b ADC $3bcf ; (menu + 110)
1a9b : 85 46 __ STA T3 + 0 
1a9d : 8a __ __ TXA
1a9e : 69 00 __ ADC #$00
1aa0 : 06 46 __ ASL T3 + 0 
1aa2 : 2a __ __ ROL
1aa3 : 06 46 __ ASL T3 + 0 
1aa5 : 2a __ __ ROL
1aa6 : 06 46 __ ASL T3 + 0 
1aa8 : 2a __ __ ROL
1aa9 : aa __ __ TAX
1aaa : 18 __ __ CLC
1aab : a9 0b __ LDA #$0b
1aad : 65 46 __ ADC T3 + 0 
1aaf : 85 46 __ STA T3 + 0 
1ab1 : 8a __ __ TXA
1ab2 : 69 d8 __ ADC #$d8
1ab4 : 85 47 __ STA T3 + 1 
1ab6 : a0 00 __ LDY #$00
1ab8 : a9 0b __ LDA #$0b
1aba : 91 46 __ STA (T3 + 0),y 
1abc : a9 0f __ LDA #$0f
1abe : 91 44 __ STA (T2 + 0),y 
1ac0 : c8 __ __ INY
1ac1 : c0 09 __ CPY #$09
1ac3 : 90 f3 __ BCC $1ab8
1ac5 : a9 0b __ LDA #$0b
1ac7 : a0 02 __ LDY #$02
1ac9 : 91 23 __ STA (SP + 0),y 
1acb : a6 43 __ LDX T0 + 0 
1acd : bc 76 31 LDY $3176,x ; (__multab11L + 0)
1ad0 : b9 63 3b LDA $3b63,y ; (menu + 2)
1ad3 : 85 1b __ STA ACCU + 0 
1ad5 : b9 64 3b LDA $3b64,y ; (menu + 3)
1ad8 : 85 1c __ STA ACCU + 1 
1ada : 20 fd 0f JSR $0ffd ; (bcexec + 0)
1add : a9 0f __ LDA #$0f
1adf : a0 02 __ LDY #$02
1ae1 : 91 23 __ STA (SP + 0),y 
1ae3 : a6 53 __ LDX T1 + 0 
1ae5 : bc 76 31 LDY $3176,x ; (__multab11L + 0)
1ae8 : b9 63 3b LDA $3b63,y ; (menu + 2)
1aeb : 85 1b __ STA ACCU + 0 
1aed : b9 64 3b LDA $3b64,y ; (menu + 3)
1af0 : 85 1c __ STA ACCU + 1 
1af2 : 20 fd 0f JSR $0ffd ; (bcexec + 0)
1af5 : a0 03 __ LDY #$03
1af7 : b1 23 __ LDA (SP + 0),y 
1af9 : 85 53 __ STA T1 + 0 
1afb : 18 __ __ CLC
1afc : a5 23 __ LDA SP + 0 
1afe : 69 05 __ ADC #$05
1b00 : 85 23 __ STA SP + 0 
1b02 : 90 02 __ BCC $1b06
1b04 : e6 24 __ INC SP + 1 
1b06 : 60 __ __ RTS
--------------------------------------------------------------------
prevx:
31de : __ __ __ BYT 00 00                                           : ..
--------------------------------------------------------------------
update_horizontal_menu:
1b07 : 38 __ __ SEC
1b08 : a5 23 __ LDA SP + 0 
1b0a : e9 03 __ SBC #$03
1b0c : 85 23 __ STA SP + 0 
1b0e : b0 02 __ BCS $1b12
1b10 : c6 24 __ DEC SP + 1 
1b12 : a0 05 __ LDY #$05
1b14 : b1 23 __ LDA (SP + 0),y 
1b16 : a0 02 __ LDY #$02
1b18 : 91 23 __ STA (SP + 0),y 
1b1a : ae cf 3b LDX $3bcf ; (menu + 110)
1b1d : bc 76 31 LDY $3176,x ; (__multab11L + 0)
1b20 : b9 61 3b LDA $3b61,y ; (menu + 0)
1b23 : 85 1b __ STA ACCU + 0 
1b25 : b9 62 3b LDA $3b62,y ; (menu + 1)
1b28 : 85 1c __ STA ACCU + 1 
1b2a : 20 fd 0f JSR $0ffd ; (bcexec + 0)
1b2d : 20 6a 1b JSR $1b6a ; (update_sidfx_struct + 0)
1b30 : ad cf 33 LDA $33cf ; (channels + 15)
1b33 : d0 04 __ BNE $1b39
1b35 : a2 03 __ LDX #$03
1b37 : d0 0a __ BNE $1b43
1b39 : ad cd 31 LDA $31cd ; (SIDFXExplosion + 13)
1b3c : cd ce 33 CMP $33ce ; (channels + 14)
1b3f : 90 1d __ BCC $1b5e
1b41 : a2 01 __ LDX #$01
1b43 : a9 00 __ LDA #$00
1b45 : 8d cf 33 STA $33cf ; (channels + 15)
1b48 : 8d cd 33 STA $33cd ; (channels + 13)
1b4b : a9 c0 __ LDA #$c0
1b4d : 8d ca 33 STA $33ca ; (channels + 10)
1b50 : a9 31 __ LDA #$31
1b52 : 8d cb 33 STA $33cb ; (channels + 11)
1b55 : ad cd 31 LDA $31cd ; (SIDFXExplosion + 13)
1b58 : 8d ce 33 STA $33ce ; (channels + 14)
1b5b : 8e cf 33 STX $33cf ; (channels + 15)
1b5e : 18 __ __ CLC
1b5f : a5 23 __ LDA SP + 0 
1b61 : 69 03 __ ADC #$03
1b63 : 85 23 __ STA SP + 0 
1b65 : 90 02 __ BCC $1b69
1b67 : e6 24 __ INC SP + 1 
1b69 : 60 __ __ RTS
--------------------------------------------------------------------
update_sidfx_struct:
1b6a : ae 67 3b LDX $3b67 ; (menu + 6)
1b6d : bd f7 11 LDA $11f7,x ; (sid_waveforms + 0)
1b70 : 09 01 __ ORA #$01
1b72 : 8d c4 31 STA $31c4 ; (SIDFXExplosion + 4)
1b75 : ad 72 3b LDA $3b72 ; (menu + 17)
1b78 : 8d c2 31 STA $31c2 ; (SIDFXExplosion + 2)
1b7b : ad 73 3b LDA $3b73 ; (menu + 18)
1b7e : 8d c3 31 STA $31c3 ; (SIDFXExplosion + 3)
1b81 : ad 7d 3b LDA $3b7d ; (menu + 28)
1b84 : 0a __ __ ASL
1b85 : 0a __ __ ASL
1b86 : 0a __ __ ASL
1b87 : 0a __ __ ASL
1b88 : 0d 88 3b ORA $3b88 ; (menu + 39)
1b8b : 8d c5 31 STA $31c5 ; (SIDFXExplosion + 5)
1b8e : ad 93 3b LDA $3b93 ; (menu + 50)
1b91 : 0a __ __ ASL
1b92 : 0a __ __ ASL
1b93 : 0a __ __ ASL
1b94 : 0a __ __ ASL
1b95 : 0d 9e 3b ORA $3b9e ; (menu + 61)
1b98 : 8d c6 31 STA $31c6 ; (SIDFXExplosion + 6)
1b9b : ad a9 3b LDA $3ba9 ; (menu + 72)
1b9e : 8d c7 31 STA $31c7 ; (SIDFXExplosion + 7)
1ba1 : ad aa 3b LDA $3baa ; (menu + 73)
1ba4 : 8d c8 31 STA $31c8 ; (SIDFXExplosion + 8)
1ba7 : ad b4 3b LDA $3bb4 ; (menu + 83)
1baa : 8d c9 31 STA $31c9 ; (SIDFXExplosion + 9)
1bad : ad b5 3b LDA $3bb5 ; (menu + 84)
1bb0 : 8d ca 31 STA $31ca ; (SIDFXExplosion + 10)
1bb3 : ad bf 3b LDA $3bbf ; (menu + 94)
1bb6 : 8d cb 31 STA $31cb ; (SIDFXExplosion + 11)
1bb9 : ad ca 3b LDA $3bca ; (menu + 105)
1bbc : 8d cc 31 STA $31cc ; (SIDFXExplosion + 12)
1bbf : 60 __ __ RTS
--------------------------------------------------------------------
prevb:
31e0 : __ __ __ BYT 00 00                                           : ..
--------------------------------------------------------------------
edit_window_process_keyboard_events:
1bc0 : 38 __ __ SEC
1bc1 : a5 23 __ LDA SP + 0 
1bc3 : e9 03 __ SBC #$03
1bc5 : 85 23 __ STA SP + 0 
1bc7 : b0 02 __ BCS $1bcb
1bc9 : c6 24 __ DEC SP + 1 
1bcb : 20 6f 1e JSR $1e6f ; (keyb_poll + 0)
1bce : ad fc 31 LDA $31fc ; (keyb_key + 0)
1bd1 : 29 7f __ AND #$7f
1bd3 : aa __ __ TAX
1bd4 : bd 00 35 LDA $3500,x ; (keyb_codes + 0)
1bd7 : c9 1b __ CMP #$1b
1bd9 : f0 0c __ BEQ $1be7
1bdb : c9 20 __ CMP #$20
1bdd : f0 08 __ BEQ $1be7
1bdf : c9 3d __ CMP #$3d
1be1 : f0 04 __ BEQ $1be7
1be3 : c9 5f __ CMP #$5f
1be5 : d0 05 __ BNE $1bec
1be7 : a9 01 __ LDA #$01
1be9 : 4c de 1d JMP $1dde ; (edit_window_process_keyboard_events + 542)
1bec : c9 71 __ CMP #$71
1bee : d0 0c __ BNE $1bfc
1bf0 : a9 a0 __ LDA #$a0
1bf2 : 85 0d __ STA P0 
1bf4 : a9 00 __ LDA #$00
1bf6 : 8d fd 11 STA $11fd ; (note + 0)
1bf9 : 4c 66 1e JMP $1e66 ; (edit_window_process_keyboard_events + 678)
1bfc : c9 32 __ CMP #$32
1bfe : d0 09 __ BNE $1c09
1c00 : a9 29 __ LDA #$29
1c02 : 85 0d __ STA P0 
1c04 : a9 01 __ LDA #$01
1c06 : 4c 61 1e JMP $1e61 ; (edit_window_process_keyboard_events + 673)
1c09 : c9 77 __ CMP #$77
1c0b : d0 09 __ BNE $1c16
1c0d : a9 a2 __ LDA #$a2
1c0f : 85 0d __ STA P0 
1c11 : a9 02 __ LDA #$02
1c13 : 4c 61 1e JMP $1e61 ; (edit_window_process_keyboard_events + 673)
1c16 : c9 33 __ CMP #$33
1c18 : d0 09 __ BNE $1c23
1c1a : a9 2b __ LDA #$2b
1c1c : 85 0d __ STA P0 
1c1e : a9 03 __ LDA #$03
1c20 : 4c 61 1e JMP $1e61 ; (edit_window_process_keyboard_events + 673)
1c23 : c9 65 __ CMP #$65
1c25 : d0 09 __ BNE $1c30
1c27 : a9 a4 __ LDA #$a4
1c29 : 85 0d __ STA P0 
1c2b : a9 04 __ LDA #$04
1c2d : 4c 61 1e JMP $1e61 ; (edit_window_process_keyboard_events + 673)
1c30 : c9 72 __ CMP #$72
1c32 : d0 09 __ BNE $1c3d
1c34 : a9 a6 __ LDA #$a6
1c36 : 85 0d __ STA P0 
1c38 : a9 05 __ LDA #$05
1c3a : 4c 61 1e JMP $1e61 ; (edit_window_process_keyboard_events + 673)
1c3d : c9 35 __ CMP #$35
1c3f : d0 09 __ BNE $1c4a
1c41 : a9 2f __ LDA #$2f
1c43 : 85 0d __ STA P0 
1c45 : a9 06 __ LDA #$06
1c47 : 4c 61 1e JMP $1e61 ; (edit_window_process_keyboard_events + 673)
1c4a : c9 74 __ CMP #$74
1c4c : d0 09 __ BNE $1c57
1c4e : a9 a8 __ LDA #$a8
1c50 : 85 0d __ STA P0 
1c52 : a9 07 __ LDA #$07
1c54 : 4c 61 1e JMP $1e61 ; (edit_window_process_keyboard_events + 673)
1c57 : c9 36 __ CMP #$36
1c59 : d0 09 __ BNE $1c64
1c5b : a9 31 __ LDA #$31
1c5d : 85 0d __ STA P0 
1c5f : a9 08 __ LDA #$08
1c61 : 4c 61 1e JMP $1e61 ; (edit_window_process_keyboard_events + 673)
1c64 : c9 79 __ CMP #$79
1c66 : d0 09 __ BNE $1c71
1c68 : a9 aa __ LDA #$aa
1c6a : 85 0d __ STA P0 
1c6c : a9 09 __ LDA #$09
1c6e : 4c 61 1e JMP $1e61 ; (edit_window_process_keyboard_events + 673)
1c71 : c9 37 __ CMP #$37
1c73 : d0 09 __ BNE $1c7e
1c75 : a9 33 __ LDA #$33
1c77 : 85 0d __ STA P0 
1c79 : a9 0a __ LDA #$0a
1c7b : 4c 61 1e JMP $1e61 ; (edit_window_process_keyboard_events + 673)
1c7e : c9 75 __ CMP #$75
1c80 : d0 09 __ BNE $1c8b
1c82 : a9 ac __ LDA #$ac
1c84 : 85 0d __ STA P0 
1c86 : a9 0b __ LDA #$0b
1c88 : 4c 61 1e JMP $1e61 ; (edit_window_process_keyboard_events + 673)
1c8b : c9 69 __ CMP #$69
1c8d : d0 09 __ BNE $1c98
1c8f : a9 ae __ LDA #$ae
1c91 : 85 0d __ STA P0 
1c93 : a9 0c __ LDA #$0c
1c95 : 4c 61 1e JMP $1e61 ; (edit_window_process_keyboard_events + 673)
1c98 : c9 39 __ CMP #$39
1c9a : d0 09 __ BNE $1ca5
1c9c : a9 37 __ LDA #$37
1c9e : 85 0d __ STA P0 
1ca0 : a9 0d __ LDA #$0d
1ca2 : 4c 61 1e JMP $1e61 ; (edit_window_process_keyboard_events + 673)
1ca5 : c9 6f __ CMP #$6f
1ca7 : d0 09 __ BNE $1cb2
1ca9 : a9 b0 __ LDA #$b0
1cab : 85 0d __ STA P0 
1cad : a9 0e __ LDA #$0e
1caf : 4c 61 1e JMP $1e61 ; (edit_window_process_keyboard_events + 673)
1cb2 : c9 30 __ CMP #$30
1cb4 : d0 09 __ BNE $1cbf
1cb6 : a9 39 __ LDA #$39
1cb8 : 85 0d __ STA P0 
1cba : a9 0f __ LDA #$0f
1cbc : 4c 61 1e JMP $1e61 ; (edit_window_process_keyboard_events + 673)
1cbf : c9 70 __ CMP #$70
1cc1 : d0 09 __ BNE $1ccc
1cc3 : a9 b2 __ LDA #$b2
1cc5 : 85 0d __ STA P0 
1cc7 : a9 10 __ LDA #$10
1cc9 : 4c 61 1e JMP $1e61 ; (edit_window_process_keyboard_events + 673)
1ccc : c9 40 __ CMP #$40
1cce : d0 09 __ BNE $1cd9
1cd0 : a9 b4 __ LDA #$b4
1cd2 : 85 0d __ STA P0 
1cd4 : a9 11 __ LDA #$11
1cd6 : 4c 61 1e JMP $1e61 ; (edit_window_process_keyboard_events + 673)
1cd9 : c9 2d __ CMP #$2d
1cdb : d0 09 __ BNE $1ce6
1cdd : a9 3d __ LDA #$3d
1cdf : 85 0d __ STA P0 
1ce1 : a9 12 __ LDA #$12
1ce3 : 4c 61 1e JMP $1e61 ; (edit_window_process_keyboard_events + 673)
1ce6 : c9 2a __ CMP #$2a
1ce8 : d0 09 __ BNE $1cf3
1cea : a9 b6 __ LDA #$b6
1cec : 85 0d __ STA P0 
1cee : a9 13 __ LDA #$13
1cf0 : 4c 61 1e JMP $1e61 ; (edit_window_process_keyboard_events + 673)
1cf3 : c9 61 __ CMP #$61
1cf5 : d0 0f __ BNE $1d06
1cf7 : a9 00 __ LDA #$00
1cf9 : 85 0d __ STA P0 
1cfb : 8d fb 11 STA $11fb ; (octave + 0)
1cfe : 8d fc 11 STA $11fc ; (octave + 1)
1d01 : a9 30 __ LDA #$30
1d03 : 4c 00 1e JMP $1e00 ; (edit_window_process_keyboard_events + 576)
1d06 : c9 73 __ CMP #$73
1d08 : d0 13 __ BNE $1d1d
1d0a : a9 01 __ LDA #$01
1d0c : 85 0d __ STA P0 
1d0e : a9 0c __ LDA #$0c
1d10 : 8d fb 11 STA $11fb ; (octave + 0)
1d13 : a9 00 __ LDA #$00
1d15 : 8d fc 11 STA $11fc ; (octave + 1)
1d18 : a9 31 __ LDA #$31
1d1a : 4c 00 1e JMP $1e00 ; (edit_window_process_keyboard_events + 576)
1d1d : c9 64 __ CMP #$64
1d1f : d0 13 __ BNE $1d34
1d21 : a9 02 __ LDA #$02
1d23 : 85 0d __ STA P0 
1d25 : a9 18 __ LDA #$18
1d27 : 8d fb 11 STA $11fb ; (octave + 0)
1d2a : a9 00 __ LDA #$00
1d2c : 8d fc 11 STA $11fc ; (octave + 1)
1d2f : a9 32 __ LDA #$32
1d31 : 4c 00 1e JMP $1e00 ; (edit_window_process_keyboard_events + 576)
1d34 : c9 66 __ CMP #$66
1d36 : d0 13 __ BNE $1d4b
1d38 : a9 03 __ LDA #$03
1d3a : 85 0d __ STA P0 
1d3c : a9 24 __ LDA #$24
1d3e : 8d fb 11 STA $11fb ; (octave + 0)
1d41 : a9 00 __ LDA #$00
1d43 : 8d fc 11 STA $11fc ; (octave + 1)
1d46 : a9 33 __ LDA #$33
1d48 : 4c 00 1e JMP $1e00 ; (edit_window_process_keyboard_events + 576)
1d4b : c9 67 __ CMP #$67
1d4d : d0 13 __ BNE $1d62
1d4f : a9 04 __ LDA #$04
1d51 : 85 0d __ STA P0 
1d53 : a9 30 __ LDA #$30
1d55 : 8d fb 11 STA $11fb ; (octave + 0)
1d58 : a9 00 __ LDA #$00
1d5a : 8d fc 11 STA $11fc ; (octave + 1)
1d5d : a9 34 __ LDA #$34
1d5f : 4c 00 1e JMP $1e00 ; (edit_window_process_keyboard_events + 576)
1d62 : c9 68 __ CMP #$68
1d64 : d0 13 __ BNE $1d79
1d66 : a9 05 __ LDA #$05
1d68 : 85 0d __ STA P0 
1d6a : a9 3c __ LDA #$3c
1d6c : 8d fb 11 STA $11fb ; (octave + 0)
1d6f : a9 00 __ LDA #$00
1d71 : 8d fc 11 STA $11fc ; (octave + 1)
1d74 : a9 35 __ LDA #$35
1d76 : 4c 00 1e JMP $1e00 ; (edit_window_process_keyboard_events + 576)
1d79 : c9 6a __ CMP #$6a
1d7b : d0 12 __ BNE $1d8f
1d7d : a9 06 __ LDA #$06
1d7f : 85 0d __ STA P0 
1d81 : a9 48 __ LDA #$48
1d83 : 8d fb 11 STA $11fb ; (octave + 0)
1d86 : a9 00 __ LDA #$00
1d88 : 8d fc 11 STA $11fc ; (octave + 1)
1d8b : a9 36 __ LDA #$36
1d8d : d0 71 __ BNE $1e00
1d8f : c9 6b __ CMP #$6b
1d91 : d0 12 __ BNE $1da5
1d93 : a9 07 __ LDA #$07
1d95 : 85 0d __ STA P0 
1d97 : a9 54 __ LDA #$54
1d99 : 8d fb 11 STA $11fb ; (octave + 0)
1d9c : a9 00 __ LDA #$00
1d9e : 8d fc 11 STA $11fc ; (octave + 1)
1da1 : a9 37 __ LDA #$37
1da3 : d0 5b __ BNE $1e00
1da5 : c9 91 __ CMP #$91
1da7 : d0 04 __ BNE $1dad
1da9 : a9 ff __ LDA #$ff
1dab : d0 49 __ BNE $1df6
1dad : c9 11 __ CMP #$11
1daf : d0 04 __ BNE $1db5
1db1 : a9 01 __ LDA #$01
1db3 : d0 41 __ BNE $1df6
1db5 : c9 9d __ CMP #$9d
1db7 : d0 04 __ BNE $1dbd
1db9 : a9 00 __ LDA #$00
1dbb : f0 2f __ BEQ $1dec
1dbd : c9 1d __ CMP #$1d
1dbf : d0 04 __ BNE $1dc5
1dc1 : a9 02 __ LDA #$02
1dc3 : d0 27 __ BNE $1dec
1dc5 : c9 0d __ CMP #$0d
1dc7 : d0 13 __ BNE $1ddc
1dc9 : ae cf 3b LDX $3bcf ; (menu + 110)
1dcc : bc 76 31 LDY $3176,x ; (__multab11L + 0)
1dcf : b9 65 3b LDA $3b65,y ; (menu + 4)
1dd2 : 85 1b __ STA ACCU + 0 
1dd4 : b9 66 3b LDA $3b66,y ; (menu + 5)
1dd7 : 85 1c __ STA ACCU + 1 
1dd9 : 20 fd 0f JSR $0ffd ; (bcexec + 0)
1ddc : a9 00 __ LDA #$00
1dde : 85 1b __ STA ACCU + 0 
1de0 : 18 __ __ CLC
1de1 : a5 23 __ LDA SP + 0 
1de3 : 69 03 __ ADC #$03
1de5 : 85 23 __ STA SP + 0 
1de7 : 90 02 __ BCC $1deb
1de9 : e6 24 __ INC SP + 1 
1deb : 60 __ __ RTS
1dec : a0 02 __ LDY #$02
1dee : 91 23 __ STA (SP + 0),y 
1df0 : 20 07 1b JSR $1b07 ; (update_horizontal_menu + 0)
1df3 : 4c dc 1d JMP $1ddc ; (edit_window_process_keyboard_events + 540)
1df6 : a0 02 __ LDY #$02
1df8 : 91 23 __ STA (SP + 0),y 
1dfa : 20 d2 19 JSR $19d2 ; (update_vertical_menu + 0)
1dfd : 4c dc 1d JMP $1ddc ; (edit_window_process_keyboard_events + 540)
1e00 : 8d ef 05 STA $05ef 
1e03 : 20 5a 1f JSR $1f5a ; (select_new_octave + 0)
1e06 : ad fb 11 LDA $11fb ; (octave + 0)
1e09 : 18 __ __ CLC
1e0a : 6d fd 11 ADC $11fd ; (note + 0)
1e0d : 85 44 __ STA T1 + 0 
1e0f : ad fc 11 LDA $11fc ; (octave + 1)
1e12 : 6d fe 11 ADC $11fe ; (note + 1)
1e15 : 30 08 __ BMI $1e1f
1e17 : d0 c3 __ BNE $1ddc
1e19 : a5 44 __ LDA T1 + 0 
1e1b : c9 60 __ CMP #$60
1e1d : b0 bd __ BCS $1ddc
1e1f : a5 44 __ LDA T1 + 0 
1e21 : 0a __ __ ASL
1e22 : aa __ __ TAX
1e23 : bd 00 33 LDA $3300,x ; (notes_pal_table + 0)
1e26 : 8d c0 31 STA $31c0 ; (SIDFXExplosion + 0)
1e29 : bd 01 33 LDA $3301,x ; (notes_pal_table + 1)
1e2c : 8d c1 31 STA $31c1 ; (SIDFXExplosion + 1)
1e2f : ad d9 33 LDA $33d9 ; (channels + 25)
1e32 : f0 29 __ BEQ $1e5d
1e34 : ad cd 31 LDA $31cd ; (SIDFXExplosion + 13)
1e37 : cd d8 33 CMP $33d8 ; (channels + 24)
1e3a : 90 a0 __ BCC $1ddc
1e3c : a2 01 __ LDX #$01
1e3e : a9 00 __ LDA #$00
1e40 : 8d d9 33 STA $33d9 ; (channels + 25)
1e43 : 8d d7 33 STA $33d7 ; (channels + 23)
1e46 : a9 c0 __ LDA #$c0
1e48 : 8d d4 33 STA $33d4 ; (channels + 20)
1e4b : a9 31 __ LDA #$31
1e4d : 8d d5 33 STA $33d5 ; (channels + 21)
1e50 : ad cd 31 LDA $31cd ; (SIDFXExplosion + 13)
1e53 : 8d d8 33 STA $33d8 ; (channels + 24)
1e56 : 8e d9 33 STX $33d9 ; (channels + 25)
1e59 : a9 00 __ LDA #$00
1e5b : f0 81 __ BEQ $1dde
1e5d : a2 03 __ LDX #$03
1e5f : d0 dd __ BNE $1e3e
1e61 : 8d fd 11 STA $11fd ; (note + 0)
1e64 : a9 00 __ LDA #$00
1e66 : 8d fe 11 STA $11fe ; (note + 1)
1e69 : 20 36 1f JSR $1f36 ; (select_note + 0)
1e6c : 4c 06 1e JMP $1e06 ; (edit_window_process_keyboard_events + 582)
--------------------------------------------------------------------
keyb_poll:
1e6f : a9 ff __ LDA #$ff
1e71 : 8d 02 dc STA $dc02 
1e74 : 8d 00 dc STA $dc00 
1e77 : a9 00 __ LDA #$00
1e79 : 8d fc 31 STA $31fc ; (keyb_key + 0)
1e7c : ad 01 dc LDA $dc01 
1e7f : c9 ff __ CMP #$ff
1e81 : f0 03 __ BEQ $1e86
1e83 : 4c 14 1f JMP $1f14 ; (keyb_poll + 165)
1e86 : a9 00 __ LDA #$00
1e88 : 8d 03 dc STA $dc03 
1e8b : 8d 00 dc STA $dc00 
1e8e : ad 01 dc LDA $dc01 
1e91 : c9 ff __ CMP #$ff
1e93 : d0 03 __ BNE $1e98
1e95 : 4c 1a 1f JMP $1f1a ; (keyb_poll + 171)
1e98 : ad fd 33 LDA $33fd ; (keyb_matrix + 6)
1e9b : 29 ef __ AND #$ef
1e9d : 8d fd 33 STA $33fd ; (keyb_matrix + 6)
1ea0 : ad f8 33 LDA $33f8 ; (keyb_matrix + 1)
1ea3 : 29 7f __ AND #$7f
1ea5 : 8d f8 33 STA $33f8 ; (keyb_matrix + 1)
1ea8 : a9 fe __ LDA #$fe
1eaa : 85 43 __ STA T1 + 0 
1eac : a0 00 __ LDY #$00
1eae : a5 43 __ LDA T1 + 0 
1eb0 : 8d 00 dc STA $dc00 
1eb3 : b9 f7 33 LDA $33f7,y ; (keyb_matrix + 0)
1eb6 : 85 45 __ STA T4 + 0 
1eb8 : ad 01 dc LDA $dc01 
1ebb : 99 f7 33 STA $33f7,y ; (keyb_matrix + 0)
1ebe : 38 __ __ SEC
1ebf : 26 43 __ ROL T1 + 0 
1ec1 : 49 ff __ EOR #$ff
1ec3 : 25 45 __ AND T4 + 0 
1ec5 : f0 2f __ BEQ $1ef6
1ec7 : aa __ __ TAX
1ec8 : 98 __ __ TYA
1ec9 : 0a __ __ ASL
1eca : 0a __ __ ASL
1ecb : 0a __ __ ASL
1ecc : 09 80 __ ORA #$80
1ece : 85 44 __ STA T2 + 0 
1ed0 : 8a __ __ TXA
1ed1 : 29 f0 __ AND #$f0
1ed3 : d0 05 __ BNE $1eda
1ed5 : a5 44 __ LDA T2 + 0 
1ed7 : 4c df 1e JMP $1edf ; (keyb_poll + 112)
1eda : 18 __ __ CLC
1edb : a5 44 __ LDA T2 + 0 
1edd : 69 04 __ ADC #$04
1edf : 85 45 __ STA T4 + 0 
1ee1 : 8a __ __ TXA
1ee2 : 29 cc __ AND #$cc
1ee4 : f0 04 __ BEQ $1eea
1ee6 : e6 45 __ INC T4 + 0 
1ee8 : e6 45 __ INC T4 + 0 
1eea : 8a __ __ TXA
1eeb : 29 aa __ AND #$aa
1eed : f0 02 __ BEQ $1ef1
1eef : e6 45 __ INC T4 + 0 
1ef1 : a5 45 __ LDA T4 + 0 
1ef3 : 8d fc 31 STA $31fc ; (keyb_key + 0)
1ef6 : c8 __ __ INY
1ef7 : c0 08 __ CPY #$08
1ef9 : 90 b3 __ BCC $1eae
1efb : ad fc 31 LDA $31fc ; (keyb_key + 0)
1efe : f0 14 __ BEQ $1f14
1f00 : ad f8 33 LDA $33f8 ; (keyb_matrix + 1)
1f03 : 10 07 __ BPL $1f0c
1f05 : ad fd 33 LDA $33fd ; (keyb_matrix + 6)
1f08 : 29 10 __ AND #$10
1f0a : d0 08 __ BNE $1f14
1f0c : ad fc 31 LDA $31fc ; (keyb_key + 0)
1f0f : 09 40 __ ORA #$40
1f11 : 8d fc 31 STA $31fc ; (keyb_key + 0)
1f14 : a9 ff __ LDA #$ff
1f16 : 8d 00 dc STA $dc00 
1f19 : 60 __ __ RTS
1f1a : a9 ff __ LDA #$ff
1f1c : 8d f7 33 STA $33f7 ; (keyb_matrix + 0)
1f1f : 8d f8 33 STA $33f8 ; (keyb_matrix + 1)
1f22 : 8d f9 33 STA $33f9 ; (keyb_matrix + 2)
1f25 : 8d fa 33 STA $33fa ; (keyb_matrix + 3)
1f28 : 8d fb 33 STA $33fb ; (keyb_matrix + 4)
1f2b : 8d fc 33 STA $33fc ; (keyb_matrix + 5)
1f2e : 8d fd 33 STA $33fd ; (keyb_matrix + 6)
1f31 : 8d fe 33 STA $33fe ; (keyb_matrix + 7)
1f34 : d0 e0 __ BNE $1f16
--------------------------------------------------------------------
keyb_key:
31fc : __ __ __ BSS	1
--------------------------------------------------------------------
keyb_matrix:
33f7 : __ __ __ BSS	8
--------------------------------------------------------------------
keyb_codes:
3500 : __ __ __ BYT 14 0d 1d 88 85 86 87 11 33 77 61 34 7a 73 65 00 : ........3wa4zse.
3510 : __ __ __ BYT 35 72 64 36 63 66 74 78 37 79 67 38 62 68 75 76 : 5rd6cftx7yg8bhuv
3520 : __ __ __ BYT 39 69 6a 30 6d 6b 6f 6e 2b 70 6c 2d 2e 3a 40 2c : 9ij0mkon+pl-.:@,
3530 : __ __ __ BYT 00 2a 3b 13 00 3d 5e 2f 31 5f 00 32 20 00 71 1b : .*;..=^/1_.2 .q.
3540 : __ __ __ BYT 94 0d 9d 8c 89 8a 8b 91 23 57 41 24 5a 53 45 00 : ........#WA$ZSE.
3550 : __ __ __ BYT 25 52 44 26 43 46 54 58 27 59 47 28 42 48 55 56 : %RD&CFTX'YG(BHUV
3560 : __ __ __ BYT 29 49 4a 30 4d 4b 4f 4e 00 50 4c 00 3e 5b 40 3c : )IJ0MKON.PL.>[@<
3570 : __ __ __ BYT 00 00 5d 93 00 00 5e 3f 21 00 00 22 20 00 51 1b : ..]...^?!.." .Q.
--------------------------------------------------------------------
select_note:
1f36 : 18 __ __ CLC
1f37 : a9 39 __ LDA #$39
1f39 : 6d da 31 ADC $31da ; (prev_note_position + 0)
1f3c : 85 43 __ STA T0 + 0 
1f3e : a9 da __ LDA #$da
1f40 : 6d db 31 ADC $31db ; (prev_note_position + 1)
1f43 : 85 44 __ STA T0 + 1 
1f45 : a9 0b __ LDA #$0b
1f47 : a0 00 __ LDY #$00
1f49 : 91 43 __ STA (T0 + 0),y 
1f4b : a9 0f __ LDA #$0f
1f4d : a6 0d __ LDX P0 
1f4f : 8e da 31 STX $31da ; (prev_note_position + 0)
1f52 : 9d 39 da STA $da39,x 
1f55 : 98 __ __ TYA
1f56 : 8d db 31 STA $31db ; (prev_note_position + 1)
1f59 : 60 __ __ RTS
--------------------------------------------------------------------
select_new_octave:
1f5a : 18 __ __ CLC
1f5b : a9 f8 __ LDA #$f8
1f5d : 6d fe 12 ADC $12fe ; (prev_octave_position + 0)
1f60 : 85 43 __ STA T0 + 0 
1f62 : a9 d9 __ LDA #$d9
1f64 : 6d ff 12 ADC $12ff ; (prev_octave_position + 1)
1f67 : 85 44 __ STA T0 + 1 
1f69 : a9 0b __ LDA #$0b
1f6b : a0 00 __ LDY #$00
1f6d : 91 43 __ STA (T0 + 0),y 
1f6f : a9 0f __ LDA #$0f
1f71 : a6 0d __ LDX P0 
1f73 : 8e fe 12 STX $12fe ; (prev_octave_position + 0)
1f76 : 9d f8 d9 STA $d9f8,x 
1f79 : 98 __ __ TYA
1f7a : 8d ff 12 STA $12ff ; (prev_octave_position + 1)
1f7d : 60 __ __ RTS
--------------------------------------------------------------------
sidfx_loop:
1f7e : a2 00 __ LDX #$00
1f80 : bc fa 10 LDY $10fa,x ; (__multab10L + 0)
1f83 : 84 46 __ STY T3 + 0 
1f85 : b9 c5 33 LDA $33c5,y ; (channels + 5)
1f88 : c9 03 __ CMP #$03
1f8a : d0 03 __ BNE $1f8f
1f8c : 4c 83 21 JMP $2183 ; (sidfx_loop + 517)
1f8f : b0 03 __ BCS $1f94
1f91 : 4c 4d 21 JMP $214d ; (sidfx_loop + 463)
1f94 : c9 04 __ CMP #$04
1f96 : d0 03 __ BNE $1f9b
1f98 : 4c 6c 20 JMP $206c ; (sidfx_loop + 238)
1f9b : c9 05 __ CMP #$05
1f9d : f0 03 __ BEQ $1fa2
1f9f : 4c 41 20 JMP $2041 ; (sidfx_loop + 195)
1fa2 : b9 c0 33 LDA $33c0,y ; (channels + 0)
1fa5 : 85 44 __ STA T2 + 0 
1fa7 : b9 c1 33 LDA $33c1,y ; (channels + 1)
1faa : 85 45 __ STA T2 + 1 
1fac : a0 07 __ LDY #$07
1fae : b1 44 __ LDA (T2 + 0),y 
1fb0 : 85 02 __ STA $02 
1fb2 : c8 __ __ INY
1fb3 : b1 44 __ LDA (T2 + 0),y 
1fb5 : 85 45 __ STA T2 + 1 
1fb7 : 05 02 __ ORA $02 
1fb9 : f0 27 __ BEQ $1fe2
1fbb : a4 46 __ LDY T3 + 0 
1fbd : b9 c6 33 LDA $33c6,y ; (channels + 6)
1fc0 : 18 __ __ CLC
1fc1 : 65 02 __ ADC $02 
1fc3 : 85 44 __ STA T2 + 0 
1fc5 : 99 c6 33 STA $33c6,y ; (channels + 6)
1fc8 : b9 c7 33 LDA $33c7,y ; (channels + 7)
1fcb : 65 45 __ ADC T2 + 1 
1fcd : 85 45 __ STA T2 + 1 
1fcf : 99 c7 33 STA $33c7,y ; (channels + 7)
1fd2 : a5 44 __ LDA T2 + 0 
1fd4 : bc fd 10 LDY $10fd,x ; (__multab7L + 0)
1fd7 : 99 00 d4 STA $d400,y 
1fda : a5 45 __ LDA T2 + 1 
1fdc : bc fd 10 LDY $10fd,x ; (__multab7L + 0)
1fdf : 99 01 d4 STA $d401,y 
1fe2 : a4 46 __ LDY T3 + 0 
1fe4 : b9 c0 33 LDA $33c0,y ; (channels + 0)
1fe7 : 85 44 __ STA T2 + 0 
1fe9 : b9 c1 33 LDA $33c1,y ; (channels + 1)
1fec : 85 45 __ STA T2 + 1 
1fee : a0 09 __ LDY #$09
1ff0 : b1 44 __ LDA (T2 + 0),y 
1ff2 : 85 02 __ STA $02 
1ff4 : c8 __ __ INY
1ff5 : b1 44 __ LDA (T2 + 0),y 
1ff7 : 85 45 __ STA T2 + 1 
1ff9 : 05 02 __ ORA $02 
1ffb : f0 24 __ BEQ $2021
1ffd : a4 46 __ LDY T3 + 0 
1fff : b9 c8 33 LDA $33c8,y ; (channels + 8)
2002 : 18 __ __ CLC
2003 : 65 02 __ ADC $02 
2005 : 85 44 __ STA T2 + 0 
2007 : 99 c8 33 STA $33c8,y ; (channels + 8)
200a : b9 c9 33 LDA $33c9,y ; (channels + 9)
200d : 65 45 __ ADC T2 + 1 
200f : 85 45 __ STA T2 + 1 
2011 : 99 c9 33 STA $33c9,y ; (channels + 9)
2014 : a5 44 __ LDA T2 + 0 
2016 : bc fd 10 LDY $10fd,x ; (__multab7L + 0)
2019 : 99 02 d4 STA $d402,y 
201c : a5 45 __ LDA T2 + 1 
201e : 99 03 d4 STA $d403,y 
2021 : a4 46 __ LDY T3 + 0 
2023 : b9 c2 33 LDA $33c2,y ; (channels + 2)
2026 : f0 07 __ BEQ $202f
2028 : 85 47 __ STA T4 + 0 
202a : c6 47 __ DEC T4 + 0 
202c : 4c 64 20 JMP $2064 ; (sidfx_loop + 230)
202f : a9 01 __ LDA #$01
2031 : 99 c5 33 STA $33c5,y ; (channels + 5)
2034 : b9 c3 33 LDA $33c3,y ; (channels + 3)
2037 : d0 11 __ BNE $204a
2039 : a9 00 __ LDA #$00
203b : 99 c0 33 STA $33c0,y ; (channels + 0)
203e : 99 c1 33 STA $33c1,y ; (channels + 1)
2041 : e8 __ __ INX
2042 : e0 03 __ CPX #$03
2044 : b0 03 __ BCS $2049
2046 : 4c 80 1f JMP $1f80 ; (sidfx_loop + 2)
2049 : 60 __ __ RTS
204a : 38 __ __ SEC
204b : e9 01 __ SBC #$01
204d : 99 c3 33 STA $33c3,y ; (channels + 3)
2050 : b9 c0 33 LDA $33c0,y ; (channels + 0)
2053 : 18 __ __ CLC
2054 : 69 0e __ ADC #$0e
2056 : 99 c0 33 STA $33c0,y ; (channels + 0)
2059 : b9 c1 33 LDA $33c1,y ; (channels + 1)
205c : 69 00 __ ADC #$00
205e : 99 c1 33 STA $33c1,y ; (channels + 1)
2061 : 4c 41 20 JMP $2041 ; (sidfx_loop + 195)
2064 : a5 47 __ LDA T4 + 0 
2066 : 99 c2 33 STA $33c2,y ; (channels + 2)
2069 : 4c 41 20 JMP $2041 ; (sidfx_loop + 195)
206c : b9 c0 33 LDA $33c0,y ; (channels + 0)
206f : 85 44 __ STA T2 + 0 
2071 : b9 c1 33 LDA $33c1,y ; (channels + 1)
2074 : 85 45 __ STA T2 + 1 
2076 : a0 07 __ LDY #$07
2078 : b1 44 __ LDA (T2 + 0),y 
207a : 85 02 __ STA $02 
207c : c8 __ __ INY
207d : b1 44 __ LDA (T2 + 0),y 
207f : 85 45 __ STA T2 + 1 
2081 : 05 02 __ ORA $02 
2083 : f0 27 __ BEQ $20ac
2085 : a4 46 __ LDY T3 + 0 
2087 : b9 c6 33 LDA $33c6,y ; (channels + 6)
208a : 18 __ __ CLC
208b : 65 02 __ ADC $02 
208d : 85 44 __ STA T2 + 0 
208f : 99 c6 33 STA $33c6,y ; (channels + 6)
2092 : b9 c7 33 LDA $33c7,y ; (channels + 7)
2095 : 65 45 __ ADC T2 + 1 
2097 : 85 45 __ STA T2 + 1 
2099 : 99 c7 33 STA $33c7,y ; (channels + 7)
209c : a5 44 __ LDA T2 + 0 
209e : bc fd 10 LDY $10fd,x ; (__multab7L + 0)
20a1 : 99 00 d4 STA $d400,y 
20a4 : a5 45 __ LDA T2 + 1 
20a6 : bc fd 10 LDY $10fd,x ; (__multab7L + 0)
20a9 : 99 01 d4 STA $d401,y 
20ac : a4 46 __ LDY T3 + 0 
20ae : b9 c0 33 LDA $33c0,y ; (channels + 0)
20b1 : 85 44 __ STA T2 + 0 
20b3 : b9 c1 33 LDA $33c1,y ; (channels + 1)
20b6 : 85 45 __ STA T2 + 1 
20b8 : a0 09 __ LDY #$09
20ba : b1 44 __ LDA (T2 + 0),y 
20bc : 85 02 __ STA $02 
20be : c8 __ __ INY
20bf : b1 44 __ LDA (T2 + 0),y 
20c1 : 85 45 __ STA T2 + 1 
20c3 : 05 02 __ ORA $02 
20c5 : f0 24 __ BEQ $20eb
20c7 : a4 46 __ LDY T3 + 0 
20c9 : b9 c8 33 LDA $33c8,y ; (channels + 8)
20cc : 18 __ __ CLC
20cd : 65 02 __ ADC $02 
20cf : 85 44 __ STA T2 + 0 
20d1 : 99 c8 33 STA $33c8,y ; (channels + 8)
20d4 : b9 c9 33 LDA $33c9,y ; (channels + 9)
20d7 : 65 45 __ ADC T2 + 1 
20d9 : 85 45 __ STA T2 + 1 
20db : 99 c9 33 STA $33c9,y ; (channels + 9)
20de : a5 44 __ LDA T2 + 0 
20e0 : bc fd 10 LDY $10fd,x ; (__multab7L + 0)
20e3 : 99 02 d4 STA $d402,y 
20e6 : a5 45 __ LDA T2 + 1 
20e8 : 99 03 d4 STA $d403,y 
20eb : a4 46 __ LDY T3 + 0 
20ed : b9 c2 33 LDA $33c2,y ; (channels + 2)
20f0 : f0 03 __ BEQ $20f5
20f2 : 4c 28 20 JMP $2028 ; (sidfx_loop + 170)
20f5 : b9 c0 33 LDA $33c0,y ; (channels + 0)
20f8 : 85 44 __ STA T2 + 0 
20fa : b9 c1 33 LDA $33c1,y ; (channels + 1)
20fd : 85 45 __ STA T2 + 1 
20ff : a0 0c __ LDY #$0c
2101 : b1 44 __ LDA (T2 + 0),y 
2103 : f0 16 __ BEQ $211b
2105 : a0 04 __ LDY #$04
2107 : b1 44 __ LDA (T2 + 0),y 
2109 : 29 fe __ AND #$fe
210b : bc fd 10 LDY $10fd,x ; (__multab7L + 0)
210e : 99 04 d4 STA $d404,y 
2111 : a0 0c __ LDY #$0c
2113 : b1 44 __ LDA (T2 + 0),y 
2115 : 85 47 __ STA T4 + 0 
2117 : a9 05 __ LDA #$05
2119 : d0 2a __ BNE $2145
211b : a4 46 __ LDY T3 + 0 
211d : b9 c3 33 LDA $33c3,y ; (channels + 3)
2120 : f0 1b __ BEQ $213d
2122 : 85 47 __ STA T4 + 0 
2124 : a9 03 __ LDA #$03
2126 : 99 c5 33 STA $33c5,y ; (channels + 5)
2129 : c6 47 __ DEC T4 + 0 
212b : a5 47 __ LDA T4 + 0 
212d : 99 c3 33 STA $33c3,y ; (channels + 3)
2130 : 18 __ __ CLC
2131 : a5 44 __ LDA T2 + 0 
2133 : 69 0e __ ADC #$0e
2135 : 99 c0 33 STA $33c0,y ; (channels + 0)
2138 : a5 45 __ LDA T2 + 1 
213a : 4c 5c 20 JMP $205c ; (sidfx_loop + 222)
213d : a9 01 __ LDA #$01
213f : 99 c5 33 STA $33c5,y ; (channels + 5)
2142 : 4c 39 20 JMP $2039 ; (sidfx_loop + 187)
2145 : a4 46 __ LDY T3 + 0 
2147 : 99 c5 33 STA $33c5,y ; (channels + 5)
214a : 4c 64 20 JMP $2064 ; (sidfx_loop + 230)
214d : 09 00 __ ORA #$00
214f : d0 03 __ BNE $2154
2151 : 4c 41 20 JMP $2041 ; (sidfx_loop + 195)
2154 : c9 01 __ CMP #$01
2156 : f0 19 __ BEQ $2171
2158 : c9 02 __ CMP #$02
215a : f0 03 __ BEQ $215f
215c : 4c 41 20 JMP $2041 ; (sidfx_loop + 195)
215f : a9 08 __ LDA #$08
2161 : bc fd 10 LDY $10fd,x ; (__multab7L + 0)
2164 : 99 04 d4 STA $d404,y 
2167 : a9 03 __ LDA #$03
2169 : a4 46 __ LDY T3 + 0 
216b : 99 c5 33 STA $33c5,y ; (channels + 5)
216e : 4c 41 20 JMP $2041 ; (sidfx_loop + 195)
2171 : a9 00 __ LDA #$00
2173 : bc fd 10 LDY $10fd,x ; (__multab7L + 0)
2176 : 99 06 d4 STA $d406,y 
2179 : 99 05 d4 STA $d405,y 
217c : 99 04 d4 STA $d404,y 
217f : a9 02 __ LDA #$02
2181 : d0 e6 __ BNE $2169
2183 : b9 c0 33 LDA $33c0,y ; (channels + 0)
2186 : 85 44 __ STA T2 + 0 
2188 : b9 c1 33 LDA $33c1,y ; (channels + 1)
218b : 85 45 __ STA T2 + 1 
218d : 05 44 __ ORA T2 + 0 
218f : d0 08 __ BNE $2199
2191 : a9 00 __ LDA #$00
2193 : 99 c5 33 STA $33c5,y ; (channels + 5)
2196 : 4c 41 20 JMP $2041 ; (sidfx_loop + 195)
2199 : a0 00 __ LDY #$00
219b : b1 44 __ LDA (T2 + 0),y 
219d : a4 46 __ LDY T3 + 0 
219f : 99 c6 33 STA $33c6,y ; (channels + 6)
21a2 : a0 01 __ LDY #$01
21a4 : b1 44 __ LDA (T2 + 0),y 
21a6 : a4 46 __ LDY T3 + 0 
21a8 : 99 c7 33 STA $33c7,y ; (channels + 7)
21ab : a0 02 __ LDY #$02
21ad : b1 44 __ LDA (T2 + 0),y 
21af : a4 46 __ LDY T3 + 0 
21b1 : 99 c8 33 STA $33c8,y ; (channels + 8)
21b4 : a0 03 __ LDY #$03
21b6 : b1 44 __ LDA (T2 + 0),y 
21b8 : a4 46 __ LDY T3 + 0 
21ba : 99 c9 33 STA $33c9,y ; (channels + 9)
21bd : bd fd 10 LDA $10fd,x ; (__multab7L + 0)
21c0 : 85 43 __ STA T1 + 0 
21c2 : a0 00 __ LDY #$00
21c4 : b1 44 __ LDA (T2 + 0),y 
21c6 : a4 43 __ LDY T1 + 0 
21c8 : 99 00 d4 STA $d400,y 
21cb : a0 01 __ LDY #$01
21cd : b1 44 __ LDA (T2 + 0),y 
21cf : a4 43 __ LDY T1 + 0 
21d1 : 99 01 d4 STA $d401,y 
21d4 : a0 02 __ LDY #$02
21d6 : b1 44 __ LDA (T2 + 0),y 
21d8 : a4 43 __ LDY T1 + 0 
21da : 99 02 d4 STA $d402,y 
21dd : a0 03 __ LDY #$03
21df : b1 44 __ LDA (T2 + 0),y 
21e1 : a4 43 __ LDY T1 + 0 
21e3 : 99 03 d4 STA $d403,y 
21e6 : a0 05 __ LDY #$05
21e8 : b1 44 __ LDA (T2 + 0),y 
21ea : a4 43 __ LDY T1 + 0 
21ec : 99 05 d4 STA $d405,y 
21ef : a0 06 __ LDY #$06
21f1 : b1 44 __ LDA (T2 + 0),y 
21f3 : a4 43 __ LDY T1 + 0 
21f5 : 99 06 d4 STA $d406,y 
21f8 : a0 04 __ LDY #$04
21fa : b1 44 __ LDA (T2 + 0),y 
21fc : a4 43 __ LDY T1 + 0 
21fe : 99 04 d4 STA $d404,y 
2201 : a0 0b __ LDY #$0b
2203 : b1 44 __ LDA (T2 + 0),y 
2205 : 85 47 __ STA T4 + 0 
2207 : a9 04 __ LDA #$04
2209 : 4c 45 21 JMP $2145 ; (sidfx_loop + 455)
--------------------------------------------------------------------
change_main_scene_to:
220c : a5 0d __ LDA P0 
220e : 0a __ __ ASL
220f : 0a __ __ ASL
2210 : aa __ __ TAX
2211 : bd df 33 LDA $33df,x ; (scene_tree + 1)
2214 : 8d f3 33 STA $33f3 ; (scene_tree + 21)
2217 : bd e0 33 LDA $33e0,x ; (scene_tree + 2)
221a : 8d f4 33 STA $33f4 ; (scene_tree + 22)
221d : bd e2 33 LDA $33e2,x ; (scene_tree + 4)
2220 : bc e1 33 LDY $33e1,x ; (scene_tree + 3)
2223 : 8c f5 33 STY $33f5 ; (scene_tree + 23)
2226 : 8d f6 33 STA $33f6 ; (scene_tree + 24)
2229 : a5 0d __ LDA P0 
222b : 8d de 33 STA $33de ; (scene_tree + 0)
222e : 60 __ __ RTS
--------------------------------------------------------------------
sound_effect_info_window_mainloop:
222f : 20 4f 22 JSR $224f ; (sound_effect_info_fill_buffer + 0)
2232 : 20 d7 23 JSR $23d7 ; (sound_effect_info_show + 0)
2235 : 20 57 24 JSR $2457 ; (sound_effect_info_process_keyboard_events + 0)
2238 : a5 1b __ LDA ACCU + 0 
223a : d0 10 __ BNE $224c
223c : 20 7e 1f JSR $1f7e ; (sidfx_loop + 0)
223f : ad 11 d0 LDA $d011 
2242 : 30 fb __ BMI $223f
2244 : ad 11 d0 LDA $d011 
2247 : 10 fb __ BPL $2244
2249 : 4c 35 22 JMP $2235 ; (sound_effect_info_window_mainloop + 6)
224c : 4c 1e 27 JMP $271e ; (sound_effect_info_hide + 0)
--------------------------------------------------------------------
sound_effect_info_fill_buffer:
224f : ad c1 31 LDA $31c1 ; (SIDFXExplosion + 1)
2252 : 4a __ __ LSR
2253 : 4a __ __ LSR
2254 : 4a __ __ LSR
2255 : 4a __ __ LSR
2256 : 49 08 __ EOR #$08
2258 : 38 __ __ SEC
2259 : e9 08 __ SBC #$08
225b : 29 0f __ AND #$0f
225d : aa __ __ TAX
225e : bd b0 31 LDA $31b0,x ; (int2hexpetscii + 0)
2261 : 8d d6 35 STA $35d6 ; (sound_effect_info_ascii + 86)
2264 : ad c1 31 LDA $31c1 ; (SIDFXExplosion + 1)
2267 : 29 0f __ AND #$0f
2269 : aa __ __ TAX
226a : bd b0 31 LDA $31b0,x ; (int2hexpetscii + 0)
226d : 8d d7 35 STA $35d7 ; (sound_effect_info_ascii + 87)
2270 : ad c0 31 LDA $31c0 ; (SIDFXExplosion + 0)
2273 : 85 43 __ STA T1 + 0 
2275 : ad c1 31 LDA $31c1 ; (SIDFXExplosion + 1)
2278 : 4a __ __ LSR
2279 : 66 43 __ ROR T1 + 0 
227b : 4a __ __ LSR
227c : a5 43 __ LDA T1 + 0 
227e : 6a __ __ ROR
227f : 4a __ __ LSR
2280 : 4a __ __ LSR
2281 : 29 0f __ AND #$0f
2283 : aa __ __ TAX
2284 : bd b0 31 LDA $31b0,x ; (int2hexpetscii + 0)
2287 : 8d d8 35 STA $35d8 ; (sound_effect_info_ascii + 88)
228a : ad c0 31 LDA $31c0 ; (SIDFXExplosion + 0)
228d : 29 0f __ AND #$0f
228f : aa __ __ TAX
2290 : bd b0 31 LDA $31b0,x ; (int2hexpetscii + 0)
2293 : 8d d9 35 STA $35d9 ; (sound_effect_info_ascii + 89)
2296 : ad c3 31 LDA $31c3 ; (SIDFXExplosion + 3)
2299 : 29 0f __ AND #$0f
229b : aa __ __ TAX
229c : bd b0 31 LDA $31b0,x ; (int2hexpetscii + 0)
229f : 8d df 35 STA $35df ; (sound_effect_info_ascii + 95)
22a2 : ad c3 31 LDA $31c3 ; (SIDFXExplosion + 3)
22a5 : 4a __ __ LSR
22a6 : 85 44 __ STA T1 + 1 
22a8 : ad c2 31 LDA $31c2 ; (SIDFXExplosion + 2)
22ab : 6a __ __ ROR
22ac : 46 44 __ LSR T1 + 1 
22ae : 6a __ __ ROR
22af : 4a __ __ LSR
22b0 : 4a __ __ LSR
22b1 : 29 0f __ AND #$0f
22b3 : aa __ __ TAX
22b4 : bd b0 31 LDA $31b0,x ; (int2hexpetscii + 0)
22b7 : 8d e0 35 STA $35e0 ; (sound_effect_info_ascii + 96)
22ba : ad c2 31 LDA $31c2 ; (SIDFXExplosion + 2)
22bd : 29 0f __ AND #$0f
22bf : aa __ __ TAX
22c0 : bd b0 31 LDA $31b0,x ; (int2hexpetscii + 0)
22c3 : 8d e1 35 STA $35e1 ; (sound_effect_info_ascii + 97)
22c6 : ad c4 31 LDA $31c4 ; (SIDFXExplosion + 4)
22c9 : 4a __ __ LSR
22ca : 4a __ __ LSR
22cb : 4a __ __ LSR
22cc : 4a __ __ LSR
22cd : aa __ __ TAX
22ce : bd b0 31 LDA $31b0,x ; (int2hexpetscii + 0)
22d1 : 8d f0 35 STA $35f0 ; (sound_effect_info_ascii + 112)
22d4 : ad c4 31 LDA $31c4 ; (SIDFXExplosion + 4)
22d7 : 29 0f __ AND #$0f
22d9 : aa __ __ TAX
22da : bd b0 31 LDA $31b0,x ; (int2hexpetscii + 0)
22dd : 8d f1 35 STA $35f1 ; (sound_effect_info_ascii + 113)
22e0 : ad c5 31 LDA $31c5 ; (SIDFXExplosion + 5)
22e3 : 4a __ __ LSR
22e4 : 4a __ __ LSR
22e5 : 4a __ __ LSR
22e6 : 4a __ __ LSR
22e7 : aa __ __ TAX
22e8 : bd b0 31 LDA $31b0,x ; (int2hexpetscii + 0)
22eb : 8d 0a 36 STA $360a ; (sound_effect_info_ascii + 138)
22ee : ad c5 31 LDA $31c5 ; (SIDFXExplosion + 5)
22f1 : 29 0f __ AND #$0f
22f3 : aa __ __ TAX
22f4 : bd b0 31 LDA $31b0,x ; (int2hexpetscii + 0)
22f7 : 8d 0b 36 STA $360b ; (sound_effect_info_ascii + 139)
22fa : ad c6 31 LDA $31c6 ; (SIDFXExplosion + 6)
22fd : 4a __ __ LSR
22fe : 4a __ __ LSR
22ff : 4a __ __ LSR
2300 : 4a __ __ LSR
2301 : aa __ __ TAX
2302 : bd b0 31 LDA $31b0,x ; (int2hexpetscii + 0)
2305 : 8d 24 36 STA $3624 ; (sound_effect_info_ascii + 164)
2308 : ad c6 31 LDA $31c6 ; (SIDFXExplosion + 6)
230b : 29 0f __ AND #$0f
230d : aa __ __ TAX
230e : bd b0 31 LDA $31b0,x ; (int2hexpetscii + 0)
2311 : 8d 25 36 STA $3625 ; (sound_effect_info_ascii + 165)
2314 : ad c8 31 LDA $31c8 ; (SIDFXExplosion + 8)
2317 : 4a __ __ LSR
2318 : 4a __ __ LSR
2319 : 4a __ __ LSR
231a : 4a __ __ LSR
231b : 49 08 __ EOR #$08
231d : 38 __ __ SEC
231e : e9 08 __ SBC #$08
2320 : 29 0f __ AND #$0f
2322 : aa __ __ TAX
2323 : bd b0 31 LDA $31b0,x ; (int2hexpetscii + 0)
2326 : 8d 3e 36 STA $363e ; (sound_effect_info_ascii + 190)
2329 : ad c8 31 LDA $31c8 ; (SIDFXExplosion + 8)
232c : 29 0f __ AND #$0f
232e : aa __ __ TAX
232f : bd b0 31 LDA $31b0,x ; (int2hexpetscii + 0)
2332 : 8d 3f 36 STA $363f ; (sound_effect_info_ascii + 191)
2335 : ad c7 31 LDA $31c7 ; (SIDFXExplosion + 7)
2338 : 85 43 __ STA T1 + 0 
233a : ad c8 31 LDA $31c8 ; (SIDFXExplosion + 8)
233d : 4a __ __ LSR
233e : 66 43 __ ROR T1 + 0 
2340 : 4a __ __ LSR
2341 : a5 43 __ LDA T1 + 0 
2343 : 6a __ __ ROR
2344 : 4a __ __ LSR
2345 : 4a __ __ LSR
2346 : 29 0f __ AND #$0f
2348 : aa __ __ TAX
2349 : bd b0 31 LDA $31b0,x ; (int2hexpetscii + 0)
234c : 8d 40 36 STA $3640 ; (sound_effect_info_ascii + 192)
234f : ad c7 31 LDA $31c7 ; (SIDFXExplosion + 7)
2352 : 29 0f __ AND #$0f
2354 : aa __ __ TAX
2355 : bd b0 31 LDA $31b0,x ; (int2hexpetscii + 0)
2358 : 8d 41 36 STA $3641 ; (sound_effect_info_ascii + 193)
235b : ad ca 31 LDA $31ca ; (SIDFXExplosion + 10)
235e : 4a __ __ LSR
235f : 4a __ __ LSR
2360 : 4a __ __ LSR
2361 : 4a __ __ LSR
2362 : 49 08 __ EOR #$08
2364 : 38 __ __ SEC
2365 : e9 08 __ SBC #$08
2367 : 29 0f __ AND #$0f
2369 : aa __ __ TAX
236a : bd b0 31 LDA $31b0,x ; (int2hexpetscii + 0)
236d : 8d 46 36 STA $3646 ; (sound_effect_info_ascii + 198)
2370 : ad ca 31 LDA $31ca ; (SIDFXExplosion + 10)
2373 : 29 0f __ AND #$0f
2375 : aa __ __ TAX
2376 : bd b0 31 LDA $31b0,x ; (int2hexpetscii + 0)
2379 : 8d 47 36 STA $3647 ; (sound_effect_info_ascii + 199)
237c : ad c9 31 LDA $31c9 ; (SIDFXExplosion + 9)
237f : 85 43 __ STA T1 + 0 
2381 : ad ca 31 LDA $31ca ; (SIDFXExplosion + 10)
2384 : 4a __ __ LSR
2385 : 66 43 __ ROR T1 + 0 
2387 : 4a __ __ LSR
2388 : a5 43 __ LDA T1 + 0 
238a : 6a __ __ ROR
238b : 4a __ __ LSR
238c : 4a __ __ LSR
238d : 29 0f __ AND #$0f
238f : aa __ __ TAX
2390 : bd b0 31 LDA $31b0,x ; (int2hexpetscii + 0)
2393 : 8d 48 36 STA $3648 ; (sound_effect_info_ascii + 200)
2396 : ad c9 31 LDA $31c9 ; (SIDFXExplosion + 9)
2399 : 29 0f __ AND #$0f
239b : aa __ __ TAX
239c : bd b0 31 LDA $31b0,x ; (int2hexpetscii + 0)
239f : 8d 49 36 STA $3649 ; (sound_effect_info_ascii + 201)
23a2 : ad cb 31 LDA $31cb ; (SIDFXExplosion + 11)
23a5 : 4a __ __ LSR
23a6 : 4a __ __ LSR
23a7 : 4a __ __ LSR
23a8 : 4a __ __ LSR
23a9 : aa __ __ TAX
23aa : bd b0 31 LDA $31b0,x ; (int2hexpetscii + 0)
23ad : 8d 58 36 STA $3658 ; (sound_effect_info_ascii + 216)
23b0 : ad cb 31 LDA $31cb ; (SIDFXExplosion + 11)
23b3 : 29 0f __ AND #$0f
23b5 : aa __ __ TAX
23b6 : bd b0 31 LDA $31b0,x ; (int2hexpetscii + 0)
23b9 : 8d 59 36 STA $3659 ; (sound_effect_info_ascii + 217)
23bc : ad cc 31 LDA $31cc ; (SIDFXExplosion + 12)
23bf : 4a __ __ LSR
23c0 : 4a __ __ LSR
23c1 : 4a __ __ LSR
23c2 : 4a __ __ LSR
23c3 : aa __ __ TAX
23c4 : bd b0 31 LDA $31b0,x ; (int2hexpetscii + 0)
23c7 : 8d 60 36 STA $3660 ; (sound_effect_info_ascii + 224)
23ca : ad cc 31 LDA $31cc ; (SIDFXExplosion + 12)
23cd : 29 0f __ AND #$0f
23cf : aa __ __ TAX
23d0 : bd b0 31 LDA $31b0,x ; (int2hexpetscii + 0)
23d3 : 8d 61 36 STA $3661 ; (sound_effect_info_ascii + 225)
23d6 : 60 __ __ RTS
--------------------------------------------------------------------
sound_effect_info_ascii:
3580 : __ __ __ BYT 5d 40 40 40 40 40 40 40 40 40 40 40 40 40 40 40 : ]@@@@@@@@@@@@@@@
3590 : __ __ __ BYT 40 40 40 40 40 40 40 40 40 6e 5d 20 20 20 20 20 : @@@@@@@@@n]     
35a0 : __ __ __ BYT 20 20 20 20 20 20 20 20 20 20 20 20 20 20 20 20 :                 
35b0 : __ __ __ BYT 20 20 20 5d 5d 20 53 49 44 46 58 20 53 49 44 46 :    ]] SIDFX SIDF
35c0 : __ __ __ BYT 58 45 06 05 03 14 1b 30 1d 20 3c 3c 20 5d 5d 20 : XE.....0. << ]] 
35d0 : __ __ __ BYT 20 20 20 20 30 18 30 30 30 30 2c 20 30 18 30 30 :     0.0000, 0.00
35e0 : __ __ __ BYT 30 2c 20 20 20 20 20 5d 5d 20 20 20 20 20 30 18 : 0,     ]]     0.
35f0 : __ __ __ BYT 30 30 2c 20 20 20 20 20 20 20 20 20 20 20 20 20 : 00,             
3600 : __ __ __ BYT 20 5d 5d 20 20 20 20 20 30 18 30 30 2c 20 20 20 :  ]]     0.00,   
3610 : __ __ __ BYT 20 20 20 20 20 20 20 20 20 20 20 5d 5d 20 20 20 :            ]]   
3620 : __ __ __ BYT 20 20 30 18 30 30 2c 20 20 20 20 20 20 20 20 20 :   0.00,         
3630 : __ __ __ BYT 20 20 20 20 20 5d 5d 20 20 20 20 20 30 18 30 30 :      ]]     0.00
3640 : __ __ __ BYT 30 30 2c 20 30 18 30 30 30 30 2c 20 20 20 20 5d : 00, 0.0000,    ]
3650 : __ __ __ BYT 5d 20 20 20 20 20 30 18 30 30 2c 20 20 20 30 18 : ]     0.00,   0.
3660 : __ __ __ BYT 30 30 20 20 20 20 20 20 20 5d 5d 20 20 20 20 20 : 00       ]]     
3670 : __ __ __ BYT 20 20 20 20 20 20 20 20 20 20 20 20 20 20 20 20 :                 
3680 : __ __ __ BYT 20 20 20 5d 5d 20 3e 3e 3b 20 20 20 20 20 20 20 :    ]] >>;       
3690 : __ __ __ BYT 20 20 20 20 20 20 20 20 20 20 20 20 20 5d 5d 20 :              ]] 
36a0 : __ __ __ BYT 20 20 20 20 20 20 20 20 20 20 20 20 20 20 20 20 :                 
36b0 : __ __ __ BYT 20 20 20 20 20 20 20 5d 5d 20 20 20 20 28 04 29 :        ]]    (.)
36c0 : __ __ __ BYT 20 04 15 0d 10 20 01 13 20 14 18 14 20 20 20 20 :  .... .. ...    
36d0 : __ __ __ BYT 20 5d 5d 20 20 20 20 20 20 20 20 20 20 20 20 20 :  ]]             
36e0 : __ __ __ BYT 20 20 20 20 20 20 20 20 20 20 20 5d 6d 40 40 40 :            ]m@@@
36f0 : __ __ __ BYT 40 40 40 40 40 40 40 40 40 40 40 40 40 40 40 40 : @@@@@@@@@@@@@@@@
3700 : __ __ __ BYT 40 40 40 40 40 5d                               : @@@@@]
--------------------------------------------------------------------
sound_effect_info_show:
23d7 : a9 00 __ LDA #$00
23d9 : 85 43 __ STA T0 + 0 
23db : 85 44 __ STA T0 + 1 
23dd : 85 46 __ STA T1 + 1 
23df : 85 47 __ STA T2 + 0 
23e1 : a9 80 __ LDA #$80
23e3 : 85 45 __ STA T1 + 0 
23e5 : a2 1a __ LDX #$1a
23e7 : a0 00 __ LDY #$00
23e9 : 18 __ __ CLC
23ea : a9 be __ LDA #$be
23ec : 65 43 __ ADC T0 + 0 
23ee : 85 48 __ STA T4 + 0 
23f0 : a9 3c __ LDA #$3c
23f2 : 65 44 __ ADC T0 + 1 
23f4 : 85 49 __ STA T4 + 1 
23f6 : a5 45 __ LDA T1 + 0 
23f8 : 85 4c __ STA T7 + 0 
23fa : 85 4a __ STA T5 + 0 
23fc : 18 __ __ CLC
23fd : a9 04 __ LDA #$04
23ff : 65 46 __ ADC T1 + 1 
2401 : 85 4b __ STA T5 + 1 
2403 : b1 4a __ LDA (T5 + 0),y 
2405 : 91 48 __ STA (T4 + 0),y 
2407 : 18 __ __ CLC
2408 : a9 a6 __ LDA #$a6
240a : 65 43 __ ADC T0 + 0 
240c : 85 48 __ STA T4 + 0 
240e : a9 40 __ LDA #$40
2410 : 65 44 __ ADC T0 + 1 
2412 : 85 49 __ STA T4 + 1 
2414 : 18 __ __ CLC
2415 : a9 d8 __ LDA #$d8
2417 : 65 46 __ ADC T1 + 1 
2419 : 85 4d __ STA T7 + 1 
241b : b1 4c __ LDA (T7 + 0),y 
241d : 91 48 __ STA (T4 + 0),y 
241f : 18 __ __ CLC
2420 : a9 80 __ LDA #$80
2422 : 65 43 __ ADC T0 + 0 
2424 : 85 48 __ STA T4 + 0 
2426 : a9 35 __ LDA #$35
2428 : 65 44 __ ADC T0 + 1 
242a : 85 49 __ STA T4 + 1 
242c : b1 48 __ LDA (T4 + 0),y 
242e : 91 4a __ STA (T5 + 0),y 
2430 : a9 0f __ LDA #$0f
2432 : 91 4c __ STA (T7 + 0),y 
2434 : e6 43 __ INC T0 + 0 
2436 : d0 02 __ BNE $243a
2438 : e6 44 __ INC T0 + 1 
243a : e6 45 __ INC T1 + 0 
243c : d0 02 __ BNE $2440
243e : e6 46 __ INC T1 + 1 
2440 : ca __ __ DEX
2441 : d0 a6 __ BNE $23e9
2443 : 18 __ __ CLC
2444 : a5 45 __ LDA T1 + 0 
2446 : 69 0e __ ADC #$0e
2448 : 85 45 __ STA T1 + 0 
244a : 90 02 __ BCC $244e
244c : e6 46 __ INC T1 + 1 
244e : e6 47 __ INC T2 + 0 
2450 : a5 47 __ LDA T2 + 0 
2452 : c9 0f __ CMP #$0f
2454 : 90 8f __ BCC $23e5
2456 : 60 __ __ RTS
--------------------------------------------------------------------
screen_char_backup:
3cbe : __ __ __ BSS	1000
--------------------------------------------------------------------
screen_color_backup:
40a6 : __ __ __ BSS	1000
--------------------------------------------------------------------
sound_effect_info_process_keyboard_events:
2457 : 20 6f 1e JSR $1e6f ; (keyb_poll + 0)
245a : ad fc 31 LDA $31fc ; (keyb_key + 0)
245d : 29 7f __ AND #$7f
245f : aa __ __ TAX
2460 : bd 00 35 LDA $3500,x ; (keyb_codes + 0)
2463 : c9 69 __ CMP #$69
2465 : f0 10 __ BEQ $2477
2467 : c9 71 __ CMP #$71
2469 : f0 0c __ BEQ $2477
246b : c9 20 __ CMP #$20
246d : f0 08 __ BEQ $2477
246f : c9 1b __ CMP #$1b
2471 : f0 04 __ BEQ $2477
2473 : c9 5f __ CMP #$5f
2475 : d0 04 __ BNE $247b
2477 : a9 01 __ LDA #$01
2479 : d0 0d __ BNE $2488
247b : c9 64 __ CMP #$64
247d : f0 04 __ BEQ $2483
247f : a9 00 __ LDA #$00
2481 : f0 05 __ BEQ $2488
2483 : 20 8b 24 JSR $248b ; (exporter_save_file + 0)
2486 : a9 01 __ LDA #$01
2488 : 85 1b __ STA ACCU + 0 
248a : 60 __ __ RTS
--------------------------------------------------------------------
exporter_save_file:
248b : 20 c9 24 JSR $24c9 ; (exporter_fill_txt_template + 0)
248e : a9 67 __ LDA #$67
2490 : 85 0d __ STA P0 
2492 : a9 26 __ LDA #$26
2494 : 85 0e __ STA P1 
2496 : 20 51 26 JSR $2651 ; (krnio_setnam + 0)
2499 : a9 02 __ LDA #$02
249b : 85 0d __ STA P0 
249d : 85 0f __ STA P2 
249f : a9 08 __ LDA #$08
24a1 : 85 0e __ STA P1 
24a3 : 20 7e 26 JSR $267e ; (krnio_open + 0)
24a6 : a5 1b __ LDA ACCU + 0 
24a8 : d0 01 __ BNE $24ab
24aa : 60 __ __ RTS
24ab : a9 02 __ LDA #$02
24ad : 85 0e __ STA P1 
24af : a9 72 __ LDA #$72
24b1 : 85 11 __ STA P4 
24b3 : a9 00 __ LDA #$00
24b5 : 85 12 __ STA P5 
24b7 : a9 06 __ LDA #$06
24b9 : 85 0f __ STA P2 
24bb : a9 37 __ LDA #$37
24bd : 85 10 __ STA P3 
24bf : 20 a6 26 JSR $26a6 ; (krnio_write + 0)
24c2 : a9 02 __ LDA #$02
24c4 : 85 0d __ STA P0 
24c6 : 4c fa 0e JMP $0efa ; (krnio_close + 0)
--------------------------------------------------------------------
exporter_fill_txt_template:
24c9 : ad c1 31 LDA $31c1 ; (SIDFXExplosion + 1)
24cc : 4a __ __ LSR
24cd : 4a __ __ LSR
24ce : 4a __ __ LSR
24cf : 4a __ __ LSR
24d0 : 49 08 __ EOR #$08
24d2 : 38 __ __ SEC
24d3 : e9 08 __ SBC #$08
24d5 : 29 0f __ AND #$0f
24d7 : aa __ __ TAX
24d8 : bd e2 31 LDA $31e2,x ; (int2hexascii + 0)
24db : 8d 24 37 STA $3724 ; (exporter_txt_template + 30)
24de : ad c1 31 LDA $31c1 ; (SIDFXExplosion + 1)
24e1 : 29 0f __ AND #$0f
24e3 : aa __ __ TAX
24e4 : bd e2 31 LDA $31e2,x ; (int2hexascii + 0)
24e7 : 8d 25 37 STA $3725 ; (exporter_txt_template + 31)
24ea : ad c0 31 LDA $31c0 ; (SIDFXExplosion + 0)
24ed : 85 43 __ STA T1 + 0 
24ef : ad c1 31 LDA $31c1 ; (SIDFXExplosion + 1)
24f2 : 4a __ __ LSR
24f3 : 66 43 __ ROR T1 + 0 
24f5 : 4a __ __ LSR
24f6 : a5 43 __ LDA T1 + 0 
24f8 : 6a __ __ ROR
24f9 : 4a __ __ LSR
24fa : 4a __ __ LSR
24fb : 29 0f __ AND #$0f
24fd : aa __ __ TAX
24fe : bd e2 31 LDA $31e2,x ; (int2hexascii + 0)
2501 : 8d 26 37 STA $3726 ; (exporter_txt_template + 32)
2504 : ad c0 31 LDA $31c0 ; (SIDFXExplosion + 0)
2507 : 29 0f __ AND #$0f
2509 : aa __ __ TAX
250a : bd e2 31 LDA $31e2,x ; (int2hexascii + 0)
250d : 8d 27 37 STA $3727 ; (exporter_txt_template + 33)
2510 : ad c3 31 LDA $31c3 ; (SIDFXExplosion + 3)
2513 : 29 0f __ AND #$0f
2515 : aa __ __ TAX
2516 : bd e2 31 LDA $31e2,x ; (int2hexascii + 0)
2519 : 8d 2d 37 STA $372d ; (exporter_txt_template + 39)
251c : ad c3 31 LDA $31c3 ; (SIDFXExplosion + 3)
251f : 4a __ __ LSR
2520 : 85 44 __ STA T1 + 1 
2522 : ad c2 31 LDA $31c2 ; (SIDFXExplosion + 2)
2525 : 6a __ __ ROR
2526 : 46 44 __ LSR T1 + 1 
2528 : 6a __ __ ROR
2529 : 4a __ __ LSR
252a : 4a __ __ LSR
252b : 29 0f __ AND #$0f
252d : aa __ __ TAX
252e : bd e2 31 LDA $31e2,x ; (int2hexascii + 0)
2531 : 8d 2e 37 STA $372e ; (exporter_txt_template + 40)
2534 : ad c2 31 LDA $31c2 ; (SIDFXExplosion + 2)
2537 : 29 0f __ AND #$0f
2539 : aa __ __ TAX
253a : bd e2 31 LDA $31e2,x ; (int2hexascii + 0)
253d : 8d 2f 37 STA $372f ; (exporter_txt_template + 41)
2540 : ad c4 31 LDA $31c4 ; (SIDFXExplosion + 4)
2543 : 4a __ __ LSR
2544 : 4a __ __ LSR
2545 : 4a __ __ LSR
2546 : 4a __ __ LSR
2547 : aa __ __ TAX
2548 : bd e2 31 LDA $31e2,x ; (int2hexascii + 0)
254b : 8d 38 37 STA $3738 ; (exporter_txt_template + 50)
254e : ad c4 31 LDA $31c4 ; (SIDFXExplosion + 4)
2551 : 29 0f __ AND #$0f
2553 : aa __ __ TAX
2554 : bd e2 31 LDA $31e2,x ; (int2hexascii + 0)
2557 : 8d 39 37 STA $3739 ; (exporter_txt_template + 51)
255a : ad c5 31 LDA $31c5 ; (SIDFXExplosion + 5)
255d : 4a __ __ LSR
255e : 4a __ __ LSR
255f : 4a __ __ LSR
2560 : 4a __ __ LSR
2561 : aa __ __ TAX
2562 : bd e2 31 LDA $31e2,x ; (int2hexascii + 0)
2565 : 8d 42 37 STA $3742 ; (exporter_txt_template + 60)
2568 : ad c5 31 LDA $31c5 ; (SIDFXExplosion + 5)
256b : 29 0f __ AND #$0f
256d : aa __ __ TAX
256e : bd e2 31 LDA $31e2,x ; (int2hexascii + 0)
2571 : 8d 43 37 STA $3743 ; (exporter_txt_template + 61)
2574 : ad c6 31 LDA $31c6 ; (SIDFXExplosion + 6)
2577 : 4a __ __ LSR
2578 : 4a __ __ LSR
2579 : 4a __ __ LSR
257a : 4a __ __ LSR
257b : aa __ __ TAX
257c : bd e2 31 LDA $31e2,x ; (int2hexascii + 0)
257f : 8d 4c 37 STA $374c ; (exporter_txt_template + 70)
2582 : ad c6 31 LDA $31c6 ; (SIDFXExplosion + 6)
2585 : 29 0f __ AND #$0f
2587 : aa __ __ TAX
2588 : bd e2 31 LDA $31e2,x ; (int2hexascii + 0)
258b : 8d 4d 37 STA $374d ; (exporter_txt_template + 71)
258e : ad c8 31 LDA $31c8 ; (SIDFXExplosion + 8)
2591 : 4a __ __ LSR
2592 : 4a __ __ LSR
2593 : 4a __ __ LSR
2594 : 4a __ __ LSR
2595 : 49 08 __ EOR #$08
2597 : 38 __ __ SEC
2598 : e9 08 __ SBC #$08
259a : 29 0f __ AND #$0f
259c : aa __ __ TAX
259d : bd e2 31 LDA $31e2,x ; (int2hexascii + 0)
25a0 : 8d 56 37 STA $3756 ; (exporter_txt_template + 80)
25a3 : ad c8 31 LDA $31c8 ; (SIDFXExplosion + 8)
25a6 : 29 0f __ AND #$0f
25a8 : aa __ __ TAX
25a9 : bd e2 31 LDA $31e2,x ; (int2hexascii + 0)
25ac : 8d 57 37 STA $3757 ; (exporter_txt_template + 81)
25af : ad c7 31 LDA $31c7 ; (SIDFXExplosion + 7)
25b2 : 85 43 __ STA T1 + 0 
25b4 : ad c8 31 LDA $31c8 ; (SIDFXExplosion + 8)
25b7 : 4a __ __ LSR
25b8 : 66 43 __ ROR T1 + 0 
25ba : 4a __ __ LSR
25bb : a5 43 __ LDA T1 + 0 
25bd : 6a __ __ ROR
25be : 4a __ __ LSR
25bf : 4a __ __ LSR
25c0 : 29 0f __ AND #$0f
25c2 : aa __ __ TAX
25c3 : bd e2 31 LDA $31e2,x ; (int2hexascii + 0)
25c6 : 8d 58 37 STA $3758 ; (exporter_txt_template + 82)
25c9 : ad c7 31 LDA $31c7 ; (SIDFXExplosion + 7)
25cc : 29 0f __ AND #$0f
25ce : aa __ __ TAX
25cf : bd e2 31 LDA $31e2,x ; (int2hexascii + 0)
25d2 : 8d 59 37 STA $3759 ; (exporter_txt_template + 83)
25d5 : ad ca 31 LDA $31ca ; (SIDFXExplosion + 10)
25d8 : 4a __ __ LSR
25d9 : 4a __ __ LSR
25da : 4a __ __ LSR
25db : 4a __ __ LSR
25dc : 49 08 __ EOR #$08
25de : 38 __ __ SEC
25df : e9 08 __ SBC #$08
25e1 : 29 0f __ AND #$0f
25e3 : aa __ __ TAX
25e4 : bd e2 31 LDA $31e2,x ; (int2hexascii + 0)
25e7 : 8d 5e 37 STA $375e ; (exporter_txt_template + 88)
25ea : ad ca 31 LDA $31ca ; (SIDFXExplosion + 10)
25ed : 29 0f __ AND #$0f
25ef : aa __ __ TAX
25f0 : bd e2 31 LDA $31e2,x ; (int2hexascii + 0)
25f3 : 8d 5f 37 STA $375f ; (exporter_txt_template + 89)
25f6 : ad c9 31 LDA $31c9 ; (SIDFXExplosion + 9)
25f9 : 85 43 __ STA T1 + 0 
25fb : ad ca 31 LDA $31ca ; (SIDFXExplosion + 10)
25fe : 4a __ __ LSR
25ff : 66 43 __ ROR T1 + 0 
2601 : 4a __ __ LSR
2602 : a5 43 __ LDA T1 + 0 
2604 : 6a __ __ ROR
2605 : 4a __ __ LSR
2606 : 4a __ __ LSR
2607 : 29 0f __ AND #$0f
2609 : aa __ __ TAX
260a : bd e2 31 LDA $31e2,x ; (int2hexascii + 0)
260d : 8d 60 37 STA $3760 ; (exporter_txt_template + 90)
2610 : ad c9 31 LDA $31c9 ; (SIDFXExplosion + 9)
2613 : 29 0f __ AND #$0f
2615 : aa __ __ TAX
2616 : bd e2 31 LDA $31e2,x ; (int2hexascii + 0)
2619 : 8d 61 37 STA $3761 ; (exporter_txt_template + 91)
261c : ad cb 31 LDA $31cb ; (SIDFXExplosion + 11)
261f : 4a __ __ LSR
2620 : 4a __ __ LSR
2621 : 4a __ __ LSR
2622 : 4a __ __ LSR
2623 : aa __ __ TAX
2624 : bd e2 31 LDA $31e2,x ; (int2hexascii + 0)
2627 : 8d 6a 37 STA $376a ; (exporter_txt_template + 100)
262a : ad cb 31 LDA $31cb ; (SIDFXExplosion + 11)
262d : 29 0f __ AND #$0f
262f : aa __ __ TAX
2630 : bd e2 31 LDA $31e2,x ; (int2hexascii + 0)
2633 : 8d 6b 37 STA $376b ; (exporter_txt_template + 101)
2636 : ad cc 31 LDA $31cc ; (SIDFXExplosion + 12)
2639 : 4a __ __ LSR
263a : 4a __ __ LSR
263b : 4a __ __ LSR
263c : 4a __ __ LSR
263d : aa __ __ TAX
263e : bd e2 31 LDA $31e2,x ; (int2hexascii + 0)
2641 : 8d 70 37 STA $3770 ; (exporter_txt_template + 106)
2644 : ad cc 31 LDA $31cc ; (SIDFXExplosion + 12)
2647 : 29 0f __ AND #$0f
2649 : aa __ __ TAX
264a : bd e2 31 LDA $31e2,x ; (int2hexascii + 0)
264d : 8d 71 37 STA $3771 ; (exporter_txt_template + 107)
2650 : 60 __ __ RTS
--------------------------------------------------------------------
int2hexascii:
31e2 : __ __ __ BYT 30 31 32 33 34 35 36 37 38 39 61 62 63 64 65 66 : 0123456789abcdef
--------------------------------------------------------------------
exporter_txt_template:
3706 : __ __ __ BYT 53 49 44 46 58 20 53 49 44 46 58 45 66 66 65 63 : SIDFX SIDFXEffec
3716 : __ __ __ BYT 74 5b 31 5d 20 7b 7b 0a 20 20 20 20 30 78 30 30 : t[1] {{.    0x00
3726 : __ __ __ BYT 30 30 2c 20 30 78 30 30 30 30 2c 0a 20 20 20 20 : 00, 0x0000,.    
3736 : __ __ __ BYT 30 78 30 30 2c 0a 20 20 20 20 30 78 30 30 2c 0a : 0x00,.    0x00,.
3746 : __ __ __ BYT 20 20 20 20 30 78 30 30 2c 0a 20 20 20 20 30 78 :     0x00,.    0x
3756 : __ __ __ BYT 30 30 30 30 2c 20 30 78 30 30 30 30 2c 0a 20 20 : 0000, 0x0000,.  
3766 : __ __ __ BYT 20 20 30 78 30 30 2c 20 30 78 30 30 0a 7d 7d 3b :   0x00, 0x00.}};
3776 : __ __ __ BYT 0a 0a 00                                        : ...
--------------------------------------------------------------------
krnio_setnam:
2651 : a5 0d __ LDA P0 
2653 : 05 0e __ ORA P1 
2655 : f0 08 __ BEQ $265f
2657 : a0 ff __ LDY #$ff
2659 : c8 __ __ INY
265a : b1 0d __ LDA (P0),y 
265c : d0 fb __ BNE $2659
265e : 98 __ __ TYA
265f : a6 0d __ LDX P0 
2661 : a4 0e __ LDY P1 
2663 : 20 bd ff JSR $ffbd 
2666 : 60 __ __ RTS
--------------------------------------------------------------------
2667 : __ __ __ BYT 40 30 3a 53 49 44 46 58 45 46 46 45 43 54 2e 54 : @0:SIDFXEFFECT.T
2677 : __ __ __ BYT 58 54 2c 50 2c 57 00                            : XT,P,W.
--------------------------------------------------------------------
krnio_open:
267e : a9 00 __ LDA #$00
2680 : a6 0d __ LDX P0 
2682 : 9d c8 34 STA $34c8,x ; (krnio_pstatus + 0)
2685 : a9 00 __ LDA #$00
2687 : 85 1b __ STA ACCU + 0 
2689 : 85 1c __ STA ACCU + 1 
268b : a5 0d __ LDA P0 
268d : a6 0e __ LDX P1 
268f : a4 0f __ LDY P2 
2691 : 20 ba ff JSR $ffba 
2694 : 20 c0 ff JSR $ffc0 
2697 : 90 08 __ BCC $26a1
2699 : a5 0d __ LDA P0 
269b : 20 c3 ff JSR $ffc3 
269e : 4c a5 26 JMP $26a5 ; (krnio_open + 39)
26a1 : a9 01 __ LDA #$01
26a3 : 85 1b __ STA ACCU + 0 
26a5 : 60 __ __ RTS
--------------------------------------------------------------------
krnio_pstatus:
34c8 : __ __ __ BSS	16
--------------------------------------------------------------------
krnio_write:
26a6 : a5 0e __ LDA P1 
26a8 : 85 0d __ STA P0 
26aa : 20 02 27 JSR $2702 ; (krnio_chkout + 0)
26ad : a5 1b __ LDA ACCU + 0 
26af : d0 07 __ BNE $26b8
26b1 : a9 ff __ LDA #$ff
26b3 : 85 1b __ STA ACCU + 0 
26b5 : 85 1c __ STA ACCU + 1 
26b7 : 60 __ __ RTS
26b8 : a5 12 __ LDA P5 
26ba : 30 3a __ BMI $26f6
26bc : 05 11 __ ORA P4 
26be : f0 36 __ BEQ $26f6
26c0 : a9 00 __ LDA #$00
26c2 : 85 43 __ STA T2 + 0 
26c4 : 85 44 __ STA T2 + 1 
26c6 : 18 __ __ CLC
26c7 : a5 0f __ LDA P2 
26c9 : 65 43 __ ADC T2 + 0 
26cb : 85 45 __ STA T4 + 0 
26cd : a5 10 __ LDA P3 
26cf : 65 44 __ ADC T2 + 1 
26d1 : 85 46 __ STA T4 + 1 
26d3 : a0 00 __ LDY #$00
26d5 : b1 45 __ LDA (T4 + 0),y 
26d7 : 85 0d __ STA P0 
26d9 : 20 12 27 JSR $2712 ; (krnio_chrout + 0)
26dc : e6 43 __ INC T2 + 0 
26de : d0 02 __ BNE $26e2
26e0 : e6 44 __ INC T2 + 1 
26e2 : a5 12 __ LDA P5 
26e4 : 49 80 __ EOR #$80
26e6 : 85 03 __ STA WORK + 0 
26e8 : a5 44 __ LDA T2 + 1 
26ea : 49 80 __ EOR #$80
26ec : c5 03 __ CMP WORK + 0 
26ee : d0 04 __ BNE $26f4
26f0 : a5 43 __ LDA T2 + 0 
26f2 : c5 11 __ CMP P4 
26f4 : 90 d0 __ BCC $26c6
26f6 : 20 fb 0d JSR $0dfb ; (krnio_clrchn + 0)
26f9 : a5 11 __ LDA P4 
26fb : 85 1b __ STA ACCU + 0 
26fd : a5 12 __ LDA P5 
26ff : 4c b5 26 JMP $26b5 ; (krnio_write + 15)
--------------------------------------------------------------------
krnio_chkout:
2702 : a6 0d __ LDX P0 
2704 : 20 c9 ff JSR $ffc9 
2707 : a9 00 __ LDA #$00
2709 : 85 1c __ STA ACCU + 1 
270b : b0 02 __ BCS $270f
270d : a9 01 __ LDA #$01
270f : 85 1b __ STA ACCU + 0 
2711 : 60 __ __ RTS
--------------------------------------------------------------------
krnio_chrout:
2712 : a5 0d __ LDA P0 
2714 : 20 d2 ff JSR $ffd2 
2717 : 85 1b __ STA ACCU + 0 
2719 : a9 00 __ LDA #$00
271b : 85 1c __ STA ACCU + 1 
271d : 60 __ __ RTS
--------------------------------------------------------------------
krnio_clrchn:
0dfb : 20 cc ff JSR $ffcc 
0dfe : 60 __ __ RTS
--------------------------------------------------------------------
krnio_close:
0efa : a5 0d __ LDA P0 
0efc : 20 c3 ff JSR $ffc3 
0eff : 60 __ __ RTS
--------------------------------------------------------------------
sound_effect_info_hide:
271e : a9 80 __ LDA #$80
2720 : 85 43 __ STA T0 + 0 
2722 : a9 00 __ LDA #$00
2724 : 85 44 __ STA T0 + 1 
2726 : 85 45 __ STA T1 + 0 
2728 : 85 46 __ STA T1 + 1 
272a : 85 47 __ STA T2 + 0 
272c : a2 1a __ LDX #$1a
272e : a0 00 __ LDY #$00
2730 : 18 __ __ CLC
2731 : a9 be __ LDA #$be
2733 : 65 45 __ ADC T1 + 0 
2735 : 85 48 __ STA T4 + 0 
2737 : a9 3c __ LDA #$3c
2739 : 65 46 __ ADC T1 + 1 
273b : 85 49 __ STA T4 + 1 
273d : b1 48 __ LDA (T4 + 0),y 
273f : 85 4a __ STA T5 + 0 
2741 : a5 43 __ LDA T0 + 0 
2743 : 85 48 __ STA T4 + 0 
2745 : 18 __ __ CLC
2746 : a9 04 __ LDA #$04
2748 : 65 44 __ ADC T0 + 1 
274a : 85 49 __ STA T4 + 1 
274c : a5 4a __ LDA T5 + 0 
274e : 91 48 __ STA (T4 + 0),y 
2750 : 18 __ __ CLC
2751 : a9 a6 __ LDA #$a6
2753 : 65 45 __ ADC T1 + 0 
2755 : 85 48 __ STA T4 + 0 
2757 : a9 40 __ LDA #$40
2759 : 65 46 __ ADC T1 + 1 
275b : 85 49 __ STA T4 + 1 
275d : b1 48 __ LDA (T4 + 0),y 
275f : 85 4a __ STA T5 + 0 
2761 : a5 43 __ LDA T0 + 0 
2763 : 85 48 __ STA T4 + 0 
2765 : 18 __ __ CLC
2766 : a9 d8 __ LDA #$d8
2768 : 65 44 __ ADC T0 + 1 
276a : 85 49 __ STA T4 + 1 
276c : a5 4a __ LDA T5 + 0 
276e : 91 48 __ STA (T4 + 0),y 
2770 : e6 45 __ INC T1 + 0 
2772 : d0 02 __ BNE $2776
2774 : e6 46 __ INC T1 + 1 
2776 : e6 43 __ INC T0 + 0 
2778 : d0 02 __ BNE $277c
277a : e6 44 __ INC T0 + 1 
277c : ca __ __ DEX
277d : d0 b1 __ BNE $2730
277f : 18 __ __ CLC
2780 : a5 43 __ LDA T0 + 0 
2782 : 69 0e __ ADC #$0e
2784 : 85 43 __ STA T0 + 0 
2786 : 90 02 __ BCC $278a
2788 : e6 44 __ INC T0 + 1 
278a : e6 47 __ INC T2 + 0 
278c : a5 47 __ LDA T2 + 0 
278e : c9 0f __ CMP #$0f
2790 : 90 9a __ BCC $272c
2792 : 60 __ __ RTS
--------------------------------------------------------------------
sound_bank_window_init:
0ffa : 4c 93 27 JMP $2793 ; (sound_bank_init + 0)
--------------------------------------------------------------------
sound_bank_init:
2793 : a9 8e __ LDA #$8e
2795 : 85 43 __ STA T1 + 0 
2797 : a9 44 __ LDA #$44
2799 : 85 44 __ STA T1 + 1 
279b : a2 30 __ LDX #$30
279d : a9 1d __ LDA #$1d
279f : a0 00 __ LDY #$00
27a1 : 91 43 __ STA (T1 + 0),y 
27a3 : a9 80 __ LDA #$80
27a5 : c8 __ __ INY
27a6 : 91 43 __ STA (T1 + 0),y 
27a8 : a9 00 __ LDA #$00
27aa : c8 __ __ INY
27ab : 91 43 __ STA (T1 + 0),y 
27ad : a9 21 __ LDA #$21
27af : c8 __ __ INY
27b0 : 91 43 __ STA (T1 + 0),y 
27b2 : a9 00 __ LDA #$00
27b4 : c8 __ __ INY
27b5 : 91 43 __ STA (T1 + 0),y 
27b7 : a9 f0 __ LDA #$f0
27b9 : c8 __ __ INY
27ba : 91 43 __ STA (T1 + 0),y 
27bc : a9 00 __ LDA #$00
27be : c8 __ __ INY
27bf : 91 43 __ STA (T1 + 0),y 
27c1 : c8 __ __ INY
27c2 : 91 43 __ STA (T1 + 0),y 
27c4 : c8 __ __ INY
27c5 : 91 43 __ STA (T1 + 0),y 
27c7 : c8 __ __ INY
27c8 : 91 43 __ STA (T1 + 0),y 
27ca : a9 08 __ LDA #$08
27cc : c8 __ __ INY
27cd : 91 43 __ STA (T1 + 0),y 
27cf : c8 __ __ INY
27d0 : 91 43 __ STA (T1 + 0),y 
27d2 : 18 __ __ CLC
27d3 : a5 43 __ LDA T1 + 0 
27d5 : 69 0c __ ADC #$0c
27d7 : 85 43 __ STA T1 + 0 
27d9 : 90 02 __ BCC $27dd
27db : e6 44 __ INC T1 + 1 
27dd : ca __ __ DEX
27de : d0 bd __ BNE $279d
27e0 : 60 __ __ RTS
--------------------------------------------------------------------
sound_bank:
448e : __ __ __ BSS	576
--------------------------------------------------------------------
sound_bank_window_mainloop:
2800 : 20 21 28 JSR $2821 ; (sound_bank_window_show + 0)
2803 : 20 ec 29 JSR $29ec ; (sound_bank_window_process_keyboard_events + 0)
2806 : a5 1b __ LDA ACCU + 0 
2808 : d0 10 __ BNE $281a
280a : 20 7e 1f JSR $1f7e ; (sidfx_loop + 0)
280d : ad 11 d0 LDA $d011 
2810 : 30 fb __ BMI $280d
2812 : ad 11 d0 LDA $d011 
2815 : 10 fb __ BPL $2812
2817 : 4c 03 28 JMP $2803 ; (sound_bank_window_mainloop + 3)
281a : a9 00 __ LDA #$00
281c : 85 0d __ STA P0 
281e : 4c 0c 22 JMP $220c ; (change_main_scene_to + 0)
--------------------------------------------------------------------
sound_bank_window_show:
2821 : a9 0b __ LDA #$0b
2823 : 85 0d __ STA P0 
2825 : 20 d8 13 JSR $13d8 ; (clear_screen + 0)
2828 : a9 79 __ LDA #$79
282a : 85 0d __ STA P0 
282c : a9 37 __ LDA #$37
282e : 85 0e __ STA P1 
2830 : 20 46 28 JSR $2846 ; (copy_to_screen + 0)
2833 : ad ff 0c LDA $0cff ; (column + 0)
2836 : 0a __ __ ASL
2837 : 0a __ __ ASL
2838 : 0a __ __ ASL
2839 : 0a __ __ ASL
283a : 18 __ __ CLC
283b : 6d ff 0d ADC $0dff ; (row + 0)
283e : 85 0f __ STA P2 
2840 : 20 aa 28 JSR $28aa ; (sound_bank_window_store_sfx + 0)
2843 : 4c 1a 29 JMP $291a ; (sound_bank_window_select_option + 0)
--------------------------------------------------------------------
copy_to_screen:
2846 : a9 00 __ LDA #$00
2848 : 85 43 __ STA T0 + 0 
284a : 18 __ __ CLC
284b : a5 43 __ LDA T0 + 0 
284d : 65 0d __ ADC P0 
284f : 85 44 __ STA T3 + 0 
2851 : a5 0e __ LDA P1 
2853 : 69 00 __ ADC #$00
2855 : 85 45 __ STA T3 + 1 
2857 : a4 43 __ LDY T0 + 0 
2859 : b1 0d __ LDA (P0),y 
285b : 99 00 04 STA $0400,y 
285e : a9 0b __ LDA #$0b
2860 : 99 00 d8 STA $d800,y 
2863 : a0 fa __ LDY #$fa
2865 : b1 44 __ LDA (T3 + 0),y 
2867 : a6 43 __ LDX T0 + 0 
2869 : 9d fa 04 STA $04fa,x 
286c : a9 0b __ LDA #$0b
286e : 9d fa d8 STA $d8fa,x 
2871 : 18 __ __ CLC
2872 : a5 44 __ LDA T3 + 0 
2874 : 69 f4 __ ADC #$f4
2876 : 85 1f __ STA ADDR + 0 
2878 : a5 45 __ LDA T3 + 1 
287a : 69 01 __ ADC #$01
287c : 85 20 __ STA ADDR + 1 
287e : a0 00 __ LDY #$00
2880 : b1 1f __ LDA (ADDR + 0),y 
2882 : 9d f4 05 STA $05f4,x 
2885 : a9 0b __ LDA #$0b
2887 : 9d f4 d9 STA $d9f4,x 
288a : 18 __ __ CLC
288b : a5 44 __ LDA T3 + 0 
288d : 69 ee __ ADC #$ee
288f : 85 1f __ STA ADDR + 0 
2891 : a5 45 __ LDA T3 + 1 
2893 : 69 02 __ ADC #$02
2895 : 85 20 __ STA ADDR + 1 
2897 : b1 1f __ LDA (ADDR + 0),y 
2899 : 9d ee 06 STA $06ee,x 
289c : a9 0b __ LDA #$0b
289e : 9d ee da STA $daee,x 
28a1 : e6 43 __ INC T0 + 0 
28a3 : a5 43 __ LDA T0 + 0 
28a5 : c9 fa __ CMP #$fa
28a7 : 90 a1 __ BCC $284a
28a9 : 60 __ __ RTS
--------------------------------------------------------------------
sound_bank_view_data:
3779 : __ __ __ BYT 3a 1a 05 12 0f 20 20 20 20 20 20 20 20 3a 13 09 : :....        :..
3789 : __ __ __ BYT 18 14 05 05 0e 20 20 20 20 20 3a 14 08 09 12 14 : .....     :.....
3799 : __ __ __ BYT 19 20 14 17 0f 20 20 20 3a 0f 0e 05 20 20 20 20 : . ...   :...    
37a9 : __ __ __ BYT 20 20 20 20 20 3a 13 05 16 05 0e 14 05 05 0e 20 :      :......... 
37b9 : __ __ __ BYT 20 20 3a 14 08 09 12 14 19 20 14 08 12 05 05 20 :   :...... ..... 
37c9 : __ __ __ BYT 3a 14 17 0f 20 20 20 20 20 20 20 20 20 20 05 09 : :...          ..
37d9 : __ __ __ BYT 07 08 14 05 05 0e 20 20 20 20 3a 14 08 09 12 14 : ......    :.....
37e9 : __ __ __ BYT 19 20 06 0f 15 12 20 20 3a 14 08 12 05 05 20 20 : . ....  :.....  
37f9 : __ __ __ BYT 20 20 20 20 20 20 0e 09 0e 05 14 05 05 0e 20 20 :       ........  
3809 : __ __ __ BYT 20 20 3a 14 08 09 12 14 19 20 06 09 16 05 20 20 :   :...... ....  
3819 : __ __ __ BYT 3a 06 0f 15 12 20 20 20 20 20 20 20 20 20 14 17 : :....         ..
3829 : __ __ __ BYT 05 0e 14 19 20 20 20 20 20 20 3a 14 08 09 12 14 : ....      :.....
3839 : __ __ __ BYT 19 20 13 09 18 20 20 20 3a 06 09 16 05 20 20 20 : . ...   :....   
3849 : __ __ __ BYT 20 20 20 20 20 20 14 17 05 0e 14 19 20 0f 0e 05 :       ...... ...
3859 : __ __ __ BYT 20 20 3a 14 08 09 12 14 19 20 13 05 16 05 0e 20 :   :...... ..... 
3869 : __ __ __ BYT 3a 13 09 18 20 20 20 20 20 20 20 20 20 20 14 17 : :...          ..
3879 : __ __ __ BYT 05 0e 14 19 20 14 17 0f 20 20 20 14 08 09 12 14 : .... ...   .....
3889 : __ __ __ BYT 19 20 05 09 07 08 14 20 20 13 05 16 05 0e 20 20 : . .....  .....  
3899 : __ __ __ BYT 20 20 20 20 20 20 14 17 05 0e 14 19 20 14 08 12 :       ...... ...
38a9 : __ __ __ BYT 05 05 20 14 08 09 12 14 19 20 0e 09 0e 05 20 20 : .. ...... ....  
38b9 : __ __ __ BYT 20 05 09 07 08 14 20 20 20 20 20 20 20 20 14 17 :  .....        ..
38c9 : __ __ __ BYT 05 0e 14 19 20 06 0f 15 12 20 20 06 0f 15 12 14 : .... ....  .....
38d9 : __ __ __ BYT 19 20 20 20 20 20 20 20 20 0e 09 0e 05 20 20 20 : .        ....   
38e9 : __ __ __ BYT 20 20 20 20 20 3a 14 17 05 0e 14 19 20 06 09 16 :      :...... ...
38f9 : __ __ __ BYT 05 20 20 06 0f 15 12 14 19 20 0f 0e 05 20 20 20 : .  ...... ...   
3909 : __ __ __ BYT 20 14 05 0e 20 20 20 20 20 20 20 20 20 20 14 17 :  ...          ..
3919 : __ __ __ BYT 05 0e 14 19 20 13 09 18 20 20 20 06 0f 0f 12 14 : .... ...   .....
3929 : __ __ __ BYT 19 20 14 17 0f 20 20 20 20 05 0c 05 16 05 0e 20 : . ...    ...... 
3939 : __ __ __ BYT 20 20 20 20 20 20 14 17 05 0e 14 19 20 13 05 16 :       ...... ...
3949 : __ __ __ BYT 05 0e 20 06 0f 15 12 14 19 20 14 08 12 05 05 20 : .. ...... ..... 
3959 : __ __ __ BYT 20 14 17 05 0c 16 05 20 20 20 20 20 20 20 14 17 :  ......       ..
3969 : __ __ __ BYT 05 0e 14 19 20 05 09 07 08 14 20 06 0f 15 12 14 : .... ..... .....
3979 : __ __ __ BYT 19 20 06 0f 15 12 20 20 20 14 08 09 12 14 05 05 : . ....   .......
3989 : __ __ __ BYT 0e 20 20 20 20 20 14 17 05 0e 14 19 20 0e 09 0e : .     ...... ...
3999 : __ __ __ BYT 05 20 20 06 0f 15 12 14 19 20 06 09 16 05 20 20 : .  ...... ....  
39a9 : __ __ __ BYT 20 06 0f 15 12 14 05 05 0e 20 20 20 20 20 14 08 :  ........     ..
39b9 : __ __ __ BYT 09 12 14 19 20 20 20 20 20 20 20 06 0f 15 12 14 : ....       .....
39c9 : __ __ __ BYT 19 20 13 09 18 20 20 20 20 06 09 06 14 05 05 0e : . ...    .......
39d9 : __ __ __ BYT 20 20 20 20 20 20 14 08 09 12 14 19 20 0f 0e 05 :       ...... ...
39e9 : __ __ __ BYT 20 20 20 06 0f 15 12 14 19 20 13 05 16 05 0e 20 :    ...... ..... 
39f9 : __ __ __ BYT 20 20 20 20 20 20 20 20 20 20 20 20 20 20 20 20 :                 
3a09 : __ __ __ BYT 20 20 20 20 20 20 20 20 20 20 20 20 20 20 20 20 :                 
3a19 : __ __ __ BYT 20 20 20 20 20 20 20 20 2d 2d 2d 2d 2d 2d 2d 2d :         --------
3a29 : __ __ __ BYT 2d 2d 2d 2d 2d 2d 2d 2d 2d 2d 2d 2d 2d 2d 2d 2d : ----------------
3a39 : __ __ __ BYT 2d 2d 2d 2d 2d 2d 2d 2d 2d 2d 2d 2d 2d 2d 2d 20 : --------------- 
3a49 : __ __ __ BYT 20 20 20 20 20 20 20 20 20 20 20 20 20 20 20 20 :                 
3a59 : __ __ __ BYT 20 20 20 20 20 20 20 20 20 20 20 20 20 20 20 20 :                 
3a69 : __ __ __ BYT 20 20 20 20 20 20 20 20 20 20 20 20 20 20 20 20 :                 
3a79 : __ __ __ BYT 20 20 20 28 09 29 20 09 0e 06 0f 20 20 20 20 20 :    (.) ....     
3a89 : __ __ __ BYT 20 20 20 20 20 20 20 20 20 20 20 20 20 20 20 20 :                 
3a99 : __ __ __ BYT 20 20 20 20 20 20 20 20 20 20 20 28 05 29 20 05 :            (.) .
3aa9 : __ __ __ BYT 04 09 14 20 20 20 20 20 20 20 20 20 20 20 20 20 : ...             
3ab9 : __ __ __ BYT 20 20 20 20 20 20 20 20 20 20 20 20 20 20 20 20 :                 
3ac9 : __ __ __ BYT 20 20 20 28 12 29 20 12 05 0e 01 0d 05 20 20 20 :    (.) ......   
3ad9 : __ __ __ BYT 20 20 20 20 20 20 20 20 20 20 20 20 20 20 20 20 :                 
3ae9 : __ __ __ BYT 20 20 20 20 20 20 20 20 20 20 20 28 02 29 20 02 :            (.) .
3af9 : __ __ __ BYT 01 0e 0b 20 0c 0f 01 04 2f 13 01 16 05 20 20 20 : ... ..../....   
3b09 : __ __ __ BYT 20 20 20 20 20 20 20 20 20 20 20 20 20 20 20 20 :                 
3b19 : __ __ __ BYT 20 20 20 20 20 20 20 20 20 20 20 20 20 20 20 20 :                 
3b29 : __ __ __ BYT 20 20 20 20 20 20 20 20 20 20 20 20 20 20 20 20 :                 
3b39 : __ __ __ BYT 20 20 20 20 20 20 20 20 20 20 20 20 20 20 20 20 :                 
3b49 : __ __ __ BYT 20 20 20 20 20 20 20 20 20 20 20 20 20 20 20 20 :                 
3b59 : __ __ __ BYT 20 20 20 20 20 20 20 20                         :         
--------------------------------------------------------------------
column:
0cff : __ __ __ BYT 00                                              : .
--------------------------------------------------------------------
row:
0dff : __ __ __ BYT 00                                              : .
--------------------------------------------------------------------
sound_bank_window_store_sfx:
28aa : ad c0 31 LDA $31c0 ; (SIDFXExplosion + 0)
28ad : 85 0d __ STA P0 
28af : ad c1 31 LDA $31c1 ; (SIDFXExplosion + 1)
28b2 : 85 0e __ STA P1 
28b4 : 20 09 18 JSR $1809 ; (find_note + 0)
28b7 : a5 0f __ LDA P2 
28b9 : 0a __ __ ASL
28ba : 65 0f __ ADC P2 
28bc : 0a __ __ ASL
28bd : 85 43 __ STA T0 + 0 
28bf : a9 00 __ LDA #$00
28c1 : 2a __ __ ROL
28c2 : 06 43 __ ASL T0 + 0 
28c4 : 2a __ __ ROL
28c5 : aa __ __ TAX
28c6 : a9 8e __ LDA #$8e
28c8 : 65 43 __ ADC T0 + 0 
28ca : 85 43 __ STA T0 + 0 
28cc : 8a __ __ TXA
28cd : 69 44 __ ADC #$44
28cf : 85 44 __ STA T0 + 1 
28d1 : a5 1b __ LDA ACCU + 0 
28d3 : a0 00 __ LDY #$00
28d5 : 91 43 __ STA (T0 + 0),y 
28d7 : ad c2 31 LDA $31c2 ; (SIDFXExplosion + 2)
28da : c8 __ __ INY
28db : 91 43 __ STA (T0 + 0),y 
28dd : ad c3 31 LDA $31c3 ; (SIDFXExplosion + 3)
28e0 : c8 __ __ INY
28e1 : 91 43 __ STA (T0 + 0),y 
28e3 : ad c4 31 LDA $31c4 ; (SIDFXExplosion + 4)
28e6 : c8 __ __ INY
28e7 : 91 43 __ STA (T0 + 0),y 
28e9 : ad c5 31 LDA $31c5 ; (SIDFXExplosion + 5)
28ec : c8 __ __ INY
28ed : 91 43 __ STA (T0 + 0),y 
28ef : ad c6 31 LDA $31c6 ; (SIDFXExplosion + 6)
28f2 : c8 __ __ INY
28f3 : 91 43 __ STA (T0 + 0),y 
28f5 : ad c7 31 LDA $31c7 ; (SIDFXExplosion + 7)
28f8 : c8 __ __ INY
28f9 : 91 43 __ STA (T0 + 0),y 
28fb : ad c8 31 LDA $31c8 ; (SIDFXExplosion + 8)
28fe : c8 __ __ INY
28ff : 91 43 __ STA (T0 + 0),y 
2901 : ad c9 31 LDA $31c9 ; (SIDFXExplosion + 9)
2904 : c8 __ __ INY
2905 : 91 43 __ STA (T0 + 0),y 
2907 : ad ca 31 LDA $31ca ; (SIDFXExplosion + 10)
290a : c8 __ __ INY
290b : 91 43 __ STA (T0 + 0),y 
290d : ad cb 31 LDA $31cb ; (SIDFXExplosion + 11)
2910 : c8 __ __ INY
2911 : 91 43 __ STA (T0 + 0),y 
2913 : ad cc 31 LDA $31cc ; (SIDFXExplosion + 12)
2916 : c8 __ __ INY
2917 : 91 43 __ STA (T0 + 0),y 
2919 : 60 __ __ RTS
--------------------------------------------------------------------
sound_bank_window_select_option:
291a : ad ff 0d LDA $0dff ; (row + 0)
291d : 85 43 __ STA T0 + 0 
291f : 0a __ __ ASL
2920 : 85 07 __ STA WORK + 4 
2922 : a9 00 __ LDA #$00
2924 : 2a __ __ ROL
2925 : 06 07 __ ASL WORK + 4 
2927 : 2a __ __ ROL
2928 : aa __ __ TAX
2929 : a5 07 __ LDA WORK + 4 
292b : 6d ff 0d ADC $0dff ; (row + 0)
292e : 85 45 __ STA T1 + 0 
2930 : 8a __ __ TXA
2931 : 69 00 __ ADC #$00
2933 : 06 45 __ ASL T1 + 0 
2935 : 2a __ __ ROL
2936 : 06 45 __ ASL T1 + 0 
2938 : 2a __ __ ROL
2939 : 06 45 __ ASL T1 + 0 
293b : 2a __ __ ROL
293c : 85 46 __ STA T1 + 1 
293e : ad ff 0c LDA $0cff ; (column + 0)
2941 : 85 44 __ STA T2 + 0 
2943 : 85 1b __ STA ACCU + 0 
2945 : a9 00 __ LDA #$00
2947 : 85 1c __ STA ACCU + 1 
2949 : a9 0d __ LDA #$0d
294b : 20 d1 30 JSR $30d1 ; (mul16by8 + 0)
294e : 18 __ __ CLC
294f : a5 05 __ LDA WORK + 2 
2951 : 65 45 __ ADC T1 + 0 
2953 : aa __ __ TAX
2954 : a5 06 __ LDA WORK + 3 
2956 : 65 46 __ ADC T1 + 1 
2958 : a8 __ __ TAY
2959 : 8a __ __ TXA
295a : 18 __ __ CLC
295b : 69 01 __ ADC #$01
295d : 85 45 __ STA T1 + 0 
295f : 98 __ __ TYA
2960 : 69 d8 __ ADC #$d8
2962 : 85 46 __ STA T1 + 1 
2964 : a0 00 __ LDY #$00
2966 : a9 0f __ LDA #$0f
2968 : 91 45 __ STA (T1 + 0),y 
296a : c8 __ __ INY
296b : c0 0c __ CPY #$0c
296d : 90 f9 __ BCC $2968
296f : a5 44 __ LDA T2 + 0 
2971 : 0a __ __ ASL
2972 : 0a __ __ ASL
2973 : 0a __ __ ASL
2974 : 0a __ __ ASL
2975 : 18 __ __ CLC
2976 : 65 43 __ ADC T0 + 0 
2978 : 85 0d __ STA P0 
297a : 4c 7d 29 JMP $297d ; (sound_bank_window_restore_sfx + 0)
--------------------------------------------------------------------
sound_bank_window_restore_sfx:
297d : a5 0d __ LDA P0 
297f : 0a __ __ ASL
2980 : 65 0d __ ADC P0 
2982 : 0a __ __ ASL
2983 : 85 43 __ STA T1 + 0 
2985 : a9 00 __ LDA #$00
2987 : 2a __ __ ROL
2988 : 06 43 __ ASL T1 + 0 
298a : 2a __ __ ROL
298b : aa __ __ TAX
298c : a9 8e __ LDA #$8e
298e : 65 43 __ ADC T1 + 0 
2990 : 85 43 __ STA T1 + 0 
2992 : 8a __ __ TXA
2993 : 69 44 __ ADC #$44
2995 : 85 44 __ STA T1 + 1 
2997 : a0 00 __ LDY #$00
2999 : b1 43 __ LDA (T1 + 0),y 
299b : 0a __ __ ASL
299c : aa __ __ TAX
299d : bd 00 33 LDA $3300,x ; (notes_pal_table + 0)
29a0 : 8d c0 31 STA $31c0 ; (SIDFXExplosion + 0)
29a3 : bd 01 33 LDA $3301,x ; (notes_pal_table + 1)
29a6 : 8d c1 31 STA $31c1 ; (SIDFXExplosion + 1)
29a9 : c8 __ __ INY
29aa : b1 43 __ LDA (T1 + 0),y 
29ac : 8d c2 31 STA $31c2 ; (SIDFXExplosion + 2)
29af : c8 __ __ INY
29b0 : b1 43 __ LDA (T1 + 0),y 
29b2 : 8d c3 31 STA $31c3 ; (SIDFXExplosion + 3)
29b5 : c8 __ __ INY
29b6 : b1 43 __ LDA (T1 + 0),y 
29b8 : 8d c4 31 STA $31c4 ; (SIDFXExplosion + 4)
29bb : c8 __ __ INY
29bc : b1 43 __ LDA (T1 + 0),y 
29be : 8d c5 31 STA $31c5 ; (SIDFXExplosion + 5)
29c1 : c8 __ __ INY
29c2 : b1 43 __ LDA (T1 + 0),y 
29c4 : 8d c6 31 STA $31c6 ; (SIDFXExplosion + 6)
29c7 : c8 __ __ INY
29c8 : b1 43 __ LDA (T1 + 0),y 
29ca : 8d c7 31 STA $31c7 ; (SIDFXExplosion + 7)
29cd : c8 __ __ INY
29ce : b1 43 __ LDA (T1 + 0),y 
29d0 : 8d c8 31 STA $31c8 ; (SIDFXExplosion + 8)
29d3 : c8 __ __ INY
29d4 : b1 43 __ LDA (T1 + 0),y 
29d6 : 8d c9 31 STA $31c9 ; (SIDFXExplosion + 9)
29d9 : c8 __ __ INY
29da : b1 43 __ LDA (T1 + 0),y 
29dc : 8d ca 31 STA $31ca ; (SIDFXExplosion + 10)
29df : c8 __ __ INY
29e0 : b1 43 __ LDA (T1 + 0),y 
29e2 : 8d cb 31 STA $31cb ; (SIDFXExplosion + 11)
29e5 : c8 __ __ INY
29e6 : b1 43 __ LDA (T1 + 0),y 
29e8 : 8d cc 31 STA $31cc ; (SIDFXExplosion + 12)
29eb : 60 __ __ RTS
--------------------------------------------------------------------
sound_bank_window_process_keyboard_events:
29ec : 38 __ __ SEC
29ed : a5 23 __ LDA SP + 0 
29ef : e9 03 __ SBC #$03
29f1 : 85 23 __ STA SP + 0 
29f3 : b0 02 __ BCS $29f7
29f5 : c6 24 __ DEC SP + 1 
29f7 : 20 6f 1e JSR $1e6f ; (keyb_poll + 0)
29fa : ad fc 31 LDA $31fc ; (keyb_key + 0)
29fd : 29 7f __ AND #$7f
29ff : aa __ __ TAX
2a00 : bd 00 35 LDA $3500,x ; (keyb_codes + 0)
2a03 : c9 65 __ CMP #$65
2a05 : f0 08 __ BEQ $2a0f
2a07 : c9 1b __ CMP #$1b
2a09 : f0 04 __ BEQ $2a0f
2a0b : c9 5f __ CMP #$5f
2a0d : d0 05 __ BNE $2a14
2a0f : a9 01 __ LDA #$01
2a11 : 4c a5 2a JMP $2aa5 ; (sound_bank_window_process_keyboard_events + 185)
2a14 : c9 91 __ CMP #$91
2a16 : d0 06 __ BNE $2a1e
2a18 : 20 e1 27 JSR $27e1 ; (sound_bank_window_go_up + 0)
2a1b : 4c b3 2a JMP $2ab3 ; (sound_bank_window_process_keyboard_events + 199)
2a1e : c9 11 __ CMP #$11
2a20 : d0 06 __ BNE $2a28
2a22 : 20 37 2b JSR $2b37 ; (sound_bank_window_go_down + 0)
2a25 : 4c b3 2a JMP $2ab3 ; (sound_bank_window_process_keyboard_events + 199)
2a28 : c9 9d __ CMP #$9d
2a2a : d0 06 __ BNE $2a32
2a2c : 20 4c 2b JSR $2b4c ; (sound_bank_window_go_left + 0)
2a2f : 4c b3 2a JMP $2ab3 ; (sound_bank_window_process_keyboard_events + 199)
2a32 : c9 1d __ CMP #$1d
2a34 : d0 06 __ BNE $2a3c
2a36 : 20 61 2b JSR $2b61 ; (sound_bank_window_go_right + 0)
2a39 : 4c b3 2a JMP $2ab3 ; (sound_bank_window_process_keyboard_events + 199)
2a3c : c9 0d __ CMP #$0d
2a3e : f0 73 __ BEQ $2ab3
2a40 : c9 20 __ CMP #$20
2a42 : f0 6f __ BEQ $2ab3
2a44 : c9 69 __ CMP #$69
2a46 : d0 0c __ BNE $2a54
2a48 : a9 01 __ LDA #$01
2a4a : a0 02 __ LDY #$02
2a4c : 91 23 __ STA (SP + 0),y 
2a4e : 20 76 2b JSR $2b76 ; (run_as_child + 0)
2a51 : 4c a3 2a JMP $2aa3 ; (sound_bank_window_process_keyboard_events + 183)
2a54 : c9 62 __ CMP #$62
2a56 : d0 1a __ BNE $2a72
2a58 : a9 03 __ LDA #$03
2a5a : a0 02 __ LDY #$02
2a5c : 91 23 __ STA (SP + 0),y 
2a5e : 20 76 2b JSR $2b76 ; (run_as_child + 0)
2a61 : a9 79 __ LDA #$79
2a63 : 85 0d __ STA P0 
2a65 : a9 37 __ LDA #$37
2a67 : 85 0e __ STA P1 
2a69 : 20 46 28 JSR $2846 ; (copy_to_screen + 0)
2a6c : 20 1a 29 JSR $291a ; (sound_bank_window_select_option + 0)
2a6f : 4c a3 2a JMP $2aa3 ; (sound_bank_window_process_keyboard_events + 183)
2a72 : c9 72 __ CMP #$72
2a74 : d0 2d __ BNE $2aa3
2a76 : a9 04 __ LDA #$04
2a78 : a0 02 __ LDY #$02
2a7a : 91 23 __ STA (SP + 0),y 
2a7c : ad ff 0c LDA $0cff ; (column + 0)
2a7f : 85 1b __ STA ACCU + 0 
2a81 : a9 00 __ LDA #$00
2a83 : 85 1c __ STA ACCU + 1 
2a85 : a9 0d __ LDA #$0d
2a87 : 20 d1 30 JSR $30d1 ; (mul16by8 + 0)
2a8a : 18 __ __ CLC
2a8b : a5 05 __ LDA WORK + 2 
2a8d : 69 01 __ ADC #$01
2a8f : 8d fd 31 STA $31fd ; (argv + 0)
2a92 : ad ff 0d LDA $0dff ; (row + 0)
2a95 : 8d fe 31 STA $31fe ; (argv + 1)
2a98 : a9 0c __ LDA #$0c
2a9a : 8d ff 31 STA $31ff ; (argv + 2)
2a9d : 20 76 2b JSR $2b76 ; (run_as_child + 0)
2aa0 : 20 8a 2b JSR $2b8a ; (copy_screen_name_to_view_buffor + 0)
2aa3 : a9 00 __ LDA #$00
2aa5 : 85 1b __ STA ACCU + 0 
2aa7 : 18 __ __ CLC
2aa8 : a5 23 __ LDA SP + 0 
2aaa : 69 03 __ ADC #$03
2aac : 85 23 __ STA SP + 0 
2aae : 90 02 __ BCC $2ab2
2ab0 : e6 24 __ INC SP + 1 
2ab2 : 60 __ __ RTS
2ab3 : ad d9 33 LDA $33d9 ; (channels + 25)
2ab6 : f0 29 __ BEQ $2ae1
2ab8 : ad cd 31 LDA $31cd ; (SIDFXExplosion + 13)
2abb : cd d8 33 CMP $33d8 ; (channels + 24)
2abe : 90 e3 __ BCC $2aa3
2ac0 : a2 01 __ LDX #$01
2ac2 : a9 00 __ LDA #$00
2ac4 : 8d d9 33 STA $33d9 ; (channels + 25)
2ac7 : 8d d7 33 STA $33d7 ; (channels + 23)
2aca : a9 c0 __ LDA #$c0
2acc : 8d d4 33 STA $33d4 ; (channels + 20)
2acf : a9 31 __ LDA #$31
2ad1 : 8d d5 33 STA $33d5 ; (channels + 21)
2ad4 : ad cd 31 LDA $31cd ; (SIDFXExplosion + 13)
2ad7 : 8d d8 33 STA $33d8 ; (channels + 24)
2ada : 8e d9 33 STX $33d9 ; (channels + 25)
2add : a9 00 __ LDA #$00
2adf : f0 c4 __ BEQ $2aa5
2ae1 : a2 03 __ LDX #$03
2ae3 : d0 dd __ BNE $2ac2
--------------------------------------------------------------------
sound_bank_window_go_up:
27e1 : 20 e5 2a JSR $2ae5 ; (sound_bank_window_deselect_option + 0)
27e4 : ce ff 0d DEC $0dff ; (row + 0)
27e7 : ad ff 0d LDA $0dff ; (row + 0)
27ea : c9 11 __ CMP #$11
27ec : 90 05 __ BCC $27f3
27ee : a9 0f __ LDA #$0f
27f0 : 8d ff 0d STA $0dff ; (row + 0)
27f3 : 4c 1a 29 JMP $291a ; (sound_bank_window_select_option + 0)
--------------------------------------------------------------------
sound_bank_window_deselect_option:
2ae5 : ad ff 0d LDA $0dff ; (row + 0)
2ae8 : 0a __ __ ASL
2ae9 : 85 07 __ STA WORK + 4 
2aeb : a9 00 __ LDA #$00
2aed : 2a __ __ ROL
2aee : 06 07 __ ASL WORK + 4 
2af0 : 2a __ __ ROL
2af1 : aa __ __ TAX
2af2 : a5 07 __ LDA WORK + 4 
2af4 : 6d ff 0d ADC $0dff ; (row + 0)
2af7 : 85 43 __ STA T1 + 0 
2af9 : 8a __ __ TXA
2afa : 69 00 __ ADC #$00
2afc : 06 43 __ ASL T1 + 0 
2afe : 2a __ __ ROL
2aff : 06 43 __ ASL T1 + 0 
2b01 : 2a __ __ ROL
2b02 : 06 43 __ ASL T1 + 0 
2b04 : 2a __ __ ROL
2b05 : 85 44 __ STA T1 + 1 
2b07 : ad ff 0c LDA $0cff ; (column + 0)
2b0a : 85 1b __ STA ACCU + 0 
2b0c : a9 00 __ LDA #$00
2b0e : 85 1c __ STA ACCU + 1 
2b10 : a9 0d __ LDA #$0d
2b12 : 20 d1 30 JSR $30d1 ; (mul16by8 + 0)
2b15 : 18 __ __ CLC
2b16 : a5 05 __ LDA WORK + 2 
2b18 : 65 43 __ ADC T1 + 0 
2b1a : aa __ __ TAX
2b1b : a5 06 __ LDA WORK + 3 
2b1d : 65 44 __ ADC T1 + 1 
2b1f : a8 __ __ TAY
2b20 : 8a __ __ TXA
2b21 : 18 __ __ CLC
2b22 : 69 01 __ ADC #$01
2b24 : 85 43 __ STA T1 + 0 
2b26 : 98 __ __ TYA
2b27 : 69 d8 __ ADC #$d8
2b29 : 85 44 __ STA T1 + 1 
2b2b : a0 00 __ LDY #$00
2b2d : a9 0b __ LDA #$0b
2b2f : 91 43 __ STA (T1 + 0),y 
2b31 : c8 __ __ INY
2b32 : c0 0c __ CPY #$0c
2b34 : 90 f9 __ BCC $2b2f
2b36 : 60 __ __ RTS
--------------------------------------------------------------------
sound_bank_window_go_down:
2b37 : 20 e5 2a JSR $2ae5 ; (sound_bank_window_deselect_option + 0)
2b3a : ee ff 0d INC $0dff ; (row + 0)
2b3d : ad ff 0d LDA $0dff ; (row + 0)
2b40 : c9 10 __ CMP #$10
2b42 : d0 05 __ BNE $2b49
2b44 : a9 00 __ LDA #$00
2b46 : 8d ff 0d STA $0dff ; (row + 0)
2b49 : 4c 1a 29 JMP $291a ; (sound_bank_window_select_option + 0)
--------------------------------------------------------------------
sound_bank_window_go_left:
2b4c : 20 e5 2a JSR $2ae5 ; (sound_bank_window_deselect_option + 0)
2b4f : ce ff 0c DEC $0cff ; (column + 0)
2b52 : ad ff 0c LDA $0cff ; (column + 0)
2b55 : c9 04 __ CMP #$04
2b57 : 90 05 __ BCC $2b5e
2b59 : a9 02 __ LDA #$02
2b5b : 8d ff 0c STA $0cff ; (column + 0)
2b5e : 4c 1a 29 JMP $291a ; (sound_bank_window_select_option + 0)
--------------------------------------------------------------------
sound_bank_window_go_right:
2b61 : 20 e5 2a JSR $2ae5 ; (sound_bank_window_deselect_option + 0)
2b64 : ee ff 0c INC $0cff ; (column + 0)
2b67 : ad ff 0c LDA $0cff ; (column + 0)
2b6a : c9 03 __ CMP #$03
2b6c : d0 05 __ BNE $2b73
2b6e : a9 00 __ LDA #$00
2b70 : 8d ff 0c STA $0cff ; (column + 0)
2b73 : 4c 1a 29 JMP $291a ; (sound_bank_window_select_option + 0)
--------------------------------------------------------------------
run_as_child:
2b76 : a0 02 __ LDY #$02
2b78 : b1 23 __ LDA (SP + 0),y 
2b7a : 0a __ __ ASL
2b7b : 0a __ __ ASL
2b7c : aa __ __ TAX
2b7d : bd e1 33 LDA $33e1,x ; (scene_tree + 3)
2b80 : 85 1b __ STA ACCU + 0 
2b82 : bd e2 33 LDA $33e2,x ; (scene_tree + 4)
2b85 : 85 1c __ STA ACCU + 1 
2b87 : 4c fd 0f JMP $0ffd ; (bcexec + 0)
--------------------------------------------------------------------
argv:
31fd : __ __ __ BSS	3
--------------------------------------------------------------------
copy_screen_name_to_view_buffor:
2b8a : ad ff 0d LDA $0dff ; (row + 0)
2b8d : 0a __ __ ASL
2b8e : 85 07 __ STA WORK + 4 
2b90 : a9 00 __ LDA #$00
2b92 : 2a __ __ ROL
2b93 : 06 07 __ ASL WORK + 4 
2b95 : 2a __ __ ROL
2b96 : aa __ __ TAX
2b97 : a5 07 __ LDA WORK + 4 
2b99 : 6d ff 0d ADC $0dff ; (row + 0)
2b9c : 85 43 __ STA T1 + 0 
2b9e : 8a __ __ TXA
2b9f : 69 00 __ ADC #$00
2ba1 : 06 43 __ ASL T1 + 0 
2ba3 : 2a __ __ ROL
2ba4 : 06 43 __ ASL T1 + 0 
2ba6 : 2a __ __ ROL
2ba7 : 06 43 __ ASL T1 + 0 
2ba9 : 2a __ __ ROL
2baa : 85 44 __ STA T1 + 1 
2bac : ad ff 0c LDA $0cff ; (column + 0)
2baf : 85 1b __ STA ACCU + 0 
2bb1 : a9 00 __ LDA #$00
2bb3 : 85 1c __ STA ACCU + 1 
2bb5 : a9 0d __ LDA #$0d
2bb7 : 20 d1 30 JSR $30d1 ; (mul16by8 + 0)
2bba : 18 __ __ CLC
2bbb : a5 05 __ LDA WORK + 2 
2bbd : 69 01 __ ADC #$01
2bbf : 18 __ __ CLC
2bc0 : 65 43 __ ADC T1 + 0 
2bc2 : aa __ __ TAX
2bc3 : 90 02 __ BCC $2bc7
2bc5 : e6 44 __ INC T1 + 1 
2bc7 : a0 00 __ LDY #$00
2bc9 : 84 45 __ STY T2 + 0 
2bcb : 8a __ __ TXA
2bcc : 18 __ __ CLC
2bcd : 65 45 __ ADC T2 + 0 
2bcf : 85 46 __ STA T3 + 0 
2bd1 : 85 48 __ STA T4 + 0 
2bd3 : a5 44 __ LDA T1 + 1 
2bd5 : 69 00 __ ADC #$00
2bd7 : 85 47 __ STA T3 + 1 
2bd9 : 18 __ __ CLC
2bda : 69 04 __ ADC #$04
2bdc : 85 49 __ STA T4 + 1 
2bde : 18 __ __ CLC
2bdf : a9 79 __ LDA #$79
2be1 : 65 46 __ ADC T3 + 0 
2be3 : 85 46 __ STA T3 + 0 
2be5 : a9 37 __ LDA #$37
2be7 : 65 47 __ ADC T3 + 1 
2be9 : 85 47 __ STA T3 + 1 
2beb : b1 48 __ LDA (T4 + 0),y 
2bed : 91 46 __ STA (T3 + 0),y 
2bef : e6 45 __ INC T2 + 0 
2bf1 : a5 45 __ LDA T2 + 0 
2bf3 : c9 0c __ CMP #$0c
2bf5 : 90 d4 __ BCC $2bcb
2bf7 : 60 __ __ RTS
--------------------------------------------------------------------
loader_window_mainloop:
2c00 : 20 1d 2c JSR $2c1d ; (loader_show_view + 0)
2c03 : 20 7b 2c JSR $2c7b ; (loader_process_keyboard_events + 0)
2c06 : a5 1b __ LDA ACCU + 0 
2c08 : d0 10 __ BNE $2c1a
2c0a : 20 7e 1f JSR $1f7e ; (sidfx_loop + 0)
2c0d : ad 11 d0 LDA $d011 
2c10 : 30 fb __ BMI $2c0d
2c12 : ad 11 d0 LDA $d011 
2c15 : 10 fb __ BPL $2c12
2c17 : 4c 03 2c JMP $2c03 ; (loader_window_mainloop + 3)
2c1a : 4c 5e 2f JMP $2f5e ; (loader_hide_view + 0)
--------------------------------------------------------------------
loader_show_view:
2c1d : a9 00 __ LDA #$00
2c1f : 85 43 __ STA T0 + 0 
2c21 : 85 45 __ STA T1 + 1 
2c23 : 85 46 __ STA T2 + 0 
2c25 : a9 d2 __ LDA #$d2
2c27 : 85 44 __ STA T1 + 0 
2c29 : a2 13 __ LDX #$13
2c2b : a5 44 __ LDA T1 + 0 
2c2d : 85 49 __ STA T8 + 0 
2c2f : 85 47 __ STA T6 + 0 
2c31 : 18 __ __ CLC
2c32 : a9 04 __ LDA #$04
2c34 : 65 45 __ ADC T1 + 1 
2c36 : 85 48 __ STA T6 + 1 
2c38 : a0 00 __ LDY #$00
2c3a : b1 47 __ LDA (T6 + 0),y 
2c3c : a4 43 __ LDY T0 + 0 
2c3e : 99 be 3c STA $3cbe,y ; (screen_char_backup + 0)
2c41 : 18 __ __ CLC
2c42 : a9 d8 __ LDA #$d8
2c44 : 65 45 __ ADC T1 + 1 
2c46 : 85 4a __ STA T8 + 1 
2c48 : a0 00 __ LDY #$00
2c4a : b1 49 __ LDA (T8 + 0),y 
2c4c : a4 43 __ LDY T0 + 0 
2c4e : 99 a6 40 STA $40a6,y ; (screen_color_backup + 0)
2c51 : b9 00 3c LDA $3c00,y ; (loader_window_ascii + 0)
2c54 : a0 00 __ LDY #$00
2c56 : 91 47 __ STA (T6 + 0),y 
2c58 : a9 0f __ LDA #$0f
2c5a : 91 49 __ STA (T8 + 0),y 
2c5c : e6 43 __ INC T0 + 0 
2c5e : e6 44 __ INC T1 + 0 
2c60 : d0 02 __ BNE $2c64
2c62 : e6 45 __ INC T1 + 1 
2c64 : ca __ __ DEX
2c65 : d0 c4 __ BNE $2c2b
2c67 : 18 __ __ CLC
2c68 : a5 44 __ LDA T1 + 0 
2c6a : 69 15 __ ADC #$15
2c6c : 85 44 __ STA T1 + 0 
2c6e : 90 02 __ BCC $2c72
2c70 : e6 45 __ INC T1 + 1 
2c72 : e6 46 __ INC T2 + 0 
2c74 : a5 46 __ LDA T2 + 0 
2c76 : c9 0a __ CMP #$0a
2c78 : 90 af __ BCC $2c29
2c7a : 60 __ __ RTS
--------------------------------------------------------------------
loader_window_ascii:
3c00 : __ __ __ BYT 5d 40 40 40 40 40 40 40 40 40 40 40 40 40 40 40 : ]@@@@@@@@@@@@@@@
3c10 : __ __ __ BYT 40 40 6e 5d 20 20 20 20 20 20 20 20 20 20 20 20 : @@n]            
3c20 : __ __ __ BYT 20 20 20 20 20 5d 5d 20 13 0f 15 0e 04 02 01 0e :      ]] ........
3c30 : __ __ __ BYT 0b 30 30 2e 13 02 0b 20 5d 5d 20 20 20 20 20 20 : .00.... ]]      
3c40 : __ __ __ BYT 20 20 20 20 20 20 20 20 20 20 20 5d 5d 20 20 20 :            ]]   
3c50 : __ __ __ BYT 20 20 20 20 20 20 20 20 20 20 20 20 20 20 5d 5d :               ]]
3c60 : __ __ __ BYT 20 28 0c 29 20 0c 0f 01 04 20 20 20 20 20 20 20 :  (.) ....       
3c70 : __ __ __ BYT 20 5d 5d 20 28 13 29 20 13 01 16 05 20 20 20 20 :  ]] (.) ....    
3c80 : __ __ __ BYT 20 20 20 20 5d 5d 20 20 20 20 20 20 20 20 20 20 :     ]]          
3c90 : __ __ __ BYT 20 20 20 20 20 20 20 5d 5d 20 20 20 20 20 20 20 :        ]]       
3ca0 : __ __ __ BYT 20 20 20 20 20 20 20 20 20 20 5d 6d 40 40 40 40 :           ]m@@@@
3cb0 : __ __ __ BYT 40 40 40 40 40 40 40 40 40 40 40 40 40 5d       : @@@@@@@@@@@@@]
--------------------------------------------------------------------
loader_process_keyboard_events:
2c7b : 20 6f 1e JSR $1e6f ; (keyb_poll + 0)
2c7e : ad fc 31 LDA $31fc ; (keyb_key + 0)
2c81 : 29 7f __ AND #$7f
2c83 : aa __ __ TAX
2c84 : bd 00 35 LDA $3500,x ; (keyb_codes + 0)
2c87 : c9 62 __ CMP #$62
2c89 : f0 10 __ BEQ $2c9b
2c8b : c9 71 __ CMP #$71
2c8d : f0 0c __ BEQ $2c9b
2c8f : c9 20 __ CMP #$20
2c91 : f0 08 __ BEQ $2c9b
2c93 : c9 1b __ CMP #$1b
2c95 : f0 04 __ BEQ $2c9b
2c97 : c9 5f __ CMP #$5f
2c99 : d0 04 __ BNE $2c9f
2c9b : a9 01 __ LDA #$01
2c9d : d0 18 __ BNE $2cb7
2c9f : c9 73 __ CMP #$73
2ca1 : d0 07 __ BNE $2caa
2ca3 : 20 ba 2c JSR $2cba ; (loader_save_file + 0)
2ca6 : a9 01 __ LDA #$01
2ca8 : d0 0d __ BNE $2cb7
2caa : c9 6c __ CMP #$6c
2cac : f0 04 __ BEQ $2cb2
2cae : a9 00 __ LDA #$00
2cb0 : f0 05 __ BEQ $2cb7
2cb2 : 20 b9 2d JSR $2db9 ; (loader_load_file + 0)
2cb5 : a9 01 __ LDA #$01
2cb7 : 85 1b __ STA ACCU + 0 
2cb9 : 60 __ __ RTS
--------------------------------------------------------------------
loader_save_file:
2cba : a9 6a __ LDA #$6a
2cbc : 85 0d __ STA P0 
2cbe : a9 2d __ LDA #$2d
2cc0 : 85 0e __ STA P1 
2cc2 : 20 51 26 JSR $2651 ; (krnio_setnam + 0)
2cc5 : a9 02 __ LDA #$02
2cc7 : 85 0d __ STA P0 
2cc9 : 85 0f __ STA P2 
2ccb : a9 08 __ LDA #$08
2ccd : 85 0e __ STA P1 
2ccf : 20 7e 26 JSR $267e ; (krnio_open + 0)
2cd2 : a5 1b __ LDA ACCU + 0 
2cd4 : d0 01 __ BNE $2cd7
2cd6 : 60 __ __ RTS
2cd7 : a9 00 __ LDA #$00
2cd9 : 85 49 __ STA T1 + 0 
2cdb : a9 8e __ LDA #$8e
2cdd : 85 47 __ STA T0 + 0 
2cdf : a9 44 __ LDA #$44
2ce1 : 85 48 __ STA T0 + 1 
2ce3 : a9 c8 __ LDA #$c8
2ce5 : 85 0d __ STA P0 
2ce7 : a9 32 __ LDA #$32
2ce9 : 85 0e __ STA P1 
2ceb : a5 49 __ LDA T1 + 0 
2ced : 85 0f __ STA P2 
2cef : 20 81 2d JSR $2d81 ; (view_buffor_get_sound_name + 0)
2cf2 : a9 02 __ LDA #$02
2cf4 : 85 0e __ STA P1 
2cf6 : a9 c8 __ LDA #$c8
2cf8 : 85 0f __ STA P2 
2cfa : a9 32 __ LDA #$32
2cfc : 85 10 __ STA P3 
2cfe : a9 18 __ LDA #$18
2d00 : 85 11 __ STA P4 
2d02 : a0 00 __ LDY #$00
2d04 : 84 12 __ STY P5 
2d06 : b1 47 __ LDA (T0 + 0),y 
2d08 : 8d d4 32 STA $32d4 ; (ins_template + 12)
2d0b : c8 __ __ INY
2d0c : b1 47 __ LDA (T0 + 0),y 
2d0e : 8d d6 32 STA $32d6 ; (ins_template + 14)
2d11 : c8 __ __ INY
2d12 : b1 47 __ LDA (T0 + 0),y 
2d14 : 8d d5 32 STA $32d5 ; (ins_template + 13)
2d17 : c8 __ __ INY
2d18 : b1 47 __ LDA (T0 + 0),y 
2d1a : 8d d7 32 STA $32d7 ; (ins_template + 15)
2d1d : c8 __ __ INY
2d1e : b1 47 __ LDA (T0 + 0),y 
2d20 : 8d d8 32 STA $32d8 ; (ins_template + 16)
2d23 : c8 __ __ INY
2d24 : b1 47 __ LDA (T0 + 0),y 
2d26 : 8d d9 32 STA $32d9 ; (ins_template + 17)
2d29 : c8 __ __ INY
2d2a : b1 47 __ LDA (T0 + 0),y 
2d2c : 8d db 32 STA $32db ; (ins_template + 19)
2d2f : c8 __ __ INY
2d30 : b1 47 __ LDA (T0 + 0),y 
2d32 : 8d da 32 STA $32da ; (ins_template + 18)
2d35 : c8 __ __ INY
2d36 : b1 47 __ LDA (T0 + 0),y 
2d38 : 8d dd 32 STA $32dd ; (ins_template + 21)
2d3b : c8 __ __ INY
2d3c : b1 47 __ LDA (T0 + 0),y 
2d3e : 8d dc 32 STA $32dc ; (ins_template + 20)
2d41 : c8 __ __ INY
2d42 : b1 47 __ LDA (T0 + 0),y 
2d44 : 8d de 32 STA $32de ; (ins_template + 22)
2d47 : c8 __ __ INY
2d48 : b1 47 __ LDA (T0 + 0),y 
2d4a : 8d df 32 STA $32df ; (ins_template + 23)
2d4d : 20 a6 26 JSR $26a6 ; (krnio_write + 0)
2d50 : 18 __ __ CLC
2d51 : a5 47 __ LDA T0 + 0 
2d53 : 69 0c __ ADC #$0c
2d55 : 85 47 __ STA T0 + 0 
2d57 : 90 02 __ BCC $2d5b
2d59 : e6 48 __ INC T0 + 1 
2d5b : e6 49 __ INC T1 + 0 
2d5d : a5 49 __ LDA T1 + 0 
2d5f : c9 30 __ CMP #$30
2d61 : 90 80 __ BCC $2ce3
2d63 : a9 02 __ LDA #$02
2d65 : 85 0d __ STA P0 
2d67 : 4c fa 0e JMP $0efa ; (krnio_close + 0)
--------------------------------------------------------------------
2d6a : __ __ __ BYT 40 30 3a 53 4f 55 4e 44 42 41 4e 4b 30 30 2e 53 : @0:SOUNDBANK00.S
2d7a : __ __ __ BYT 42 4b 2c 50 2c 57 00                            : BK,P,W.
--------------------------------------------------------------------
view_buffor_get_sound_name:
2d81 : a6 0f __ LDX P2 
2d83 : 8a __ __ TXA
2d84 : 4a __ __ LSR
2d85 : 4a __ __ LSR
2d86 : 4a __ __ LSR
2d87 : 4a __ __ LSR
2d88 : a8 __ __ TAY
2d89 : b9 80 31 LDA $3180,y ; (__multab13L + 0)
2d8c : 18 __ __ CLC
2d8d : 69 01 __ ADC #$01
2d8f : 85 45 __ STA T2 + 0 
2d91 : 8a __ __ TXA
2d92 : 29 0f __ AND #$0f
2d94 : a8 __ __ TAY
2d95 : 18 __ __ CLC
2d96 : a9 79 __ LDA #$79
2d98 : 79 90 31 ADC $3190,y ; (__multab40L + 0)
2d9b : aa __ __ TAX
2d9c : a9 37 __ LDA #$37
2d9e : 79 a0 31 ADC $31a0,y ; (__multab40H + 0)
2da1 : a8 __ __ TAY
2da2 : 8a __ __ TXA
2da3 : 18 __ __ CLC
2da4 : 65 45 __ ADC T2 + 0 
2da6 : 85 43 __ STA T1 + 0 
2da8 : 90 01 __ BCC $2dab
2daa : c8 __ __ INY
2dab : 84 44 __ STY T1 + 1 
2dad : a0 00 __ LDY #$00
2daf : b1 43 __ LDA (T1 + 0),y 
2db1 : 91 0d __ STA (P0),y 
2db3 : c8 __ __ INY
2db4 : c0 0c __ CPY #$0c
2db6 : 90 f7 __ BCC $2daf
2db8 : 60 __ __ RTS
--------------------------------------------------------------------
ins_template:
32c8 : __ __ __ BYT 31 32 33 34 35 36 37 38 39 30 61 62 31 32 33 34 : 1234567890ab1234
32d8 : __ __ __ BYT 35 36 37 38 39 30 61 62                         : 567890ab
--------------------------------------------------------------------
loader_load_file:
2db9 : a9 71 __ LDA #$71
2dbb : 85 0d __ STA P0 
2dbd : a9 2e __ LDA #$2e
2dbf : 85 0e __ STA P1 
2dc1 : 20 51 26 JSR $2651 ; (krnio_setnam + 0)
2dc4 : a9 02 __ LDA #$02
2dc6 : 85 0d __ STA P0 
2dc8 : 85 0f __ STA P2 
2dca : a9 08 __ LDA #$08
2dcc : 85 0e __ STA P1 
2dce : 20 7e 26 JSR $267e ; (krnio_open + 0)
2dd1 : a5 1b __ LDA ACCU + 0 
2dd3 : d0 01 __ BNE $2dd6
2dd5 : 60 __ __ RTS
2dd6 : a9 00 __ LDA #$00
2dd8 : 85 4b __ STA T1 + 0 
2dda : a9 8e __ LDA #$8e
2ddc : 85 49 __ STA T0 + 0 
2dde : a9 44 __ LDA #$44
2de0 : 85 4a __ STA T0 + 1 
2de2 : a9 02 __ LDA #$02
2de4 : 85 0e __ STA P1 
2de6 : a9 c8 __ LDA #$c8
2de8 : 85 0f __ STA P2 
2dea : a9 32 __ LDA #$32
2dec : 85 10 __ STA P3 
2dee : a9 18 __ LDA #$18
2df0 : 85 11 __ STA P4 
2df2 : a9 00 __ LDA #$00
2df4 : 85 12 __ STA P5 
2df6 : 20 85 2e JSR $2e85 ; (krnio_read + 0)
2df9 : a9 c8 __ LDA #$c8
2dfb : 85 0d __ STA P0 
2dfd : a9 32 __ LDA #$32
2dff : 85 0e __ STA P1 
2e01 : a5 4b __ LDA T1 + 0 
2e03 : 85 0f __ STA P2 
2e05 : 20 26 2f JSR $2f26 ; (view_buffor_set_sound_name + 0)
2e08 : ad d4 32 LDA $32d4 ; (ins_template + 12)
2e0b : a0 00 __ LDY #$00
2e0d : 91 49 __ STA (T0 + 0),y 
2e0f : ad d6 32 LDA $32d6 ; (ins_template + 14)
2e12 : c8 __ __ INY
2e13 : ae d5 32 LDX $32d5 ; (ins_template + 13)
2e16 : 91 49 __ STA (T0 + 0),y 
2e18 : 8a __ __ TXA
2e19 : c8 __ __ INY
2e1a : 91 49 __ STA (T0 + 0),y 
2e1c : ad d7 32 LDA $32d7 ; (ins_template + 15)
2e1f : c8 __ __ INY
2e20 : 91 49 __ STA (T0 + 0),y 
2e22 : ad d8 32 LDA $32d8 ; (ins_template + 16)
2e25 : c8 __ __ INY
2e26 : 91 49 __ STA (T0 + 0),y 
2e28 : ad d9 32 LDA $32d9 ; (ins_template + 17)
2e2b : c8 __ __ INY
2e2c : 91 49 __ STA (T0 + 0),y 
2e2e : ad db 32 LDA $32db ; (ins_template + 19)
2e31 : c8 __ __ INY
2e32 : ae da 32 LDX $32da ; (ins_template + 18)
2e35 : 91 49 __ STA (T0 + 0),y 
2e37 : 8a __ __ TXA
2e38 : c8 __ __ INY
2e39 : 91 49 __ STA (T0 + 0),y 
2e3b : ad dd 32 LDA $32dd ; (ins_template + 21)
2e3e : c8 __ __ INY
2e3f : ae dc 32 LDX $32dc ; (ins_template + 20)
2e42 : 91 49 __ STA (T0 + 0),y 
2e44 : 8a __ __ TXA
2e45 : c8 __ __ INY
2e46 : 91 49 __ STA (T0 + 0),y 
2e48 : ad de 32 LDA $32de ; (ins_template + 22)
2e4b : c8 __ __ INY
2e4c : 91 49 __ STA (T0 + 0),y 
2e4e : ad df 32 LDA $32df ; (ins_template + 23)
2e51 : c8 __ __ INY
2e52 : 91 49 __ STA (T0 + 0),y 
2e54 : 18 __ __ CLC
2e55 : a5 49 __ LDA T0 + 0 
2e57 : 69 0c __ ADC #$0c
2e59 : 85 49 __ STA T0 + 0 
2e5b : 90 02 __ BCC $2e5f
2e5d : e6 4a __ INC T0 + 1 
2e5f : e6 4b __ INC T1 + 0 
2e61 : a5 4b __ LDA T1 + 0 
2e63 : c9 30 __ CMP #$30
2e65 : b0 03 __ BCS $2e6a
2e67 : 4c e2 2d JMP $2de2 ; (loader_load_file + 41)
2e6a : a9 02 __ LDA #$02
2e6c : 85 0d __ STA P0 
2e6e : 4c fa 0e JMP $0efa ; (krnio_close + 0)
--------------------------------------------------------------------
2e71 : __ __ __ BYT 53 4f 55 4e 44 42 41 4e 4b 30 30 2e 53 42 4b 2c : SOUNDBANK00.SBK,
2e81 : __ __ __ BYT 50 2c 52 00                                     : P,R.
--------------------------------------------------------------------
krnio_read:
2e85 : a4 0e __ LDY P1 
2e87 : 84 43 __ STY T1 + 0 
2e89 : b9 c8 34 LDA $34c8,y ; (krnio_pstatus + 0)
2e8c : c9 40 __ CMP #$40
2e8e : d0 06 __ BNE $2e96
2e90 : a9 00 __ LDA #$00
2e92 : 85 1b __ STA ACCU + 0 
2e94 : f0 0d __ BEQ $2ea3
2e96 : 84 0d __ STY P0 
2e98 : 20 0c 2f JSR $2f0c ; (krnio_chkin + 0)
2e9b : a5 1b __ LDA ACCU + 0 
2e9d : d0 07 __ BNE $2ea6
2e9f : a9 ff __ LDA #$ff
2ea1 : 85 1b __ STA ACCU + 0 
2ea3 : 85 1c __ STA ACCU + 1 
2ea5 : 60 __ __ RTS
2ea6 : a9 00 __ LDA #$00
2ea8 : 85 44 __ STA T3 + 0 
2eaa : 85 45 __ STA T3 + 1 
2eac : a5 12 __ LDA P5 
2eae : 30 50 __ BMI $2f00
2eb0 : 05 11 __ ORA P4 
2eb2 : f0 4c __ BEQ $2f00
2eb4 : 20 f6 27 JSR $27f6 ; (krnio_chrin + 0)
2eb7 : a5 1b __ LDA ACCU + 0 
2eb9 : 85 46 __ STA T4 + 0 
2ebb : 20 1c 2f JSR $2f1c ; (krnio_status + 0)
2ebe : a5 1b __ LDA ACCU + 0 
2ec0 : a6 43 __ LDX T1 + 0 
2ec2 : 9d c8 34 STA $34c8,x ; (krnio_pstatus + 0)
2ec5 : 09 00 __ ORA #$00
2ec7 : f0 06 __ BEQ $2ecf
2ec9 : a5 1b __ LDA ACCU + 0 
2ecb : c9 40 __ CMP #$40
2ecd : d0 31 __ BNE $2f00
2ecf : 18 __ __ CLC
2ed0 : a5 0f __ LDA P2 
2ed2 : 65 44 __ ADC T3 + 0 
2ed4 : 85 47 __ STA T5 + 0 
2ed6 : a5 10 __ LDA P3 
2ed8 : 65 45 __ ADC T3 + 1 
2eda : 85 48 __ STA T5 + 1 
2edc : a5 46 __ LDA T4 + 0 
2ede : a0 00 __ LDY #$00
2ee0 : 91 47 __ STA (T5 + 0),y 
2ee2 : e6 44 __ INC T3 + 0 
2ee4 : d0 02 __ BNE $2ee8
2ee6 : e6 45 __ INC T3 + 1 
2ee8 : a5 1b __ LDA ACCU + 0 
2eea : d0 14 __ BNE $2f00
2eec : a5 12 __ LDA P5 
2eee : 49 80 __ EOR #$80
2ef0 : 85 03 __ STA WORK + 0 
2ef2 : a5 45 __ LDA T3 + 1 
2ef4 : 49 80 __ EOR #$80
2ef6 : c5 03 __ CMP WORK + 0 
2ef8 : d0 04 __ BNE $2efe
2efa : a5 44 __ LDA T3 + 0 
2efc : c5 11 __ CMP P4 
2efe : 90 b4 __ BCC $2eb4
2f00 : 20 fb 0d JSR $0dfb ; (krnio_clrchn + 0)
2f03 : a5 44 __ LDA T3 + 0 
2f05 : 85 1b __ STA ACCU + 0 
2f07 : a5 45 __ LDA T3 + 1 
2f09 : 4c a3 2e JMP $2ea3 ; (krnio_read + 30)
--------------------------------------------------------------------
krnio_chkin:
2f0c : a6 0d __ LDX P0 
2f0e : 20 c6 ff JSR $ffc6 
2f11 : a9 00 __ LDA #$00
2f13 : 85 1c __ STA ACCU + 1 
2f15 : b0 02 __ BCS $2f19
2f17 : a9 01 __ LDA #$01
2f19 : 85 1b __ STA ACCU + 0 
2f1b : 60 __ __ RTS
--------------------------------------------------------------------
krnio_chrin:
27f6 : 20 cf ff JSR $ffcf 
27f9 : 85 1b __ STA ACCU + 0 
27fb : a9 00 __ LDA #$00
27fd : 85 1c __ STA ACCU + 1 
27ff : 60 __ __ RTS
--------------------------------------------------------------------
krnio_status:
2f1c : 20 b7 ff JSR $ffb7 
2f1f : 85 1b __ STA ACCU + 0 
2f21 : a9 00 __ LDA #$00
2f23 : 85 1c __ STA ACCU + 1 
2f25 : 60 __ __ RTS
--------------------------------------------------------------------
view_buffor_set_sound_name:
2f26 : a6 0f __ LDX P2 
2f28 : 8a __ __ TXA
2f29 : 4a __ __ LSR
2f2a : 4a __ __ LSR
2f2b : 4a __ __ LSR
2f2c : 4a __ __ LSR
2f2d : a8 __ __ TAY
2f2e : b9 80 31 LDA $3180,y ; (__multab13L + 0)
2f31 : 18 __ __ CLC
2f32 : 69 01 __ ADC #$01
2f34 : 85 45 __ STA T2 + 0 
2f36 : 8a __ __ TXA
2f37 : 29 0f __ AND #$0f
2f39 : a8 __ __ TAY
2f3a : 18 __ __ CLC
2f3b : a9 79 __ LDA #$79
2f3d : 79 90 31 ADC $3190,y ; (__multab40L + 0)
2f40 : aa __ __ TAX
2f41 : a9 37 __ LDA #$37
2f43 : 79 a0 31 ADC $31a0,y ; (__multab40H + 0)
2f46 : a8 __ __ TAY
2f47 : 8a __ __ TXA
2f48 : 18 __ __ CLC
2f49 : 65 45 __ ADC T2 + 0 
2f4b : 85 43 __ STA T1 + 0 
2f4d : 90 01 __ BCC $2f50
2f4f : c8 __ __ INY
2f50 : 84 44 __ STY T1 + 1 
2f52 : a0 00 __ LDY #$00
2f54 : b1 0d __ LDA (P0),y 
2f56 : 91 43 __ STA (T1 + 0),y 
2f58 : c8 __ __ INY
2f59 : c0 0c __ CPY #$0c
2f5b : 90 f7 __ BCC $2f54
2f5d : 60 __ __ RTS
--------------------------------------------------------------------
loader_hide_view:
2f5e : a9 d2 __ LDA #$d2
2f60 : 85 43 __ STA T0 + 0 
2f62 : a9 00 __ LDA #$00
2f64 : 85 44 __ STA T0 + 1 
2f66 : 85 45 __ STA T1 + 0 
2f68 : 85 46 __ STA T2 + 0 
2f6a : a2 13 __ LDX #$13
2f6c : a5 43 __ LDA T0 + 0 
2f6e : 85 47 __ STA T4 + 0 
2f70 : 85 49 __ STA T5 + 0 
2f72 : 18 __ __ CLC
2f73 : a9 04 __ LDA #$04
2f75 : 65 44 __ ADC T0 + 1 
2f77 : 85 4a __ STA T5 + 1 
2f79 : a4 45 __ LDY T1 + 0 
2f7b : b9 be 3c LDA $3cbe,y ; (screen_char_backup + 0)
2f7e : a0 00 __ LDY #$00
2f80 : 91 49 __ STA (T5 + 0),y 
2f82 : 18 __ __ CLC
2f83 : a9 d8 __ LDA #$d8
2f85 : 65 44 __ ADC T0 + 1 
2f87 : 85 48 __ STA T4 + 1 
2f89 : a4 45 __ LDY T1 + 0 
2f8b : b9 a6 40 LDA $40a6,y ; (screen_color_backup + 0)
2f8e : a0 00 __ LDY #$00
2f90 : 91 47 __ STA (T4 + 0),y 
2f92 : e6 45 __ INC T1 + 0 
2f94 : e6 43 __ INC T0 + 0 
2f96 : d0 02 __ BNE $2f9a
2f98 : e6 44 __ INC T0 + 1 
2f9a : ca __ __ DEX
2f9b : d0 cf __ BNE $2f6c
2f9d : 18 __ __ CLC
2f9e : a5 43 __ LDA T0 + 0 
2fa0 : 69 15 __ ADC #$15
2fa2 : 85 43 __ STA T0 + 0 
2fa4 : 90 02 __ BCC $2fa8
2fa6 : e6 44 __ INC T0 + 1 
2fa8 : e6 46 __ INC T2 + 0 
2faa : a5 46 __ LDA T2 + 0 
2fac : c9 0a __ CMP #$0a
2fae : 90 ba __ BCC $2f6a
2fb0 : 60 __ __ RTS
--------------------------------------------------------------------
edit_label_window_mainloop:
2fb1 : 20 cc 2f JSR $2fcc ; (edit_label_window_process_input_arguments + 0)
2fb4 : 20 08 30 JSR $3008 ; (edit_label_window_process_keyboard_events + 0)
2fb7 : a5 1b __ LDA ACCU + 0 
2fb9 : d0 10 __ BNE $2fcb
2fbb : 20 7e 1f JSR $1f7e ; (sidfx_loop + 0)
2fbe : ad 11 d0 LDA $d011 
2fc1 : 30 fb __ BMI $2fbe
2fc3 : ad 11 d0 LDA $d011 
2fc6 : 10 fb __ BPL $2fc3
2fc8 : 4c b4 2f JMP $2fb4 ; (edit_label_window_mainloop + 3)
2fcb : 60 __ __ RTS
--------------------------------------------------------------------
edit_label_window_process_input_arguments:
2fcc : ad fd 31 LDA $31fd ; (argv + 0)
2fcf : 8d f2 31 STA $31f2 ; (edit_label_x_pos + 0)
2fd2 : 8d ff 11 STA $11ff ; (edit_label_x_min + 0)
2fd5 : ad ff 31 LDA $31ff ; (argv + 2)
2fd8 : 18 __ __ CLC
2fd9 : 6d fd 31 ADC $31fd ; (argv + 0)
2fdc : 8d ff 13 STA $13ff ; (edit_label_x_max + 0)
2fdf : ad fe 31 LDA $31fe ; (argv + 1)
2fe2 : 0a __ __ ASL
2fe3 : 85 07 __ STA WORK + 4 
2fe5 : a9 00 __ LDA #$00
2fe7 : 2a __ __ ROL
2fe8 : 06 07 __ ASL WORK + 4 
2fea : 2a __ __ ROL
2feb : aa __ __ TAX
2fec : a5 07 __ LDA WORK + 4 
2fee : 6d fe 31 ADC $31fe ; (argv + 1)
2ff1 : 85 43 __ STA T1 + 0 
2ff3 : 8a __ __ TXA
2ff4 : 69 00 __ ADC #$00
2ff6 : 06 43 __ ASL T1 + 0 
2ff8 : 2a __ __ ROL
2ff9 : 06 43 __ ASL T1 + 0 
2ffb : 2a __ __ ROL
2ffc : 06 43 __ ASL T1 + 0 
2ffe : 2a __ __ ROL
2fff : 8d f4 31 STA $31f4 ; (edit_label_y_pos + 1)
3002 : a5 43 __ LDA T1 + 0 
3004 : 8d f3 31 STA $31f3 ; (edit_label_y_pos + 0)
3007 : 60 __ __ RTS
--------------------------------------------------------------------
edit_label_x_min:
11ff : __ __ __ BYT 00                                              : .
--------------------------------------------------------------------
edit_label_x_max:
13ff : __ __ __ BYT 00                                              : .
--------------------------------------------------------------------
edit_label_x_pos:
31f2 : __ __ __ BYT 00                                              : .
--------------------------------------------------------------------
edit_label_y_pos:
31f3 : __ __ __ BYT 00 00                                           : ..
--------------------------------------------------------------------
edit_label_window_process_keyboard_events:
3008 : 20 6f 1e JSR $1e6f ; (keyb_poll + 0)
300b : ad fc 31 LDA $31fc ; (keyb_key + 0)
300e : 29 7f __ AND #$7f
3010 : a8 __ __ TAY
3011 : b9 00 35 LDA $3500,y ; (keyb_codes + 0)
3014 : c9 1b __ CMP #$1b
3016 : f0 10 __ BEQ $3028
3018 : c9 5b __ CMP #$5b
301a : f0 0c __ BEQ $3028
301c : c9 0d __ CMP #$0d
301e : f0 08 __ BEQ $3028
3020 : c9 91 __ CMP #$91
3022 : f0 04 __ BEQ $3028
3024 : c9 11 __ CMP #$11
3026 : d0 04 __ BNE $302c
3028 : a9 01 __ LDA #$01
302a : d0 24 __ BNE $3050
302c : c9 3d __ CMP #$3d
302e : d0 07 __ BNE $3037
3030 : 20 71 30 JSR $3071 ; (label_backspace + 0)
3033 : a9 00 __ LDA #$00
3035 : f0 19 __ BEQ $3050
3037 : 85 47 __ STA T2 + 0 
3039 : c9 61 __ CMP #$61
303b : 90 16 __ BCC $3053
303d : a9 7a __ LDA #$7a
303f : d9 00 35 CMP $3500,y ; (keyb_codes + 0)
3042 : 90 0f __ BCC $3053
3044 : b9 00 35 LDA $3500,y ; (keyb_codes + 0)
3047 : e9 60 __ SBC #$60
3049 : 85 0d __ STA P0 
304b : 20 a5 30 JSR $30a5 ; (label_add_char + 0)
304e : a9 00 __ LDA #$00
3050 : 85 1b __ STA ACCU + 0 
3052 : 60 __ __ RTS
3053 : a9 00 __ LDA #$00
3055 : 85 46 __ STA T0 + 0 
3057 : a5 47 __ LDA T2 + 0 
3059 : a6 46 __ LDX T0 + 0 
305b : dd e0 32 CMP $32e0,x ; (key_filter + 0)
305e : d0 05 __ BNE $3065
3060 : 85 0d __ STA P0 
3062 : 20 a5 30 JSR $30a5 ; (label_add_char + 0)
3065 : e6 46 __ INC T0 + 0 
3067 : a5 46 __ LDA T0 + 0 
3069 : c9 18 __ CMP #$18
306b : 90 ea __ BCC $3057
306d : a9 00 __ LDA #$00
306f : f0 df __ BEQ $3050
--------------------------------------------------------------------
label_backspace:
3071 : ad f2 31 LDA $31f2 ; (edit_label_x_pos + 0)
3074 : 85 43 __ STA T0 + 0 
3076 : ad ff 11 LDA $11ff ; (edit_label_x_min + 0)
3079 : cd f2 31 CMP $31f2 ; (edit_label_x_pos + 0)
307c : b0 26 __ BCS $30a4
307e : a5 43 __ LDA T0 + 0 
3080 : c9 28 __ CMP #$28
3082 : b0 20 __ BCS $30a4
3084 : c6 43 __ DEC T0 + 0 
3086 : a5 43 __ LDA T0 + 0 
3088 : 8d f2 31 STA $31f2 ; (edit_label_x_pos + 0)
308b : a9 04 __ LDA #$04
308d : 6d f4 31 ADC $31f4 ; (edit_label_y_pos + 1)
3090 : a8 __ __ TAY
3091 : ad f3 31 LDA $31f3 ; (edit_label_y_pos + 0)
3094 : 18 __ __ CLC
3095 : 65 43 __ ADC T0 + 0 
3097 : 85 44 __ STA T2 + 0 
3099 : 90 01 __ BCC $309c
309b : c8 __ __ INY
309c : 84 45 __ STY T2 + 1 
309e : a9 20 __ LDA #$20
30a0 : a0 00 __ LDY #$00
30a2 : 91 44 __ STA (T2 + 0),y 
30a4 : 60 __ __ RTS
--------------------------------------------------------------------
label_add_char:
30a5 : ad f2 31 LDA $31f2 ; (edit_label_x_pos + 0)
30a8 : cd ff 13 CMP $13ff ; (edit_label_x_max + 0)
30ab : b0 23 __ BCS $30d0
30ad : c9 27 __ CMP #$27
30af : b0 1f __ BCS $30d0
30b1 : a8 __ __ TAY
30b2 : a9 04 __ LDA #$04
30b4 : 6d f4 31 ADC $31f4 ; (edit_label_y_pos + 1)
30b7 : aa __ __ TAX
30b8 : ad f3 31 LDA $31f3 ; (edit_label_y_pos + 0)
30bb : 18 __ __ CLC
30bc : 6d f2 31 ADC $31f2 ; (edit_label_x_pos + 0)
30bf : c8 __ __ INY
30c0 : 8c f2 31 STY $31f2 ; (edit_label_x_pos + 0)
30c3 : 85 43 __ STA T2 + 0 
30c5 : 90 01 __ BCC $30c8
30c7 : e8 __ __ INX
30c8 : 86 44 __ STX T2 + 1 
30ca : a5 0d __ LDA P0 
30cc : a0 00 __ LDY #$00
30ce : 91 43 __ STA (T2 + 0),y 
30d0 : 60 __ __ RTS
--------------------------------------------------------------------
key_filter:
32e0 : __ __ __ BYT 31 32 33 34 35 36 37 38 39 30 20 21 23 24 25 26 : 1234567890 !#$%&
32f0 : __ __ __ BYT 28 29 2c 2e 3a 3f 2f 2d 00                      : (),.:?/-.
--------------------------------------------------------------------
mul16by8:
30d1 : a0 00 __ LDY #$00
30d3 : 84 06 __ STY WORK + 3 
30d5 : 4a __ __ LSR
30d6 : 90 0d __ BCC $30e5
30d8 : aa __ __ TAX
30d9 : 18 __ __ CLC
30da : 98 __ __ TYA
30db : 65 1b __ ADC ACCU + 0 
30dd : a8 __ __ TAY
30de : a5 06 __ LDA WORK + 3 
30e0 : 65 1c __ ADC ACCU + 1 
30e2 : 85 06 __ STA WORK + 3 
30e4 : 8a __ __ TXA
30e5 : 06 1b __ ASL ACCU + 0 
30e7 : 26 1c __ ROL ACCU + 1 
30e9 : 4a __ __ LSR
30ea : b0 ec __ BCS $30d8
30ec : d0 f7 __ BNE $30e5
30ee : 84 05 __ STY WORK + 2 
30f0 : 60 __ __ RTS
--------------------------------------------------------------------
divmod:
30f1 : a5 1c __ LDA ACCU + 1 
30f3 : d0 31 __ BNE $3126
30f5 : a5 04 __ LDA WORK + 1 
30f7 : d0 1e __ BNE $3117
30f9 : 85 06 __ STA WORK + 3 
30fb : a2 04 __ LDX #$04
30fd : 06 1b __ ASL ACCU + 0 
30ff : 2a __ __ ROL
3100 : c5 03 __ CMP WORK + 0 
3102 : 90 02 __ BCC $3106
3104 : e5 03 __ SBC WORK + 0 
3106 : 26 1b __ ROL ACCU + 0 
3108 : 2a __ __ ROL
3109 : c5 03 __ CMP WORK + 0 
310b : 90 02 __ BCC $310f
310d : e5 03 __ SBC WORK + 0 
310f : 26 1b __ ROL ACCU + 0 
3111 : ca __ __ DEX
3112 : d0 eb __ BNE $30ff
3114 : 85 05 __ STA WORK + 2 
3116 : 60 __ __ RTS
3117 : a5 1b __ LDA ACCU + 0 
3119 : 85 05 __ STA WORK + 2 
311b : a5 1c __ LDA ACCU + 1 
311d : 85 06 __ STA WORK + 3 
311f : a9 00 __ LDA #$00
3121 : 85 1b __ STA ACCU + 0 
3123 : 85 1c __ STA ACCU + 1 
3125 : 60 __ __ RTS
3126 : a5 04 __ LDA WORK + 1 
3128 : d0 1f __ BNE $3149
312a : a5 03 __ LDA WORK + 0 
312c : 30 1b __ BMI $3149
312e : a9 00 __ LDA #$00
3130 : 85 06 __ STA WORK + 3 
3132 : a2 10 __ LDX #$10
3134 : 06 1b __ ASL ACCU + 0 
3136 : 26 1c __ ROL ACCU + 1 
3138 : 2a __ __ ROL
3139 : c5 03 __ CMP WORK + 0 
313b : 90 02 __ BCC $313f
313d : e5 03 __ SBC WORK + 0 
313f : 26 1b __ ROL ACCU + 0 
3141 : 26 1c __ ROL ACCU + 1 
3143 : ca __ __ DEX
3144 : d0 f2 __ BNE $3138
3146 : 85 05 __ STA WORK + 2 
3148 : 60 __ __ RTS
3149 : a9 00 __ LDA #$00
314b : 85 05 __ STA WORK + 2 
314d : 85 06 __ STA WORK + 3 
314f : 84 02 __ STY $02 
3151 : a0 10 __ LDY #$10
3153 : 18 __ __ CLC
3154 : 26 1b __ ROL ACCU + 0 
3156 : 26 1c __ ROL ACCU + 1 
3158 : 26 05 __ ROL WORK + 2 
315a : 26 06 __ ROL WORK + 3 
315c : 38 __ __ SEC
315d : a5 05 __ LDA WORK + 2 
315f : e5 03 __ SBC WORK + 0 
3161 : aa __ __ TAX
3162 : a5 06 __ LDA WORK + 3 
3164 : e5 04 __ SBC WORK + 1 
3166 : 90 04 __ BCC $316c
3168 : 86 05 __ STX WORK + 2 
316a : 85 06 __ STA WORK + 3 
316c : 88 __ __ DEY
316d : d0 e5 __ BNE $3154
316f : 26 1b __ ROL ACCU + 0 
3171 : 26 1c __ ROL ACCU + 1 
3173 : a4 02 __ LDY $02 
3175 : 60 __ __ RTS
--------------------------------------------------------------------
bcexec:
0ffd : 6c 1b 00 JMP ($001b)
--------------------------------------------------------------------
__multab11L:
3176 : __ __ __ BYT 00 0b 16 21 2c 37 42 4d 58 63                   : ...!,7BMXc
--------------------------------------------------------------------
__multab10L:
10fa : __ __ __ BYT 00 0a 14                                        : ...
--------------------------------------------------------------------
__multab7L:
10fd : __ __ __ BYT 00 07 0e                                        : ...
--------------------------------------------------------------------
__multab13L:
3180 : __ __ __ BYT 00 0d 1a 27 34 41 4e 5b 68 75 82 8f 9c a9 b6 c3 : ...'4AN[hu......
--------------------------------------------------------------------
__multab40L:
3190 : __ __ __ BYT 00 28 50 78 a0 c8 f0 18 40 68 90 b8 e0 08 30 58 : .(Px....@h....0X
--------------------------------------------------------------------
__multab40H:
31a0 : __ __ __ BYT 00 00 00 00 00 00 00 01 01 01 01 01 01 02 02 02 : ................
