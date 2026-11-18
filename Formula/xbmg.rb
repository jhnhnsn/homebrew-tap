class Xbmg < Formula
  desc "Browse, view and download Xbox screenshots and game clips in the terminal"
  homepage "https://github.com/jhnhnsn/xbmg"
  url "https://github.com/jhnhnsn/xbmg/archive/refs/tags/v0.1.0.tar.gz"
  sha256 "467501affdc68ade2fa6e2d977974908ff5d4b80e50268bffef16b5424d43c29"
  license "MIT"

  depends_on "node"

  def install
    system "npm", "install", *std_npm_args
    bin.install_symlink libexec.glob("bin/*")
  end

  def caveats
    <<~EOS
      Inline video playback needs ffmpeg:
        brew install ffmpeg
    EOS
  end

  test do
    assert_match "xbmg", shell_output("#{bin}/xbmg --help")
  end
end
