class Mettle < Formula
  desc "A Rust reimplementation of the Alloy 6 language and analyzer"
  homepage "https://github.com/chaychoong/mettle"
  version "0.1.0"
  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/chaychoong/mettle/releases/download/v0.1.0/mettle-aarch64-apple-darwin.tar.xz"
      sha256 "77ca9c42f3a253c435021472dca4c06135c5a64ac836bf2edefadd0d4b05b940"
    end
    if Hardware::CPU.intel?
      url "https://github.com/chaychoong/mettle/releases/download/v0.1.0/mettle-x86_64-apple-darwin.tar.xz"
      sha256 "326b26bfc14d370810755d517eab225384474ebc8eaee9e631e6b767092754eb"
    end
  end
  if OS.linux?
    if Hardware::CPU.arm?
      url "https://github.com/chaychoong/mettle/releases/download/v0.1.0/mettle-aarch64-unknown-linux-gnu.tar.xz"
      sha256 "26fd039db0b404a92c6e067ee973fda77e2f7065c23ece1ffc58b3dcc07df0bf"
    end
    if Hardware::CPU.intel?
      url "https://github.com/chaychoong/mettle/releases/download/v0.1.0/mettle-x86_64-unknown-linux-gnu.tar.xz"
      sha256 "47542721c4fd2e3967a77eb1bf1870d955908cff905be9696c3c821740cc4d27"
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
