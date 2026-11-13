cask "openshelf" do
  version "3.3.0"
  sha256 "44f1cce06537c517dcc7ac439d41ff92fa24bbd80a0c7be6bc6df601411cedd0"

  url "https://github.com/tomasmprado/OpenShelf/releases/download/v#{version}/OpenShelf.dmg"
  name "OpenShelf"
  desc "Native app for your Goodreads shelves, suggestions and reading stats"
  homepage "https://tomasmprado.github.io/OpenShelf/"

  livecheck do
    url :url
    strategy :github_latest
  end

  # The app updates itself.
  auto_updates true
  depends_on macos: :ventura

  app "OpenShelf.app"

  # The app isn't notarised by Apple, so the "downloaded from the internet"
  # flag comes off, as install.sh does, or macOS won't open it.
  postflight_steps do
    run "/usr/bin/xattr",
        args:           ["-dr", "com.apple.quarantine", "{{appdir}}/OpenShelf.app"],
        writable_paths: ["{{appdir}}/OpenShelf.app"]
  end

  uninstall quit: "local.goodreads.gui"

  zap trash: [
    "~/Library/Application Support/GoodreadsGUI",
    "~/Library/Caches/local.goodreads.gui",
    "~/Library/Containers/local.goodreads.gui.share",
    "~/Library/Containers/local.goodreads.gui.widget",
    "~/Library/HTTPStorages/local.goodreads.gui",
    "~/Library/HTTPStorages/local.goodreads.gui.binarycookies",
    "~/Library/Preferences/local.goodreads.gui.plist",
    "~/Library/WebKit/local.goodreads.gui",
  ]

  caveats <<~EOS
    So the Keychain stops asking for your password after every update, sign
    the app once with a certificate made on this Mac (kept in your login
    keychain, used for nothing else):
      bash "$(brew --repo tomasmprado/tap)/install.sh" --resign

    The first time it opens, choose Always Allow if macOS asks for your
    login password so the app can use the Keychain.
  EOS
end
