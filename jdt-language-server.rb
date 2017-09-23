class JdtLanguageServer < Formula
  desc "A Java language specific implementation of the Language Server Protocol"
  homepage "https://github.com/eclipse/eclipse.jdt.ls"

  url "http://download.eclipse.org/jdtls/snapshots/jdt-language-server-0.5.0-201709221433.tar.gz"
  sha256 "6111b34be841ee8fafde4a11628c6a7761a56f06fbc5a9df57b23a3e97693cc7"
  version "0.5.0-201709221433"

  bottle :unneeded

  depends_on :java => "1.8+"

  def install
    rm_rf "config_linux"
    rm_rf "config_win"
    libexec.install ["config_mac", "features", "plugins"]
  end
end
