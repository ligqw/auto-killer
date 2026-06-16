# 🛡️ Universal System Optimizer

A comprehensive, lightweight `.bat` script designed to boost your PC's performance by cleaning up clutter, disabling telemetry, and optimizing system resources.

## 🚀 How to Run
1. Download the `optimizer.bat` file.
2. Right-click on it.
3. Select **"Run as administrator"** (this is strictly required to apply system-level changes and create a restore point).

## ⏱️ How It Works
The script safely optimizes your system through 6 key stages:

* **[1/6] System Restore Point:** Automatically creates a backup point before making any modifications.
* **[2/6] Cache Cleanup:** Safely wipes temporary folders and clears the Windows Update download cache.
* **[3/6] DNS Flush:** Clears your internet DNS cache to fix or speed up network connectivity.
* **[4/6] Power Plan Optimization:** Automatically detects if you are on a desktop PC to enable the "High Performance" power scheme and unpark CPU cores.
* **[5/6] Telemetry & Bloatware Disabled:** Disables background Windows tracking, Xbox GameDVR overlays, and GPU telemetry (NVIDIA/AMD) to free up CPU cycles.
* **[6/6] RAM & Process Booster:** Automatically terminates frozen "Not Responding" programs and forces Windows to optimize RAM usage across all active processes.

## 🛠️ Customization
You can open the file with regular Notepad to remove any specific steps or tweak individual registry keys to match your preferences.

## 📋 System Requirements
* **Operating System:** Windows 10 / Windows 11 (64-bit).
* **Access Rights:** Administrator account privileges.
* **Infrastructure:** PowerShell must be enabled (installed by default).

## ⚠️ Disclaimer
This script is provided "as is" without any warranty. The author takes no responsibility for any system malfunctions or issues. Before running, ensure that the "System Restore" feature is enabled on your `C:\` drive so that the initial backup step can execute successfully.

## 🔄 How to Undo Changes (Rollback)
If you want to revert your system to its original state after the optimization, use the created restore point:
1. Press `Win + R`, type `rstrui`, and press **Enter**.
2. In the opened window, select the restore point named **"BeforeOptimization"**.
3. Follow the on-screen instructions to restart and roll back your system.
