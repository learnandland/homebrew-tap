# Learn and Land Homebrew tap

Hangar runs Learn and Land practice notebooks on your own Mac. It needs a Mac with Apple
Silicon (M1 or later) and macOS 15 or later.

> **Not available yet.** The cask arrives with Hangar's first production release. Until
> then this tap is empty, `brew install` reports "No available cask", and Hangar is
> available to internal testers only.

## Install

If you don't have Homebrew yet, install it first (the official installer from
[brew.sh](https://brew.sh)), then run the two lines it prints at the end to add `brew` to
your shell:

```sh
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

Then install Hangar with one command:

```sh
brew install learnandland/tap/hangar
```

Homebrew adds this tap on the way, trusts the cask you named, downloads the notarized app,
checks it and copies `Hangar.app` to `/Applications`. Open Hangar (Launchpad, or
`open -a Hangar`) and pair it from the Learn and Land website.

Or in steps, if you prefer the short name afterwards. Homebrew 7 loads casks from a
non-official tap only once you trust it, so the short name needs `brew trust` first:

```sh
brew tap learnandland/tap
brew trust --cask learnandland/tap/hangar
brew install hangar
```

`brew install learnandland/hangar` doesn't work: Homebrew reads a two-part name as a tap.

## Update

Nothing to do: Hangar updates itself. `brew upgrade` leaves it alone (`brew upgrade --greedy
hangar` only brings Homebrew's record up to date).

## Uninstall

The cleanest way is Hangar's own **☰ → Uninstall**: it also unpairs this Mac from your
account. With Homebrew:

| Command | Removes |
|---|---|
| `brew uninstall hangar` | The app only; your data and pairing stay |
| `brew uninstall --zap hangar` | The app, its data folder, caches, settings and its key in your keychain |

After `--zap`, the Mac stays listed under your devices on the website until you remove it
there.

To remove the tap too: `brew untap learnandland/tap`.

## For maintainers

`Casks/hangar.rb` is written by the **Promote Hangar to production (macOS)** workflow
(`release-hangar-macos-promote.yml` in `learnandland-org/learnandland`), from
`hangar/packaging/macos/hangar.rb.template`, each time a stage build is promoted to
production. It pushes with a write deploy key on this repo (Settings → Deploy keys), whose
private half is the `HANGAR_TAP_DEPLOY_KEY` secret in that repo's `production` environment.
Don't edit the cask here: change the template instead.
