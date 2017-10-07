class JdtLanguageServer < Formula
  desc "A Java language specific implementation of the Language Server Protocol"
  homepage "https://github.com/eclipse/eclipse.jdt.ls"

  url "http://download.eclipse.org/jdtls/snapshots/jdt-language-server-0.6.0-201710070307.tar.gz"
  sha256 "42b85eaf21f53453a7784aaba54aedb80493b2a087403c16b8cb239e7d60145e"
  version "0.6.0-201710070307"

  bottle :unneeded

  depends_on :java => "1.8+"

  def install
    rm_rf "config_linux"
    rm_rf "config_win"
    libexec.install ["config_mac", "features", "plugins"]
  end
end

