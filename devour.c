/*
 * devour
 * X11 window swallower
 */

#include <X11/Xlib.h>
#include <stdlib.h>
#include <string.h>

#define UNSAFE_CHARS "`\"'()[]& "

void run_command(char **argv) {
  char arg_char;
  char *arg;
  char cmd[1024] = {0};

  while ((arg = *++argv)) {
    while ((arg_char = *arg++)) {
      if (strchr(UNSAFE_CHARS, arg_char))
        strcat(cmd, "\\");
      strncat(cmd, &arg_char, 1);
    }
    strcat(cmd, " ");
  }
  system(cmd);
}

int main(int argc, char **argv) {
  int rev;
  Window win;
  Display *dis = XOpenDisplay(0);

  XGetInputFocus(dis, &win, &rev);
  XUnmapWindow(dis, win);
  XFlush(dis);
  run_command(argv);
  XMapWindow(dis, win);
  XCloseDisplay(dis);

  (void)argc;
  return 0;
}
