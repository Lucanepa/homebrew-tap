cask "openvolley" do
  version "26.11.9"
  sha256 "08663268b911faa5dfc9a5e719617a9a0e1642257685aa8ee3039e54c5ecedfb"

  url "https://github.com/Lucanepa/openvolley/releases/download/desktop-v#{version}/OpenVolley.eScoresheet_#{version}_universal.dmg",
      verified: "github.com/Lucanepa/openvolley/"
  name "OpenVolley eScoresheet"
  desc "Offline volleyball e-scoresheet and LAN server for referee and livescore tablets"
  homepage "https://get.openvolley.app/"

  livecheck do
    url "https://get.openvolley.app/desktop/latest.json"
    strategy :json do |json|
      json["version"]
    end
  end

  # The app updates itself (signed updates, installed when the scorer quits).
  auto_updates true
  depends_on macos: ">= :big_sur"

  app "OpenVolley eScoresheet.app"

  # The match backups (~/Library/Application Support/OpenVolley) stay.
  zap trash: [
    "~/Library/Application Support/com.openvolley.escoresheet",
    "~/Library/Caches/com.openvolley.escoresheet",
    "~/Library/Logs/OpenVolley",
    "~/Library/Preferences/com.openvolley.escoresheet.plist",
    "~/Library/Saved Application State/com.openvolley.escoresheet.savedState",
    "~/Library/WebKit/com.openvolley.escoresheet",
  ]
end
