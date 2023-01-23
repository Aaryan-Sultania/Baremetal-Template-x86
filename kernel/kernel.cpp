#define VIDEO_MEM 0xb8000

unsigned int row = 0;
unsigned int collum = 0;
void write_string(int colour, const char *string);
extern "C" void main()
{
    const char* test = "This is quite neat";
    write_string(0x0F, test);
}
void write_string(int colour, const char *string)
{
    volatile char *video = (volatile char*) (0xB8000+row*160+collum*2);
    while( *string != 0 )
    {
        *video++ = *string++;
        *video++ = colour;
    }
}