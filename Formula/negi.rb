class Negi < Formula
  desc "Phone remote for tmux and the Mac's screen, over your tailnet"
  homepage "https://github.com/rifuki/negi"
  url "https://github.com/rifuki/negi/releases/download/v0.2.11/negi-0.2.11-darwin-arm64.tar.gz"
  sha256 "90cbbebbe51506ee366d7a362d8717c0a1056308b0ed5c1093dd8e9bf89ae4e9"
  license "MIT"

  depends_on arch: :arm64
  depends_on macos: :monterey
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
