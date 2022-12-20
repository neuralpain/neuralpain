# archive.sh

Shell snippet archive. Tested code for whatever use; along with other useful information. 

### Snippet List

- [`replace_in_file.sh`](./replace_in_file.sh) - edit line in a file
- [`collect_args.sh`](./collect_args.sh) - collect arguments to a list
- [`selection_menu.sh`](./selection_menu.sh) - selection menu

### Redirect merger operator `>&`

- File descriptor `1` is the standard output (`stdout`).
- File descriptor `2` is the standard error (`stderr`).
- `&` indicates that what follows and precedes is a file descriptor, and not a filename. Thus, we use `2>&1`.
- Consider `>&` to be a redirect merger operator.

```bash
# redirect stderr to stdout
2>&1 
```

### Bash colors

```bash
BLACK='\033[0;30m'
BLUE='\033[0;34m'
GREEN='\033[0;32m'
CYAN='\033[0;36m'
RED='\033[0;31m'
PURPLE='\033[0;35m'
BROWN='\033[0;33m'
LIGHT_GRAY='\033[0;37m'
DARK_GRAY='\033[1;30m'
LIGHT_BLUE='\033[1;34m'
LIGHT_GREEN='\033[1;32m'
LIGHT_CYAN='\033[1;36m'
LIGHT_RED='\033[1;31m'
LIGHT_PURPLE='\033[1;35m'
YELLOW='\033[1;33m'
WHITE='\033[1;37m'
RESET_C='\033[0m'
```

---

## License

Licensed with [MIT](./LICENSE).
