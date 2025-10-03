void kernel_main() {
    volatile unsigned short *vga = (unsigned short *)0xB8000;
    
    vga[0] = (0x07 << 8) | 'H'; // Světle šedý znak 'H'
    vga[1] = (0x07 << 8) | 'e'; // Světle šedý znak 'e'
    vga[2] = (0x07 << 8) | 'l'; // Světle šedý znak 'l'
    vga[3] = (0x07 << 8) | 'l'; // Světle šedý znak 'l'
    vga[4] = (0x07 << 8) | 'o'; // Světle šedý znak 'o'
    vga[5] = (0x07 << 8) | ','; // Světle šedý znak ','
    vga[6] = (0x07 << 8) | ' '; // Světle šedý znak ' '
    vga[7] = (0x07 << 8) | 'W'; // Světle šedý znak 'W'
    vga[8] = (0x07 << 8) | 'o'; // Světle šedý znak 'o'
    vga[9] = (0x07 << 8) | 'r'; // Světle šedý znak 'r'
    vga[10] = (0x07 << 8) | 'l'; // Světle šedý znak 'l'
    vga[11] = (0x07 << 8) | 'd'; // Světle šedý znak 'd'
    vga[12] = (0x07 << 8) | '!'; // Světle šedý znak '!'
    vga[13] = (0x07 << 8) | '\n'; // Nový řádek

    for(;;) {__asm__("hlt");} // Nekonečná smyčka s HLT instrukcí;
}