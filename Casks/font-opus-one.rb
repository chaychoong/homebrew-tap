cask "font-opus-one" do
  version "1.2"
  sha256 "c767ded11b24f63ffb548ea8fbba9620c450e12165cb65035e907c68821380ae"

  url "https://github.com/chaychoong/OpusOne/archive/refs/tags/v#{version}.tar.gz"
  name "Opus One"
  homepage "https://github.com/chaychoong/OpusOne"

  font "OpusOne-#{version}/fonts/ttf/OpusOne-Regular.ttf"
  font "OpusOne-#{version}/fonts/ttf/OpusOne-RegularItalic.ttf"
  font "OpusOne-#{version}/fonts/ttf/OpusOne-Bold.ttf"
  font "OpusOne-#{version}/fonts/ttf/OpusOne-BoldItalic.ttf"
  font "OpusOne-#{version}/fonts/variable/OpusOneVF[wght,ital].ttf"

  # No zap stanza required
end
