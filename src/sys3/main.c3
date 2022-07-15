module sys3;

fn void _start()
{
    io::new();
    io::printf("Hello, World, from c3 of course\n");

    while (true) {
        asm("hlt");
    }
}