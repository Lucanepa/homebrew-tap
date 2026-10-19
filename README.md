# Lucanepa/homebrew-tap

Homebrew casks of the OpenVolley desktop apps for macOS 11 or newer (Apple
silicon and Intel, one universal app), and of Point Hub, KSC Wiedikon's
scoreboard console (one disk image per architecture):

```bash
brew install --cask lucanepa/tap/openvolley   # OpenVolley eScoresheet
brew install --cask lucanepa/tap/openbeach    # OpenBeach
brew install --cask lucanepa/tap/point-hub    # Point Hub
```

The apps are not notarized by Apple (no paid developer account), so macOS
blocks the first start: open the app once, then System Settings > Privacy &
Security > Open Anyway, or

```bash
xattr -dr com.apple.quarantine "/Applications/OpenVolley eScoresheet.app"
```

The OpenVolley apps update themselves (signed updates, installed when you
quit, never during a match); `brew upgrade` only follows. Point Hub does not
update itself: `brew upgrade` brings each new version (its first start is
blocked the same way: `xattr -dr com.apple.quarantine /Applications/point-hub.app`).
More: https://get.openvolley.app
