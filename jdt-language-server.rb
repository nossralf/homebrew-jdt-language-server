class JdtLanguageServer < Formula
  desc "A Java language specific implementation of the Language Server Protocol"
  homepage "https://github.com/eclipse/eclipse.jdt.ls"

  url "http://download.eclipse.org/jdtls/snapshots/jdt-language-server-0.4.0-201709151731.tar.gz"
  sha256 "342d679d7a263eb97738f99db035369767b87efb4ce924b87f5f15894b303a55"
  version "0.4.0-201709151731"

  bottle :unneeded

  depends_on :java

  def install
    rm_rf "config_linux"
    rm_rf "config_win"
    libexec.install ["config_mac", "features", "plugins"]
  end
end
