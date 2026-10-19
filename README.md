# Learn and Land Homebrew tap

Hangar runs Learn and Land practice notebooks on your own Mac (Apple Silicon, macOS 15
or later). Once its first production release is out:

```sh
brew install --cask learnandland/tap/hangar
```

Until then this tap has no cask, and Hangar is available to internal testers only.

`Casks/hangar.rb` is written by the **Publish Hangar (macOS)** workflow in
`learnandland-org/learnandland` (from `hangar/packaging/macos/hangar.rb.template`) each
time a tagged `hangar-v*` build is published to the production channel. Don't edit it by
hand: change the template instead.
