# Package Installer Script

This is a Bash script that helps you install packages from Git repositories on Arch-based Linux systems. It automates the process of cloning, building, and installing the package.

## Features:

-   **Easy Installation:** Quickly install packages directly from Git repositories.
-   **Automated Building:** Uses `makepkg` to build the package.
-   **Clean Up:** Removes the cloned repository after installation.

## Usage:

### 1. How to Use the Script

1. **Clone the repo**
    ```bash
    git clone https://github.com/gingrspacecadet/vincent-van-yogh.git
    ```
2. **Make it a package**
    ```bash
    cd vincent-van-yogh
    makepkg -si
    cd ..
    rm -fr vincent-van-yogh
    ```
3. **Run the script**
   ```bash
   vvy -S <repo-url>
   ```
   Replace `<repo-url>` with the URL of the package you want to install

### 2. What the Script Does

1.  **Clones the Repository:** The script clones the Git repository specified in the command.
2.  **Builds the Package:** It uses the `makepkg -si` command to build and install the package. This command reads the `PKGBUILD` file in the repository, which contains instructions on how to build the package.
3.  **Cleans Up:** After the installation is complete, the script removes the cloned repository to keep your system clean.

### 3. Important Notes

-   This script is designed for Arch-based Linux distributions that use `makepkg`, such as Arch Linux, Manjaro, and others.
-   The Git repository *must* contain a `PKGBUILD` file for `makepkg` to work.
-   You need to have `git` and the `base-devel` package group installed. These provide essential tools for building from source.

### 4. Installing Git and base-devel

If you don't have `git` or the `base-devel` package group installed, you can install them using `pacman`:

```bash
sudo pacman -S git base-devel
