module std::core::io;

import std::boot::limine;
import std::core::string;

Limine_terminal_request terminal;

fn void new()
{
    terminal.id = { limine::LIMINE_COMMON_MAGIC_1, limine::LIMINE_COMMON_MAGIC_2, 0xc8ac59310c2b0844, 0xa68d0c7265d38878 };
    terminal.revision = 0;
}

fn void printf(char* message)
{
    Limine_terminal* term = terminal.response.terminals;
    terminal.response.write(term, message, string::strlen(message));
}