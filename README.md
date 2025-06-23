# vscode-pwn-dev-container

**A dev container for rapid prototyping of binary exploits.**

This container provides a pre-configured environment for binary exploitation, including commonly used tools like GDB (with pwndbg), pwntools, and glibc debug symbols. Ideal for quick prototyping, CTF practice, or debugging vulnerable programs in a reproducible and isolated setup.

## 🚀 Getting Started

### 1. Clone the repository

```bash
git clone https://github.com/CyberDefenseInstitute/vscode-pwn-dev-container.git
cd vscode-pwn-dev-container
```

### 2. Open in Visual Studio Code

Launch VS Code and open this folder. When prompted, or from the Command Palette (`F1`):

> Dev Containers: Rebuild and Reopen in Container

## 🦪 Shell Access

You can interact with the container directly:

### From VS Code

- Open an **Integrated Terminal** (`` Ctrl+` ``) inside the container.

### From your host terminal

```bash
docker exec -w /workspace -it pwn-dev-container-ubuntu24.04 bash
```

## 🛠 Customizing the Container

Feel free to browse and modify the dev container’s configuration:

- `.devcontainer/*/devcontainer.json`
- `.devcontainer/Dockerfile.*`

You can add packages, tweak environment variables, or mount extra volumes as needed.

## 🧪 What's Inside?

- Ubuntu 24.04
- `pwndbg`, `pwntools`, glibc source, `gdb`, `rr`, and more

## 📬 Feedback & Contributions

Feel free to open an issue or pull request if you'd like to improve or extend this environment!

---

Happy hacking 🐚✨
