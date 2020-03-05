class JdtLanguageServer < Formula
  desc "A Java language specific implementation of the Language Server Protocol"
  homepage "https://github.com/eclipse/eclipse.jdt.ls"

  url "http://download.eclipse.org/jdtls/snapshots/jdt-language-server-0.52.0-202003042214.tar.gz"
  sha256 "8ce11802c4524a1813f112d7a5d8d9544f00b1c3b5ee67c8d276b16c4decc995"
  version "0.52.0-202003042214"

  bottle :unneeded

  depends_on :java => "1.8+"

  def install
    rm_rf "config_linux"
    rm_rf "config_win"
    libexec.install ["config_mac", "features", "plugins"]

    (bin/"jdt-ls").write <<~EOS
      #!/bin/bash
      JDT_LS_HOME="#{libexec}"
      JDT_LS_LAUNCHER=$(find $JDT_LS_HOME -name "org.eclipse.equinox.launcher_*.jar")

      JDT_LS_HEAP_SIZE=${JDT_LS_HEAP_SIZE:=-Xmx1G}

      java -agentlib:jdwp=transport=dt_socket,server=y,suspend=n,address=1044 -Declipse.application=org.eclipse.jdt.ls.core.id1 -Dosgi.bundles.defaultStartLevel=4 -Declipse.product=org.eclipse.jdt.ls.core.product -Dlog.protocol=true -Dlog.level=ALL -noverify $JDT_LS_HEAP_SIZE -jar "$JDT_LS_LAUNCHER" -configuration "$JDT_LS_HOME/config_mac" --add-modules=ALL-SYSTEM --add-opens java.base/java.util=ALL-UNNAMED --add-opens java.base/java.lang=ALL-UNNAMED -data "$1"
    EOS
  end
end
