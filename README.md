# Windows 11 VBS & HVCI Performance Manager (Full AMD)

A lightweight, interactive batch script (`.bat`) designed to easily toggle Windows 11 Virtualization-Based Security (VBS) and Hypervisor-Protected Code Integrity (HVCI) on or off. This tool is optimized for gaming performance, specifically targetting latency reduction and FPS stabilization on AMD Ryzen processors.

## The Problem with VBS/HVCI in Gaming

Windows 11 enables **VBS** (Virtualization-Based Security) and **HVCI** (Memory Integrity) by default. While excellent for enterprise-level security, these features create a heavy layer of virtualization and encryption between the OS kernel and your hardware.

On gaming rigs—especially those powered by AMD Ryzen CPUs paired with Radeon GPUs—this background virtualization introduces noticeable overhead:
* **FPS Drop:** Can cause a 5% to 15% reduction in average framerates depending on the game.
* **Storage & Hardware Latency:** Limits direct hardware communication, affecting modern low-latency storage pipelines like DirectStorage.
* **Micro-Stuttering:** Can introduce frametime variance during intense rendering sequences.

Disabling these features restores direct, raw hardware communication, bypassing the hypervisor constraint to squeeze out maximum gaming performance.

## How the Script Works

Instead of forcing you to navigate deep into Windows settings, Registry hives, and boot configuration menus, this uncompiled `.bat` script provides a **one-click interactive dashboard** that:

1. **Checks Live System Status:** Instantly queries the Windows Registry and Boot Configuration Data (BCD) to display whether the Hypervisor (VBS) and Memory Integrity (HVCI) are currently **ENABLED** or **DISABLED**.
2. **Disables/Reenables Safely:** Modifies the specific Registry hives and BCD variables securely using native Windows commands (`reg add` and `bcdedit`).
3. **Automated Cleanup:** Offers an instant system reboot prompt to apply the changes immediately.

## Menu Options

* **[1] DISABLE VBS/HVCI:** Turns off the virtualization engine and memory isolation, paving the way for maximum FPS, consistent frame-times, and lower hardware latency.
* **[2] REENABLE VBS/HVCI:** Restores all default Windows 11 security mechanisms instantly if you need to return to stock security parameters.
* **[3] EXIT:** Safely closes the utility without making changes.

## How to Run

1. Download the `Gerenciar_VBS_HVCI.bat` file.
2. Right-click the file and select **Run as Administrator** (this is strictly required since the script modifies boot parameters and system registry entries).
3. Choose your option from the interactive menu and let the script handle the modifications.
4. Press `S` (Yes) to let the computer restart and apply the hardware configuration.

## Disclaimer

Disabling VBS and HVCI removes virtualization-level software protection against advanced memory exploits. Use this tweak if your system is primarily dedicated to gaming and high-performance applications where raw hardware throughput is prioritized over enterprise security baselines.
