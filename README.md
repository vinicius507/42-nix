# ❄️ 42-nix

![GIF demonstrating the nix develop command being executed](./assets/demo.gif)

Development enviroment for École 42 Common Core projects using Nix Flakes.

> **Warning**
>
> This flake is a WIP. Expect breaking changes.

## 🎯 Goal

The main goal of this project is to provide a reproducible environment for École 42 Projects using Nix flakes.

It also provides packages and overlays for usage on other flakes.

## ⭐ Features

### C/C++ Development Environment

The flake provides a C/C++ development environment through the `nix develop` command. This environment includes the following packages:

- [`bear`](https://github.com/rizsotto/Bear): useful for generating `compile_commands.json` for clang tools.
- `clang-tools_12`: provides clang tools (useful for the `clangd` language server).
- [`gnumake`](https://www.gnu.org/software/make/)
- `llvmPackages_12.libcxxClang`: C language family frontend for LLVM 12.
- [`valgrind`](https://valgrind.org/): debugger and profiler for Linux executables.
- [`norminette`](https://github.com/42School/norminette): 42 School C linter.

### 42 School Packages

This flake also provides the following 42 School related packages:

- [`norminette`](https://github.com/42School/norminette): 42 School C linter.
