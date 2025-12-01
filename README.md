# 🕯 Windows Night Light CLI

A command line tool to enable/disable Windows Night Light, change its intensity and/or change your monitor brigthness.

```console
# Set monitor Brightness to 50%
wnl -brightness=50 

# Set monitor Brightness to 50%, NightLight enabled to 25% intensity
wnl -nightlight=1 -nightlight_strength=25 -brightness=50

# Disabled NightLight
wnl -nightlight=0 -brightness=50

# Enabled NightLight
wnl -nightlight=1 -brightness=50
```

> ⭐ stars to the repo help improve my dev career!

> [!WARNING]  
> Windows does not expose an API for Night Light CLI management by default, this is a bit of a hacky approach.
> 
> 🕯 This project has a GUI version here https://github.com/elModo7/FireFlyFy
