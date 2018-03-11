class QtWebkit < Formula
  desc "Classes for a WebKit2 based implementation and a new QML API"
  homepage "https://www1.qt.io/developers/"
  url "https://github.com/annulen/webkit/releases/download/qtwebkit-5.212.0-alpha2/qtwebkit-5.212.0-alpha2.tar.xz"
  sha256 "f8f901de567e11fc5659402b6b827eac75505ff9c5072d8e919aa306003f8f8a"

  head "https://github.com/annulen/webkit.git"

  patch do
    # Fix null point dereference (Fedora) https://github.com/annulen/webkit/issues/573
    url "https://git.archlinux.org/svntogit/packages.git/plain/trunk/qt5-webkit-null-pointer-dereference.patch?h=packages/qt5-webkit"
    sha256 "510e1f78c2bcd76909703a097dbc1d5c9c6ce4cd94883c26138f09cc10121f43"
  end
  patch do
    # Fix build with cmake 3.10
    url "https://github.com/annulen/webkit/commit/f51554bf104ab0491370f66631fe46143a23d5c2.diff?full_index=1"
    sha256 "874b56c30cdc43627f94d999083f0617c4bfbcae4594fe1a6fc302bf39ad6c30"
  end

  depends_on "cmake" => :build
  depends_on "gperf" => :build
  depends_on "fontconfig" => :build
  depends_on "freetype" => :build
  depends_on "sqlite" => :build

  depends_on "qt"
  depends_on "zlib"
  depends_on "webp"
  depends_on "libxslt"
  # depends_on "hyphen"

  def cmake_args
    args = %W[
      -DCMAKE_INSTALL_PREFIX=#{prefix}
      -DCMAKE_BUILD_TYPE=Release
      -DCMAKE_FIND_FRAMEWORK=LAST
      -DCMAKE_VERBOSE_MAKEFILE=ON
      -Wno-dev
    ]
    args
  end

  def install
    args = cmake_args
    args << "-DPORT=Qt"
    args << "-DENABLE_TOOLS=OFF"
    args << "-DCMAKE_MACOSX_RPATH=OFF"
    args << "-DEGPF_SET_RPATH=OFF"
    args << "-DCMAKE_SKIP_RPATH=ON"
    args << "-DCMAKE_SKIP_INSTALL_RPATH=ON"

    # Fuck up rpath
    inreplace "Source/cmake/OptionsQt.cmake", "RPATH\ ON", "RPATH\ OFF"
    mkdir "build" do
      system "cmake", "..", *args
      system "make", "install"
      prefix.install "install_manifest.txt"
    end
  end
end
