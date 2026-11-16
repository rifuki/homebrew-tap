class Negi < Formula
  desc "Phone remote for tmux and the Mac's screen, over your tailnet"
  homepage "https://github.com/rifuki/negi"
  url "https://github.com/rifuki/negi/releases/download/v0.2.12/negi-0.2.12-darwin-arm64.tar.gz"
  sha256 "ad23248a62c33f5bf02fcf9e7c05bece03bf6886e7a69dec007ced6794eaf4ca"
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
