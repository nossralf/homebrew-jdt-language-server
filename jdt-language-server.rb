class JdtLanguageServer < Formula
  desc "A Java language specific implementation of the Language Server Protocol"
  homepage "https://github.com/eclipse/eclipse.jdt.ls"

  url "http://download.eclipse.org/jdtls/snapshots/jdt-language-server-0.6.0-201710030118.tar.gz"
  sha256 "f8e0070c0fceb0ec0e2e8bcc95cbbf777f3f9aa945a73a95ff5710730874aa53"
  version "0.6.0-201710030118"

  bottle :unneeded

  depends_on :java => "1.8+"

  def install
    rm_rf "config_linux"
    rm_rf "config_win"
    libexec.install ["config_mac", "features", "plugins"]
  end
end

