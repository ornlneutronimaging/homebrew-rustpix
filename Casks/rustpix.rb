cask "rustpix" do
  version "1.0.5"
  sha256 "58775035cd864e6c7c1ea2d01b35ecdf114f9dbf59986a60b89b5289bfb48771"

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
