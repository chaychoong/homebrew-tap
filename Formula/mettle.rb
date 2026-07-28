class Mettle < Formula
  desc "A Rust reimplementation of the Alloy 6 language and analyzer"
  homepage "https://github.com/chaychoong/mettle"
  version "0.1.1"
  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/chaychoong/mettle/releases/download/v0.1.1/mettle-aarch64-apple-darwin.tar.xz"
      sha256 "2539418858c1e9efc5493ce6799b54feaa82d516489c51923cd1c9f03c69ade8"
    end
    if Hardware::CPU.intel?
      url "https://github.com/chaychoong/mettle/releases/download/v0.1.1/mettle-x86_64-apple-darwin.tar.xz"
      sha256 "9a15246541ac663adafe730859f8aed9f37c6ab9a9a87a70ba0381afdaafd23f"
    end
  end
  if OS.linux?
    if Hardware::CPU.arm?
      url "https://github.com/chaychoong/mettle/releases/download/v0.1.1/mettle-aarch64-unknown-linux-gnu.tar.xz"
      sha256 "e48dbde1ca616ad802022d651825b25ce41e7842c281f6dcb587f8db50328216"
    end
    if Hardware::CPU.intel?
      url "https://github.com/chaychoong/mettle/releases/download/v0.1.1/mettle-x86_64-unknown-linux-gnu.tar.xz"
      sha256 "d90d2b2f4322736e61e396c6c708ecd4648abb5af5689450c753277d5e768262"
    end
  end
  license "MPL-2.0"

  BINARY_ALIASES = {
    "aarch64-apple-darwin":      {},
    "aarch64-unknown-linux-gnu": {},
    "x86_64-apple-darwin":       {},
    "x86_64-unknown-linux-gnu":  {},
  }.freeze

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
    bin.install "mettle" if OS.mac? && Hardware::CPU.arm?
    bin.install "mettle" if OS.mac? && Hardware::CPU.intel?
    bin.install "mettle" if OS.linux? && Hardware::CPU.arm?
    bin.install "mettle" if OS.linux? && Hardware::CPU.intel?

    install_binary_aliases!

    # Homebrew will automatically install these, so we don't need to do that
    doc_files = Dir["README.*", "readme.*", "LICENSE", "LICENSE.*", "CHANGELOG.*"]
    leftover_contents = Dir["*"] - doc_files

    # Install any leftover files in pkgshare; these are probably config or
    # sample files.
    pkgshare.install(*leftover_contents) unless leftover_contents.empty?
  end
end
