cask "rustpix" do
  version "1.0.4"
  sha256 "660f40f47ec540ae239f2115fd7f4f1d72755252672616bc89446c1325fdd2d2"

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
