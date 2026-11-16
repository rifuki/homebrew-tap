class Negi < Formula
  desc "Phone remote for tmux and the Mac's screen, over your tailnet"
  homepage "https://github.com/rifuki/negi"
  url "https://github.com/rifuki/negi/releases/download/v0.2.5/negi-0.2.5-darwin-arm64.tar.gz"
  sha256 "e779891c20fd55f147fee0654e139a14ea1d04a45ef36ef07f9d54bf7e576898"
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
