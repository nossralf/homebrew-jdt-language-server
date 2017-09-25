class JdtLanguageServer < Formula
  desc "A Java language specific implementation of the Language Server Protocol"
  homepage "https://github.com/eclipse/eclipse.jdt.ls"

  url "http://download.eclipse.org/jdtls/snapshots/jdt-language-server-0.5.0-201709251422.tar.gz"
  sha256 "d8da7af322696033550ee66dbe497c9186b23c9d04d146d5769c0717cec01a3d"
  version "0.5.0-201709251422"

  bottle :unneeded

  depends_on :java => "1.8+"

  def install
    rm_rf "config_linux"
    rm_rf "config_win"
    libexec.install ["config_mac", "features", "plugins"]
  end
end
