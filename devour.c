/*
 * devour
 * X11 window swallower
 */

#include <X11/Xlib.h>
#include <stdlib.h>
#include <string.h>

#define UNSAFE_CHARS "`\"'()[]& "

long int arglen(int argc, char **argv) {
  long int total = 0;
  for (int i = 1; i < argc; i++) {
    total += strlen(argv[i]);
  }
  return total;
}

void run_command(int argc, char **argv) {
  char arg_char;
  char *arg;
  char* cmd = malloc(arglen(argc, argv) * sizeof(0));

  while ((arg = *++argv)) {
    while ((arg_char = *arg++)) {
      if (strchr(UNSAFE_CHARS, arg_char))
        strcat(cmd, "\\");
      strncat(cmd, &arg_char, 1);
    }
    strcat(cmd, " ");
  }
  system(cmd);
  free(cmd);
}

int main(int argc, char **argv) {
  int rev;
  Window win;
  Display *dis = XOpenDisplay(0);

  XGetInputFocus(dis, &win, &rev);
  XUnmapWindow(dis, win);
  XFlush(dis);
  run_command(argc, argv);
  XMapWindow(dis, win);
  XCloseDisplay(dis);

  (void)argc;
  return 0;
}
