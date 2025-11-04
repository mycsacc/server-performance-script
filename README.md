
# Server Performance Stats Script

This repository contains a simple script that allows you to analyze basic server performance statistics on a Linux server. The script, server-stats.sh, gathers and displays crucial server performance data, such as CPU usage, memory usage, disk usage, and details about the top processes consuming resources.

## Use
The script provides the following performance metrics:
- **Total CPU Usage**: Overall CPU usage as a percentage.
- **Memory Usage**: Total memory usage, broken down into free vs used memory, along with percentages.
- **Disk Usage**: Total disk space usage, including free vs used space and percentage.
- **Top 5 Processes by CPU Usage**: The five processes that are consuming the most CPU resources.
- **Top 5 Processes by Memory Usage**: The five processes consuming the most memory.

### Installation

To use this script, follow these steps:

#### Prerequisites
- A Linux-based system (Ubuntu, CentOS, etc.)
- Bash shell (the script is written in Bash)
- `ps`, `df`, `free`, `uptime`, `top`, `w`, and `lastb` commands (these are typically pre-installed on most Linux systems)

#### Clone the Repository

```bash
git clone https://github.com/mycsacc/server-performance-script.git
```

#### Navigate to the Directory

```bash
cd server-performance-stats
```

#### Make the Script Executable

```bash
chmod +x server-stats.sh
```

#### Usage

Run the script using the following command:
```bash
./server-stats.sh
```

### Project URL

You can access the project here: https://roadmap.sh/projects/server-stats




