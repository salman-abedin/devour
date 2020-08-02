/* devour
 *
 * window Manager agnostic swallowing feature for terminal emulators
 *
 */

#include <X11/Xlib.h>
#include <stdlib.h>
#include <string.h>

char *str;

void fixpath(int argc, char *argv[], int i) {
  while (i < argc) {
    strcat(str, argv[i]);
    if (i != argc - 1)
      strcat(str, "\\ ");
    else
      strcat(str, " ");
    ++i;
  }
}

void runcommand(int argc, char *argv[]) {
  int arglen = 1;
  char *head = "$SHELL -i -c \"", *tail = "> /dev/null 2>&1; exit\"";

  arglen += strlen(head) + strlen(tail);
  for (int i = 1; i < argc; ++i)
    arglen += 2 + strlen(argv[i]);
  str = (char *)malloc(sizeof(char) * arglen);

  strcpy(str, head);
  for (int i = 1; i < argc; ++i) {
    if (!strcmp(argv[i], "--")) {
      fixpath(argc, argv, ++i);
      break;
    }
    strcat(str, argv[i]);
    strcat(str, " ");
  }
  strcat(str, tail);

  system(str);
  free(str);
}

int main(int argc, char *argv[]) {
  int rev;
  Window win;
  Display *dis = XOpenDisplay(NULL);
  XGetInputFocus(dis, &win, &rev);
  XUnmapWindow(dis, win);
  XCloseDisplay(dis);
  runcommand(argc, argv);
  dis = XOpenDisplay(NULL);
  XMapWindow(dis, win);
  XCloseDisplay(dis);
  return 0;
}
