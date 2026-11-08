# tomasmprado/tap

Homebrew tap for [Goodreads for Mac](https://github.com/tomasmprado/Native-GoodReads).

```bash
brew tap tomasmprado/tap
brew trust tomasmprado/tap
brew install --cask native-goodreads
```

Homebrew 7 asks you to trust a tap before installing from it; that's the
`brew trust` line.

The app isn't notarised by Apple, so the cask removes the "downloaded from the
internet" flag after installing, as the app's own `install.sh` does. So the
Keychain stops asking for your password after every update, sign the app once
with a certificate made on your Mac (kept in your login keychain, used for
nothing else):

```bash
bash "$(brew --repository tomasmprado/tap)/install.sh" --resign
```

The app updates itself; `brew upgrade --greedy` works too. `brew uninstall
--zap --cask native-goodreads` also removes its data and settings.
