# Webhook URL
$webhookUrl = "Web_Hook_URL"

# Giphy API Key (replace with your own API key)
$giphyApiKey = "API_key"

# Define tags for each day of the week
$tags = @{
    Monday    = "motivation"
    Tuesday   = "work"
    Wednesday = "humpday"
    Thursday  = "almostthere"
    Friday    = "celebration"
}

# Get the current day in AEST
$currentDay = (Get-Date -Date ([DateTime]::UtcNow.AddHours(10))).DayOfWeek.ToString()

# Calculate days until Friday
$daysUntilFriday = [Math]::Max(0, ([DayOfWeek]::Friday - [Enum]::Parse([DayOfWeek], $currentDay)) % 7)

# Fetch a random GIF URL from Giphy based on the tag
$tag = $tags[$currentDay]
$giphyResponse = Invoke-RestMethod -Uri "https://api.giphy.com/v1/gifs/random?api_key=$giphyApiKey&tag=$tag" -Method Get

# Extract the GIF URL
$gifUrl = $giphyResponse.data.images.original.url

# Message content for Teams
$messageContent = @{
    type        = "message"
    attachments = @(
        @{
            contentType = "application/vnd.microsoft.card.adaptive"
            content     = @{
                '$schema'  = "http://adaptivecards.io/schemas/adaptive-card.json"
                type       = "AdaptiveCard"
                version    = "1.0"
                body       = @(
                    @{
                        type  = "Image"
                        url   = $gifUrl
                        altText = "$currentDay GIF"
                    },
                    @{
                        type  = "TextBlock"
                        text  = if ($currentDay -eq "Friday") {
                                    "Happy Friday Team! 🎉 Hope you all have a great weekend!"
                                } else {
                                    "Happy $currentDay Team! Only $daysUntilFriday days until Friday!"
                                }
                        size  = "Medium"
                        weight = "Bolder"
                    }
                )
            }
        }
    )
}

# Convert message content to JSON format
$jsonPayload = $messageContent | ConvertTo-Json -Depth 10 -Compress

# Post the message to Microsoft Teams via webhook
Invoke-RestMethod -Uri $webhookUrl -Method Post -ContentType "application/json" -Body $jsonPayload
