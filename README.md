# Bruteforce X - NNOS Apps

Bruteforce X is a command-line tool designed to automate the process of attempting to brute-force passwords for local accounts on a Windows system using a wordlist. It provides a basic interface for selecting user accounts, specifying password lists, and attempting to login using each password in the provided list.

This tool is for educational purposes and should only be used in a controlled environment where you have permission to perform security testing. Unauthorized use of this tool could be illegal and is not endorsed by the creators.

## Features

- **User Information**: View a list of local users on the system.
- **Brute Force**: Attempt to guess a user’s password using a wordlist.
- **Clear Screen**: Clears the terminal screen to improve user experience.
- **Exit**: Close the application.

## Prerequisites

- Windows operating system.
- A command-line interface (CMD).
- A valid wordlist file for password attempts.

## Usage

1. **Display Users**: Choose option `1` to display all local user accounts on the machine.
2. **Run Bruteforce**: Choose option `2` to start the bruteforce process. You will be prompted to enter the username and the path to the wordlist file.
3. **Clear Screen**: Choose option `3` to clear the screen and return to the start menu.
4. **Exit**: Choose option `4` to exit the tool.

### Example

```bash
BF>> 1    # Show user accounts
BF>> 2    # Start bruteforce
BF>> 3    # Clear the screen
BF>> 4    # Exit the tool
```

## License

This project is licensed under the **Apache License 2.0** - see the [LICENSE](LICENSE) file for details.

## Author

Created by [Natuworkguy](https://github.com/Natuworkguy).

## Disclaimer

This tool is for **educational purposes** only. The author takes no responsibility for any misuse of this software. Be sure to use it only on systems you own or have explicit permission to test.
