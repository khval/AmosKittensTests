
_LVOOpen			EQU -30
_LVOClose			EQU -36
_LVODelay			EQU	-198
_LVOOldOpenLibrary	EQU	-408
_LVOCloseLibrary		EQU	-414

main
	lea dos_library_name(pc),a1
	move.l	4.w,a6
	jsr		_LVOOldOpenLibrary(a6)

	lea		dosbase(pc),a2
	move.l	d0,(a2)
	beq	.Out

	lea		con(pc),a0
	move.l	a0,d1
	move.l	#1005,d2
	move.l	dosbase(pc),a1
	jsr		_LVOOpen(a1)

	lea		fd(pc),a2
	move.l	d0,(a2)

	cmpi.l	#0,d0
	beq		.not_open

	move.l	#320,d1
	move.l	dosbase(pc),a1
	jsr		_LVODelay(a1)

	move.l	fd(pc),d1
	move.l	dosbase(pc),a1
	jsr		_LVOClose(a1)

.not_open
	; Close Dos.library
	move.l	4.w,a6		; ExecBase
	move.l	dosbase(pc),a1
	move.l	4.w,a6
	jsr		_LVOCloseLibrary(A6)

.Out
	rts

dos_library_name 	dc.b "dos.library" ,0
dosbase			dc.l	0

con	dc.b "CON:",0

txt	dc.b	"working..."

fd	dc.l 0

