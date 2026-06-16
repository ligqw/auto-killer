# 🛡️ Universal System Optimizer Pro

A comprehensive, lightweight `.bat` script designed to boost your PC's performance by cleaning up clutter, disabling telemetry, and optimizing system resources. This utility features a completely redesigned, crash-proof architecture, lightning-fast Unicode logging, and a professional centered ASCII interface.

## 🚀 How to Run

1. Download the latest `Optimization.bat` file from the [Releases](https://github.com) section.
2. Right-click on the file.
3. Select **"Run as administrator"** (this is strictly required to apply system-level changes, manage core services, and create a system restore point).

## ⏱️ How It Works

The script safely optimizes your system through **7 key stages**, available via Full or Custom interactive menus:

* **[1/7] System Restore Point:** Automatically creates a secure backup point before making any system modifications.
* **[2/7] Cache Cleanup:** Safely wipes temporary folders, logs, and clears the Windows Update download cache without frozen prompt loops.
* **[3/7] DNS Flush:** Instantly clears and rebuilds your internet DNS cache to fix or speed up network connectivity.
* **[4/7] Power Plan Optimization:** Smart-detects hardware type. Enables the "High Performance" power scheme and unparks CPU cores on desktops, while safely bypassing laptops to save battery.
* **[5/7] Telemetry Disabled:** Disables heavy background Windows tracking services, Xbox GameDVR overlays, and GPU tracking bloatware (NVIDIA/AMD) to free up CPU cycles.
* **[6/7] RAM & Process Booster:** Terminates frozen "Not Responding" programs and utilizes native Win32 APIs via encoded commands to force Windows to flush and optimize active working sets memory.
* **[7/7] System Integrity Check:** Runs native deployment diagnostics (`DISM /ScanHealth`, `DISM /RestoreHealth`, and `SFC /scannow`) with live on-screen progress percentages.

## 🛠️ Features & Architecture Updates

* **Anti-Freeze Fail-safes:** Added full `setlocal enabledelayedexpansion` loops with strict variable resetting to block empty inputs and hidden terminal prompt locks.
* **High-Speed Unicode Logs:** Ditched slow external logging dependencies. The utility writes instant, perfectly readable `optimization_log.txt` reports in native UTF-16LE with BOM formatting.
* **Responsive Layout:** Forced crisp terminal boundaries using `mode con: cols=60 lines=22` with high-contrast aqua-teal styling (`color 0B`).

## 📋 System Requirements

* **Operating System:** Windows 10 / Windows 11 (64-bit).
* **Access Rights:** Administrator account privileges.
* **Infrastructure:** PowerShell must be enabled (installed by default).

## 🔄 How to Undo Changes (Rollback)

If you want to revert your system to its original state after the optimization, use the created secure restore point:

1. Press `Win + R`, type `rstrui`, and press `Enter`.
2. In the opened system restore wizard, select the restore point named **"BeforeOpt"**.
3. Follow the on-screen instructions to restart and roll back your system.

## ⚠️ Disclaimer

This script is provided "as is" without any warranty. The author takes no responsibility for any system malfunctions or issues. Before running, ensure that the "System Restore" feature is enabled on your `C:\` drive so that the initial backup step can execute successfully.
