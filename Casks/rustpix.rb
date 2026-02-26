cask "rustpix" do
  version "1.1.1"
  sha256 "790fa3cfa6fea1c3f55704f4376a9c48b0997b0f9b19e65f3a04f9cdb9b3bd5b"

  url "https://github.com/ornlneutronimaging/rustpix/releases/download/v#{version}/rustpix-#{version}-macos-arm64.dmg"
  name "Rustpix"
  desc "High-performance TPX3 pixel detector data processing GUI"
  homepage "https://github.com/ornlneutronimaging/rustpix"

  depends_on macos: ">= :big_sur"
  depends_on arch: :arm64

  app "Rustpix.app"

  postflight do
    system_command "/bin/echo",
                   args: ["Removing quarantine attribute from Rustpix.app (app is not code-signed)..."]
    system_command "/usr/bin/xattr",
                   args: ["-cr", "#{appdir}/Rustpix.app"]
    system_command "/bin/echo",
                   args: ["Done. Rustpix.app is ready to use."]
  end

  zap trash: [
    "~/Library/Preferences/gov.ornl.rustpix.plist",
    "~/Library/Saved Application State/gov.ornl.rustpix.savedState",
  ]
end
