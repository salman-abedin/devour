#include <X11/Xlib.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

void runcommand(int argc, char *argv[]) {
  int arglen = 1;
  char *str, *head = "$SHELL -i -c \"", *tail = " > /dev/null 2>&1; exit\"";

  arglen += strlen(head);
  for (int i = 1; i < argc; ++i)
    arglen += 1 + strlen(argv[i]);
  arglen += strlen(tail);
  str = (char *)malloc(sizeof(char) * arglen);

  strcpy(str, head);
  for (int i = 1; i < argc; ++i) {
    if (!strcmp(argv[i], "--"))
      goto procfile;
    strcat(str, argv[i]);
    strcat(str, " ");
  }
procfile:
  strcat(str, "file");

  strcat(str, tail);

  printf("%s", str);
  /* system(str); */
  free(str);
}

int main(int argc, char *argv[]) {
  int rev;
  Window win;
  Display *dis = XOpenDisplay(NULL);
  XGetInputFocus(dis, &win, &rev);
  /* XUnmapWindow(dis, win); */
  XCloseDisplay(dis);
  runcommand(argc, argv);
  dis = XOpenDisplay(NULL);
  XMapWindow(dis, win);
  XCloseDisplay(dis);
  return 0;
}
