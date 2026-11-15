cask "openbeach" do
  version "3.0.4"
  sha256 "780d89f8c857bdf9945588cb45eb50da80a7e925f534148198595a7d376f3eb9"

  url "https://github.com/Lucanepa/openvolley/releases/download/beach-desktop-v#{version}/OpenBeach_#{version}_universal.dmg",
      verified: "github.com/Lucanepa/openvolley/"
  name "OpenBeach"
  desc "Offline beach volleyball e-scoresheet and LAN server for referee tablets"
  homepage "https://get.openvolley.app/#openbeach"

  livecheck do
    url "https://get.openvolley.app/desktop/beach/latest.json"
    strategy :json do |json|
      json["version"]
    end
  end

  # The app updates itself (signed updates, installed when the scorer quits).
  auto_updates true
  depends_on macos: ">= :big_sur"

  app "OpenBeach.app"

  # The match backups (~/Library/Application Support/OpenBeach) stay.
  zap trash: [
    "~/Library/Application Support/com.openvolley.beach",
    "~/Library/Caches/com.openvolley.beach",
    "~/Library/Logs/OpenBeach",
    "~/Library/Preferences/com.openvolley.beach.plist",
    "~/Library/Saved Application State/com.openvolley.beach.savedState",
    "~/Library/WebKit/com.openvolley.beach",
  ]
end
