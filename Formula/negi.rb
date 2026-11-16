class Negi < Formula
  desc "Phone remote for tmux and the Mac's screen, over your tailnet"
  homepage "https://github.com/rifuki/negi"
  url "https://github.com/rifuki/negi/releases/download/v0.2.18/negi-0.2.18-darwin-arm64.tar.gz"
  sha256 "6c597db855c6b28957857e69ef8455c8170c4f498549fe8e86a712816466038b"
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
