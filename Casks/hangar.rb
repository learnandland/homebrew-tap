# Homebrew cask for Learn and Land Hangar, the native macOS app (plan_003; spec §10.5).
# Rendered by .github/workflows/release-hangar-macos-promote.yml into
# learnandland/homebrew-tap/Casks/hangar.rb (0.1.0 / 140a7aca25e112c8597a89e70692b65c14bc800fab856b9e49c19ba9720a4a5c substituted) when a stage
# build is promoted to production (needs HANGAR_TAP_TOKEN in the production environment).
# Hangar updates itself (hangar/macos/Sources/HangarUI/Updater/), so `brew upgrade` leaves it
# alone unless run with --greedy; the cask still moves to each promoted version.
# `brew uninstall` removes only the app: Hangar's own ☰ Uninstall also unpairs the device and
# removes its login item, data and key.
cask "hangar" do
  version "0.1.0"
  sha256 "140a7aca25e112c8597a89e70692b65c14bc800fab856b9e49c19ba9720a4a5c"

  url "https://downloads.learnandland.com/hangar/macos/production/#{version}/Hangar-#{version}.dmg"
  name "Learn and Land Hangar"
  desc "Run Learn and Land practice notebooks on your own machine"
  homepage "https://learnandland.com/"

  livecheck do
    url "https://downloads.learnandland.com/hangar/macos/production/latest.json"
    strategy :json do |json|
      json["version"]
    end
  end

  auto_updates true
  depends_on arch: :arm64
  depends_on macos: :sequoia

  app "Hangar.app"

  uninstall quit: "com.learnandland.hangar"

  # `brew uninstall --zap hangar` removes everything Hangar wrote (spec §6.3).
  # The device key's keychain item (DeviceKeychain.swift: service com.learnandland.hangar, one
  # per Hangar root); the Secure Enclave key itself lives in the root and goes with it.
  zap script: {
        executable:   "/usr/bin/security",
        args:         ["delete-generic-password", "-s", "com.learnandland.hangar"],
        must_succeed: false,
      },
      trash:  [
        "~/Library/Application Support/LearnAndLand/Hangar",
        "~/Library/Caches/com.learnandland.hangar",
        "~/Library/HTTPStorages/com.learnandland.hangar",
        "~/Library/Preferences/com.learnandland.hangar.plist",
        "~/Library/WebKit/com.learnandland.hangar",
      ]
end
