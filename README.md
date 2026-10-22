# DRAG

Paste a link, click **GRAB**, and the video or audio lands in your edit. Works with YouTube, TikTok, Instagram and most other sites, straight into Final Cut Pro, DaVinci Resolve, or any editor by dragging.

## Install (recommended, no security warnings)

1. Open **Terminal** (press ⌘ Space, type `Terminal`, press Return).
2. Paste this line and press Return:

   ```
   curl -fsSL https://raw.githubusercontent.com/karimkhater/drag/main/install.sh | bash
   ```

It picks the right version for your Mac, installs DRAG into Applications and opens it. Run the same line again any time to reinstall.

## Install from the DMG instead

1. Download from the [latest release](https://github.com/karimkhater/drag/releases/latest): **DRAG-Apple-Silicon.dmg** for M1–M4 Macs, **DRAG-Intel.dmg** for older Intel Macs (Apple menu → About This Mac → "Chip" tells you which).
2. Open the DMG and drag **DRAG** into **Applications**.
3. The first time you open it, macOS warns that it can't verify the developer. Click **Done**, then go to **System Settings → Privacy & Security**, scroll down and click **Open Anyway**. You only do this once. (The Terminal install above skips this step.)

## Updates

DRAG updates itself. When a new version is ready you'll see a **Restart to update** button in the app.

## Use

- Click the paste button (or just copy a link and click back into DRAG).
- Pick **Video** or **Audio** and the quality, then click **GRAB**.
- When it's done, drag the card straight onto your timeline. With Final Cut Pro installed, clips are also imported into an event called **DRAG**.
- Files are saved to `~/Movies/DRAG` (change it with **Browse…**).

Only download content you have the rights to use.
