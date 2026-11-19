cask "openvolley" do
  version "3.5.0"
  sha256 "ed1adf87f73e123bb41bc51fb79d88b254673c05be73556e6be7f5ba74b3b408"

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
