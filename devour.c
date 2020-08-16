/*
 * devour
 * window Manager agnostic swallowing feature for terminal emulators
 */

#include <X11/Xlib.h>
#include <stdlib.h>
#include <string.h>

void _fix_path(int argc, char** argv, int i, char* upath) {
      for (; i < argc; ++i) {
            strcat(upath, argv[i]);
            if (i != argc - 1)
                  strcat(upath, "\\ ");
            else
                  strcat(upath, " ");
      }
}

void run_command(int argc, char** argv) {
      int arglen, i;
      char *cmd, *head, *tail;

      head = "$SHELL -i -c \"";
      tail = "> /dev/null 2>&1; exit\"";
      arglen = strlen(head) + strlen(tail);
      for (i = 1; i < argc; ++i) arglen += 2 + strlen(argv[i]);
      cmd = calloc(arglen, (sizeof *cmd));

      strcpy(cmd, head);
      for (i = 1; i < argc; ++i) {
            if (strcmp(argv[i], "--") == 0) {
                  _fix_path(argc, argv, ++i, cmd);
                  break;
            }
            strcat(cmd, argv[i]);
            strcat(cmd, " ");
      }
      strcat(cmd, tail);

      system(cmd);
      free(cmd);
}

int main(int argc, char** argv) {
      int rev;
      Window win;
      Display* dis = XOpenDisplay(NULL);

      XGetInputFocus(dis, &win, &rev);
      XUnmapWindow(dis, win);
      XFlush(dis);
      run_command(argc, argv);
      XMapWindow(dis, win);
      XCloseDisplay(dis);
      return 0;
}
