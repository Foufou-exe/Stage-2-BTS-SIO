import piscord
bot = Bot("OTM1NTA4MzM5Mzc3NDY3NDIz.Ye_qCQ.JoIEpTh6rl3yt35nxPRifCUNAP8")

@bot.event
def on_ready(ready):
    print(f"Bot {ready.user.name} Connected to server")

bot.run()