module std::core::string;

define String = distinct void*;

fn ulong strlen(char *str)
{
	char *s;
	for (s = str; *s; ++s) {}
	return (s - str);
}