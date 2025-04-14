# Weekly-Motivation-collaboration-Bot-for-Teams-Slack
Provides weekly scheduled motivational updates tailored for Teams including a GIF

This is a PowerShell script that promotes team collaboration and morale by sharing daily motivational messages and GIFs in Microsoft Teams. The bot dynamically calculates the countdown to Friday and posts weekday-specific motivational content to keep your team engaged and inspired.

**Features**

Daily Countdown to Friday: Automatically calculates the number of days until Friday and shares it with your team.

Motivational GIFs: Fetches random GIFs from Giphy based on the theme of each weekday (e.g., "motivation" for Monday, "celebration" for Friday).

Microsoft Teams Integration: Posts messages directly to Microsoft Teams using adaptive cards via a webhook.

Customizable Themes: Tags for GIFs can be tailored to match your team's preferences.

**How It Works**

The script determines the current day of the week in AEST (Australian Eastern Standard Time).

It calculates how many days are left until Friday.

A random GIF is fetched from Giphy based on a predefined tag for the day.

The script formats a motivational message and sends it to Microsoft Teams via a webhook.

**Setup Instructions**

**Prerequisites**

Microsoft Teams Webhook URL:
1. Find the channel you want to post the message to
2. Right click the channel and select workflows
3. Select Post to a channel when a webhook request is received this will create a webhook

Giphy API Key:
Sign up for a free API key at Giphy Developers - https://developers.giphy.com/

**Installation**

Clone this repository:
Update the script (scripts/daily_countdown.ps1) with your:
Microsoft Teams Webhook URL ($webhookUrl).
Giphy API Key ($giphyApiKey).

**Usage**

Run the script manually:
powershell
.\scripts\daily_countdown.ps1

Automate it by scheduling the script to run daily using Windows Task Scheduler:
Open Task Scheduler.
Create a new task.
Set the trigger to run daily at a specific time.
Add an action to execute PowerShell and point it to daily_countdown.ps1.

Automate with Azure Runbooks:
Create Azure Runbook
Create schedule

Automate with Ansible AWX:
I have created a J2 template for this script with all required parameters for survey

**Example Output**

Below is an example of how the message appears in Microsoft Teams:

Adaptive Card Example:
![Example Output](assets/example_outputage**:

"Happy Monday Team! Only 4 days until Friday! Let's start the week strong! 💪"
(Accompanied by a motivational GIF)

Friday Message:

"Happy Friday Team! 🎉 Hope you all have a great weekend!"
(Accompanied by a celebratory GIF)

Customization
You can modify the tags for each day of the week in the $tags hashtable within daily_countdown.ps1. For example:

powershell
$tags = @{
    Monday    = "motivation"
    Tuesday   = "work"
    Wednesday = "humpday"
    Thursday  = "almostthere"
    Friday    = "celebration"
}
Feel free to adjust these tags based on your team's preferences!

Contributing
Contributions are welcome! If you have ideas for improving this project, feel free to fork the repository, make changes, and submit a pull request.

License
This project is licensed under the MIT License. See LICENSE for details.

Acknowledgments:
Giphy API for providing awesome GIFs.
My manager who was really perssistent on this initiative

Inspired by the need for fun, collaborative tools in remote work environments.
Let me know if you'd like further adjustments or additional sections added! 😊
