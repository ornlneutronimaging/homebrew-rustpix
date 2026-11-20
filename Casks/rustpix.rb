cask "rustpix" do
  version "1.4.2"
  sha256 "4fad46243038d336631bec61628318506102a53cf44bbd6520d08bc62f8fbc9a"

  url "https://github.com/ornlneutronimaging/rustpix/releases/download/v#{version}/rustpix-#{version}-macos-arm64.dmg"
  name "Rustpix"
  desc "High-performance TPX3 pixel detector data processing GUI"
  homepage "https://github.com/ornlneutronimaging/rustpix"

  depends_on macos: :big_sur
  depends_on arch: :arm64

  app "Rustpix.app"

  # The app is not code-signed, so strip the quarantine attribute that would
  # otherwise make Gatekeeper report it as damaged.
  postflight_steps do
    run "/usr/bin/xattr", args: ["-cr", "{{appdir}}/Rustpix.app"]
  end

  zap trash: [
    "~/Library/Preferences/gov.ornl.rustpix.plist",
    "~/Library/Saved Application State/gov.ornl.rustpix.savedState",
  ]
end
