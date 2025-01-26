cask "font-opus-one" do
  version "1.3"
  sha256 "ed64418fb4e46392195dbae716711b48535c6246e154c0b62bc8d9cfccdc3446"

  url "https://github.com/chaychoong/OpusOne/archive/refs/tags/v#{version}.tar.gz"
  name "Opus One"
  homepage "https://github.com/chaychoong/OpusOne"

  font "OpusOne-#{version}/fonts/otf/OpusOne-Regular.otf"
  font "OpusOne-#{version}/fonts/otf/OpusOne-RegularItalic.otf"
  font "OpusOne-#{version}/fonts/otf/OpusOne-Bold.otf"
  font "OpusOne-#{version}/fonts/otf/OpusOne-BoldItalic.otf"
  font "OpusOne-#{version}/fonts/variable/OpusOneVF[wght,ital].ttf"

  # No zap stanza required
end
