cask "font-opus-one" do
  version "1.1"
  sha256 "a0dcee246125492330b61c5bd85fb2f29e3e280e2b9890f3a15e1c65d470abc9"

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
