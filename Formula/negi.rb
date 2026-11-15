class Negi < Formula
  desc "Phone remote for tmux and the Mac's screen, over your tailnet"
  homepage "https://github.com/rifuki/negi"
  url "https://github.com/rifuki/negi/releases/download/v0.1.0/negi-0.1.0-darwin-universal.tar.gz"
  sha256 "0cb4b5ac8baf7b6f3ee84c5da6f7d6b8a0688756624f542ebcae5ca65a6bae8b"
  license "MIT"

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
