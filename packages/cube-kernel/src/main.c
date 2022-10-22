#include <stddef.h>
#include <limine.h>

static volatile struct limine_terminal_request terminal_request = {
  .id = LIMINE_TERMINAL_REQUEST,
  .revision = 0,
};

static void halt() {
  for (;;) __asm__("hlt");
}

void _start() {
   if (terminal_request.response == NULL || terminal_request.response->terminal_count < 1)
     halt();

   struct limine_terminal *terminal = terminal_request.response->terminals[0];
   terminal_request.response->write(terminal, "Hello, world!", 13);

   halt();
}
