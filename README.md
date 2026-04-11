
# SoC eng lua downloader 

This batch script automatically downloads English lua from this repo into your TW folder.

### How to use:
1. **Download** the `soc_download_lua.bat` from repository.
2. **Edit** it with any prefered editor.
3. Find the line `set "TWDir=` and put your **game folder path** (`...\SwordofConvallaria\SoCLauncher\SwordOfConvallaria\assets\lua`) inside the quotes.
4. Save the file.

### When to run:
Run this script every time after any client update.

### How it works

The script manages the update process for lua with the following logic:

*   The script compares the remote file size with the local file size.
*   A download is initiated only if the sizes do not match.
*   Before downloading, local lua is backed up by renaming it to `_lua_dblang_zh-tw.unity3d`.
*   If the download fails, the script automatically restores original file (`_lua_dblang_zh-tw.unity3d` is renamed back to `lua_dblang_zh-tw.unity3d`).

### Troubleshooting:
If for any magical reason the script doesn't work:
1. Download lua file from this repo manually.
2. Place it into your TW game folder (`...\SwordofConvallaria\SoCLauncher\SwordOfConvallaria\assets\lua`).
3. Rename it to **lua_dblang_zh-tw.unity3d**
4. **Ping me** here or on Discord so I can fix the issue.

&nbsp;

Good luck on your pulls!