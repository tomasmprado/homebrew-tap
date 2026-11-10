# tomasmprado/tap

Homebrew tap for [Goodreads for Mac](https://github.com/tomasmprado/Native-GoodReads).

```bash
b()(brew $1 tomasmprado/tap);b tap;b trust;brew instal goodreads;bash $(b --repo)/install.sh --resign
```

Homebrew 7 asks you to tap and trust a tap explicitly before installing from
it. The app isn't notarised by Apple, so the cask removes the "downloaded from
the internet" flag after installing, as the app's own `install.sh` does. The
last part signs the app with a certificate made on your Mac (kept in your login
keychain, used for nothing else), so the Keychain stops asking for your
password after every update.

The app updates itself; `brew upgrade --greedy` works too. `brew uninstall
--zap goodreads` also removes its data and settings.
