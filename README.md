# 6.828-Tools

Formulas for the toolchain and emulator used in MIT's course 6.828.

##Installation

From the shell:

Install Homebrew if not yet installed:

```ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"```

Run the following line to tap and install all required formula:

```brew tap 6.828/tools https://github.com/efraimhelman/6.828-Tools.git && brew install mit-6828-qemu```

##Notes

You may need to run ```brew link --overwrite i386-jos-elf-gdb``` if the linking for this step throws an error.

This installs "gdb" with an architecture-specific prefix, as suggested by the authors of MIT's 6.828 lab tools page. __Therefore, when required to run "gdb", use "i386-jos-elf-gdb". Using "gdb" will not work as expected.__

##Support

Tested on Mac OS X El Capitan.

All packages usesd are the latest available as of September 2016.

##Credits

These formulas rely heavily upon: Previous work by Jin Suk Park for the three i-386 cross-platform formulas. Previous work by the various authors maintaining the corresponding mainstream homebrew formulas for these libraries. Previous work by the authors of MIT's 6.828 lab tools page.
