class Mettle < Formula
  desc "A Rust reimplementation of the Alloy 6 language and analyzer"
  homepage "https://github.com/chaychoong/mettle"
  version "0.1.0"
  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/chaychoong/mettle/releases/download/v0.1.0/mettle-aarch64-apple-darwin.tar.xz"
      sha256 "e4ec559bb71e5a729f67cd7fb377f46a95344a17cb89e38a2f7cde557c4cef33"
    end
    if Hardware::CPU.intel?
      url "https://github.com/chaychoong/mettle/releases/download/v0.1.0/mettle-x86_64-apple-darwin.tar.xz"
      sha256 "bd6b7b4af2e1198d819667562495aa2fe35fd41f0a5e65b781dafe239d26ef7d"
    end
  end
  if OS.linux?
    if Hardware::CPU.arm?
      url "https://github.com/chaychoong/mettle/releases/download/v0.1.0/mettle-aarch64-unknown-linux-gnu.tar.xz"
      sha256 "e8a331a91924d7be66d3e5055706f56b7708bce33d2b49c5734716371890b514"
    end
    if Hardware::CPU.intel?
      url "https://github.com/chaychoong/mettle/releases/download/v0.1.0/mettle-x86_64-unknown-linux-gnu.tar.xz"
      sha256 "352ee3901e512e8e0a41602c58132d3d1cbb805eadfcd5e5b6952623d50b7836"
    end
  end
  license "MPL-2.0"

  BINARY_ALIASES = {
    "aarch64-apple-darwin": {},
    "aarch64-unknown-linux-gnu": {},
    "x86_64-apple-darwin": {},
    "x86_64-unknown-linux-gnu": {}
  }

  def target_triple
    cpu = Hardware::CPU.arm? ? "aarch64" : "x86_64"
    os = OS.mac? ? "apple-darwin" : "unknown-linux-gnu"

    "#{cpu}-#{os}"
  end

  def install_binary_aliases!
    BINARY_ALIASES[target_triple.to_sym].each do |source, dests|
      dests.each do |dest|
        bin.install_symlink bin/source.to_s => dest
      end
    end
  end

  def install
    if OS.mac? && Hardware::CPU.arm?
      bin.install "mettle"
    end
    if OS.mac? && Hardware::CPU.intel?
      bin.install "mettle"
    end
    if OS.linux? && Hardware::CPU.arm?
      bin.install "mettle"
    end
    if OS.linux? && Hardware::CPU.intel?
      bin.install "mettle"
    end

    install_binary_aliases!

    # Homebrew will automatically install these, so we don't need to do that
    doc_files = Dir["README.*", "readme.*", "LICENSE", "LICENSE.*", "CHANGELOG.*"]
    leftover_contents = Dir["*"] - doc_files

    # Install any leftover files in pkgshare; these are probably config or
    # sample files.
    pkgshare.install(*leftover_contents) unless leftover_contents.empty?
  end
end
