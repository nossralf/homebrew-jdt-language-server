class JdtLanguageServer < Formula
  desc "A Java language specific implementation of the Language Server Protocol"
  homepage "https://github.com/eclipse/eclipse.jdt.ls"

  url "http://download.eclipse.org/jdtls/snapshots/jdt-language-server-0.5.0-201709261535.tar.gz"
  sha256 "d98fa8522d9db16c585a772c722f418b0a1420140ca930d391f2a7721e296dc7"
  version "0.5.0-201709261535"

  bottle :unneeded

  depends_on :java => "1.8+"

  def install
    rm_rf "config_linux"
    rm_rf "config_win"
    libexec.install ["config_mac", "features", "plugins"]
  end
end
