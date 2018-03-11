class CyrusSasl < Formula
  desc "Cyrus saslauthd SASL authentication daemon"
  homepage "https://www.cyrusimap.org"
  url "ftp://ftp.cyrusimap.org/cyrus-sasl/cyrus-sasl-2.1.26.tar.gz"
  sha256 "8fbc5136512b59bb793657f36fadda6359cae3b08f01fd16b3d406f1345b7bc3"
  revision 1

  keg_only :provided_by_macos

  depends_on "krb5" => :build
  depends_on "openldap" => :build
  depends_on "openssl" => :build
  depends_on "postgresql" => :build

  def install
    system "./configure",
           "CFLAGS=-I#{Formula["openssl"].opt_include}",
           "LDFLAGS=-L#{Formula["openssl"].opt_lib}",
           "--disable-macos-framework",
           "--prefix=#{prefix}"
    system "make"
    system "make", "install"
  end
end
