require 'formula'

class SalvoCli < Formula
  homepage 'https://github.com/maxaf/salvo'
  url 'http://deb.bumnetworks.com.s3.amazonaws.com/pool/main/s/salvo-cli/salvo-cli_0.2.2_all.deb', :using => :nounzip
  version '0.2.2'
  sha1 'fdc1dfc98034ecc149f823dbd6b3c7963bd96211'

  depends_on 'pbzip2'

  def install
    system 'ar -x salvo-cli_0.2.2_all.deb'
    system 'tar zxf data.tar.gz'
    inreplace 'usr/bin/salvo', /^SALVO_JAR_DIR=.+/, "SALVO_JAR_DIR=#{share}"
    bin.install 'usr/bin/salvo' => 'salvo'
    share.install "usr/share/salvo/salvo-cli-#{version}.jar" => "salvo-cli-#{version}.jar"
  end
end
