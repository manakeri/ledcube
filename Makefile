all: 
	sdcc --funsigned-char -mpic14 -p16f88 --use-non-free main.c

sim:
	gpsim main.hex -s main.cod

prog: 
	pk2cmd -P PIC16F88 -X -M -F main.hex

run:
	pk2cmd -P PIC16F88 -T

stop:
	pk2cmd -P PIC16F88
