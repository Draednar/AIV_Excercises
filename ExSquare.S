org $8000

LDX #$00     ;start position

Clear:       ;clear screen of previous pixel
LDA #0
STA $0200, X
RTS

Input:       ;get input and branch to movement functions
LDA $4000
CMP #$01
BEQ Up
CMP #$02
BEQ Down
CMP #$04
BEQ Left
CMP #$08
BEQ Right
RTS

Up:
JSR clear
TXA
ADC #$ef
TAX
RTS

Down:
JSR clear
TXA
ADC #$0F
TAX
RTS

Left:
JSR clear
TXA
DEX
RTS

Right:
JSR clear
INX
RTS

Draw:         ;draw pixel
LDA #09
STA $0200, X
RTS

Main:         ;update
JSR Input
JSR Draw
JMP Main

.goto $FFFA
.dw start
.dw start
.dw start
