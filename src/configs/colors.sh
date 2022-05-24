#!/bin/bash

ESC_SEQ="\x1b["
export COL_RESET=${ESC_SEQ}"39;49;00m"
export COL_YELLOW=${ESC_SEQ}"1;33m"
export COL_LGREEN=${ESC_SEQ}"32;01m"
export COL_GRAY=${ESC_SEQ}"30;02m"
export COL_LGRAY=${ESC_SEQ}"30;01m"
export COL_RED=${ESC_SEQ}"0;31m"
export COL_GREEN=${ESC_SEQ}"0;32m"
export COL_ORANGE=${ESC_SEQ}"0;33m"
export COL_BLUE=${ESC_SEQ}"0;34m"
export COL_MAGENTA=${ESC_SEQ}"0;35m"
export COL_CYAN=${ESC_SEQ}"0;36m"
