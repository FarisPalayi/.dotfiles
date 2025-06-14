# My WSL Dotfiles

Personal shell configuration for bash and zsh in WSL.

## Structure
```
~/
├── .config/
│   └── shell/
│       ├── aliases.sh
│       ├── exports.sh
│       ├── functions.sh
│       └── path.sh
├── .bashrc
├── .zshrc
├── .bash_profile
└── .profile
```

- `.bashrc` - Bash configuration
- `.zshrc` - Zsh configuration  
- `.profile` - Login shell configuration
- `shell/` - Shared configuration modules

## Installation
Run the setup script or manually copy files to home directory.
```bash
./install.sh
```

## Usage
To sync the current dotfiles configuration to this repo, run:
```bash
./update.sh
```
