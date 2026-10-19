cask "point-hub" do
  arch arm: "arm64", intel: "x64"

  version "1.1.0"
  sha256 arm:   "71b8d8092f754a18089a3be508085b01022f4d2e9d6ac56a66c3941829f90264",
         intel: "570901a220aa59ea801181da75ded7c1443a6c0a6e93e7d92d72c67fe13829ab"

  url "https://github.com/Lucanepa/point-hub/releases/download/desktop-v#{version}/Point-Hub-#{version}-macos-#{arch}.dmg",
      verified: "github.com/Lucanepa/point-hub/"
  name "Point Hub"
  desc "Console of the KSCW LedBox scoreboard"
  homepage "https://github.com/Lucanepa/point-hub"

  # Its desktop releases are GitHub's "Latest" of that repo, tagged desktop-v<version>.
  livecheck do
    url :url
    regex(/^desktop-v?(\d+(?:\.\d+)+)$/i)
    strategy :github_latest
  end

  # Chromium in its runtime needs macOS 12; the bundle says so too (LSMinimumSystemVersion).
  depends_on macos: ">= :monterey"

  # No auto_updates: Point Hub has no updater, `brew upgrade` brings each version.
  app "point-hub.app"

  # The settings and the game backups (~/Library/Application Support/Point Hub) stay.
  zap trash: [
    "~/Library/Caches/ch.kscw.pointhub",
    "~/Library/Preferences/ch.kscw.pointhub.plist",
    "~/Library/Saved Application State/ch.kscw.pointhub.savedState",
  ]

  caveats <<~EOS
    Point Hub is not notarized by Apple, so macOS blocks its first start.
    Open it once, then System Settings > Privacy & Security > Open Anyway.
    Or in Terminal:
      xattr -dr com.apple.quarantine "/Applications/point-hub.app"
  EOS
end
