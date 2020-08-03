/*
 * devour
 * window Manager agnostic swallowing feature for terminal emulators
 */

#include <X11/Xlib.h>
#include <stdlib.h>
#include <string.h>

void fixpath(int argc, char* argv[], int i, char* upath) {
   for (; i < argc; ++i) {
      strcat(upath, argv[i]);
      if (i != argc - 1)
         strcat(upath, "\\ ");
      else
         strcat(upath, " ");
   }
}

void runcommand(int argc, char* argv[]) {
   char* cmd;
   int arglen = 1;
   char* head = "$SHELL -i -c \"", *tail = "> /dev/null 2>&1; exit\"";

   arglen += strlen(head) + strlen(tail);
   for (int i = 1; i < argc; ++i)
      arglen += 2 + strlen(argv[i]);
   cmd = malloc(sizeof(char) * arglen);

   strcpy(cmd, head);
   for (int i = 1; i < argc; ++i) {
      if (!strcmp(argv[i], "--")) {
         fixpath(argc, argv, ++i, cmd);
         break;
      }
      strcat(cmd, argv[i]);
      strcat(cmd, " ");
   }
   strcat(cmd, tail);

   system(cmd);
   free(cmd);
}

int main(int argc, char* argv[]) {
   int rev;
   Window win;
   Display* dis = XOpenDisplay(NULL);

   XGetInputFocus(dis, &win, &rev);

   XUnmapWindow(dis, win);
   XCloseDisplay(dis);

   runcommand(argc, argv);

   dis = XOpenDisplay(NULL);
   XMapWindow(dis, win);
   XCloseDisplay(dis);

   return 0;
}
