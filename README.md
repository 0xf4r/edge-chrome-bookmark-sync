## Two-Way Bookmark Sync Between Microsoft Edge and Google Chrome

### Description
This project provides a simple automation script to synchronize bookmarks between Microsoft Edge and Google Chrome based on the last modified file. It uses a batch script to compare the modification times of the bookmark files in both browsers, ensuring that the most recent bookmarks are always up-to-date across both platforms.

### Features
- **Automatic Bookmark Synchronization**: Syncs the latest modified bookmarks between Edge and Chrome.
- **Customizable Scheduling**: Use Task Scheduler to run the script automatically at specified intervals or events.
- **Simple and Lightweight**: Minimal dependencies, only requiring a batch script and Task Scheduler.

### Requirements
- Windows operating system.
- Google Chrome and Microsoft Edge installed.
- Basic understanding of batch scripting and Task Scheduler.

### Setup Instructions

1. **Clone the Repository**:
   ```bash
   git clone https://github.com/0xf4r/edge-chrome-bookmark-sync.git
   cd edge-chrome-bookmark-sync
   ```

2. **Update the Script**:
   - Open `sync_bookmarks.bat` and replace `USERNAME` with your actual Windows username.

3. **Batch Script**: `sync_bookmarks.bat`
   ```batch
   @echo off
   setlocal

   REM Define paths to the bookmark files for Edge and Chrome
   set CHROME_BOOKMARKS="C:\Users\USERNAME\AppData\Local\Google\Chrome\User Data\Default\Bookmarks"
   set EDGE_BOOKMARKS="C:\Users\USERNAME\AppData\Local\Microsoft\Edge\User Data\Default\Bookmarks"

   REM Get the last modified times of the bookmark files
   for %%f in (%CHROME_BOOKMARKS%) do set CHROME_MODIFIED=%%~tf
   for %%f in (%EDGE_BOOKMARKS%) do set EDGE_MODIFIED=%%~tf

   REM Compare the last modified times and sync accordingly
   if "%CHROME_MODIFIED%" GTR "%EDGE_MODIFIED%" (
       copy /Y %CHROME_BOOKMARKS% %EDGE_BOOKMARKS%
       echo Chrome bookmarks were newer and copied to Edge.
   ) else (
       copy /Y %EDGE_BOOKMARKS% %CHROME_BOOKMARKS%
       echo Edge bookmarks were newer and copied to Chrome.
   )

   endlocal
   ```

4. **Set Up Task Scheduler**:
   - Open Task Scheduler.
   - Create a new task to run `sync_bookmarks.bat` at your desired schedule (e.g., daily or at logon).

### Usage

- Run the batch script manually or let it run automatically through Task Scheduler.
- The script will check which browser's bookmarks were modified last and sync them to the other browser.

### Example
```bash
# Clone the repo
git clone https://github.com/0xf4r/edge-chrome-bookmark-sync.git

# Customize the script with your paths
notepad sync_bookmarks.bat

# Run the script manually or set up Task Scheduler to automate
```

### License
This project is licensed under the MIT License.
