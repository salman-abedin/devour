/*
 * devour
 * X11 window swallower
 */

#include <X11/Xlib.h>
#include <stdlib.h>
#include <string.h>

#define UNSAFE_CHARS "`\"'()[]& "

void run_command(int argc, char **argv) {
  char arg_char;
  char *arg;
  int cmd_buffer_allocated_size = 1024; /* the actual buffer size */
  int cmd_buffer_size = 0;           /* the number of characters in the buffer */
  char *cmd = (char*) malloc(sizeof(char) * cmd_buffer_allocated_size);

  /* while ((arg = *++argv)) { */
  for (int i = 1; i <= argc, arg = argv[i]; i++) {
      for (int j = 0; j < (int) strlen(arg), arg_char = arg[j]; j++) {
          if (cmd_buffer_size >= cmd_buffer_allocated_size * 0.75)
          {
              cmd_buffer_allocated_size *= 1.5;
              char *temp = realloc(cmd, cmd_buffer_allocated_size);
              cmd = temp;
          }

          if (strchr(UNSAFE_CHARS, arg_char))
          {
              strncpy((cmd + cmd_buffer_size), "\\", 2);
              cmd_buffer_size += 2;
          }

          strncpy((cmd + cmd_buffer_size), &arg_char, 1);
          cmd_buffer_size += 1;
      }
      strncpy((cmd + cmd_buffer_size), " ", 2); /* 2 bytes because the space plus the null byte that might be added at the end of the string */
      cmd_buffer_size += 1;
  }

  char cmd_args[cmd_buffer_size];
  memcpy(cmd_args, cmd, sizeof(char) * cmd_buffer_size);
  system(cmd_args);
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
