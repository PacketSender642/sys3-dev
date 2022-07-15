module std::core::builtin;

import std::boot::limine;

Limine_terminal_request terminal;

extern fn void hlt()@autoimport;

fn void panic(char* message, char *file, char *function, uint line) @autoimport
{

}

fn ulong strlen(char *str)
{
    char *s;

    for (s = str; *s; ++s)
            ;
    return (s - str);
}

fn void print(char* message) @autoimport
{
    terminal.id = { limine::LIMINE_COMMON_MAGIC_1, limine::LIMINE_COMMON_MAGIC_2, 0xc8ac59310c2b0844, 0xa68d0c7265d38878 };
    terminal.revision = 0;

    if (terminal.response.terminal_count < 1) {
    }

    Limine_terminal terminal_ = terminal.response.terminals[0];
    terminal.response.write(terminal_, message, strlen(message));

}