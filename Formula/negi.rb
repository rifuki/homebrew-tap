class Negi < Formula
  desc "tmux and your Mac's screen, on your phone, over your tailnet"
  homepage "https://github.com/rifuki/negi"
  url "https://github.com/rifuki/negi/releases/download/v0.1.0/negi-0.1.0-darwin-universal.tar.gz"
  sha256 "1fe8eea21f3bae62da6e5e6fea5b02c3bc202ff745229d5e423ccd2d5e5ffc04"
  license "MIT"
  version "0.1.0"

  depends_on :macos
  depends_on "tmux"

  def install
    bin.install "negi"
  end

  service do
    run [opt_bin/"negi", "serve"]
    keep_alive true
    log_path var/"log/negi.log"
    error_log_path var/"log/negi.log"
  end

  test do
    assert_match "negi #{version}", shell_output("#{bin}/negi --version")
  end
end
