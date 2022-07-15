module std::boot::limine;

const ulong LIMINE_COMMON_MAGIC_1 = 0xc7b1dd30df4c8b88;
const ulong LIMINE_COMMON_MAGIC_2 = 0x0a82e883a194f07b;

const ichar LIMINE_MEDIA_TYPE_GENERIC = 0;
const ichar LIMINE_MEDIA_TYPE_OPTICAL = 1;
const ichar LIMINE_MEDIA_TYPE_TFTP = 2;

struct LimineUuid {
    ulong a;
    ulong b;
    ulong c;
    ulong[8] d;
}

struct LimineFile {
    ulong revision;
    ulong address;
    ulong size;
    ulong path;
    ulong cmdline;
    ulong media_type;
    ulong unused;
    ulong tftp_ip;
    ulong tftp_port;
    ulong partition_index;
    ulong mbr_disk_id;
    LimineUuid gpt_disk_uuid;
    LimineUuid gpt_part_uuid;
    LimineUuid part_uuid;
}

struct LimineBootInfoResponse {
    ulong revision;
    ulong name;
    ulong version;
}

struct LimineBootInfoRequest {
    ulong [4]id;
    ulong revision;
    ulong response;
}

const int LIMINE_TERMINAL_CB_DEC = 10;
const int LIMINE_TERMINAL_CB_BELL = 20;
const int LIMINE_TERMINAL_CB_PRIVATE_ID = 30;
const int LIMINE_TERMINAL_CB_STATUS_REPORT = 40;
const int LIMINE_TERMINAL_CB_POS_REPORT = 50;
const int LIMINE_TERMINAL_CB_KBD_LEDS = 60;
const int LIMINE_TERMINAL_CB_MODE = 70;
const int LIMINE_TERMINAL_CB_LINUX = 80;

const int LIMINE_TERMINAL_CTX_SIZE = ((int)(-1));
const int LIMINE_TERMINAL_CTX_SAVE = ((int)(-2));
const int LIMINE_TERMINAL_CTX_RESTORE = ((int)(-3));
const int LIMINE_TERMINAL_FULL_REFRESH = ((int)(-4));

struct Limine_terminal {
    ulong columns;
    ulong rows;
    ulong framebuffer;
}

define Limine_terminal_write = fn void(Limine_terminal, char*, ulong);
define Limine_terminal_callback = fn void(Limine_terminal, ulong, ulong, ulong, ulong);

struct Limine_terminal_response {
    ulong revision;
    ulong terminal_count;
    Limine_terminal[] terminals;
    Limine_terminal_write write;
}

struct Limine_terminal_request {
    ulong[4] id;
    ulong revision;
    Limine_terminal_response response;
    ulong callback;
}

