class Kf5Kpeople < Formula
  desc "Library that provides access to all contacts and the people who hold them"
  homepage "https://www.kde.org"
  url "https://download.kde.org/stable/frameworks/5.42/kpeople-5.42.0.tar.xz"
  sha256 "15063e78d7b60996086a3ca39a8ae21e0ad6a92151073244670a957ef3a81314"
  revision 1

  head "git://anongit.kde.org/kpeople.git"

  depends_on "cmake" => :build
  depends_on "gettext" => :build
  depends_on "doxygen" => :build
  depends_on "graphviz" => :build
  depends_on "KDE-mac/kde/kf5-extra-cmake-modules" => :build

  depends_on "KDE-mac/kde/kf5-kitemviews"
  depends_on "KDE-mac/kde/kf5-kservice"
  depends_on "KDE-mac/kde/kf5-kwidgetsaddons"

  def install
    args = std_cmake_args
    args << "-DBUILD_TESTING=OFF"
    args << "-DBUILD_QCH=ON"
    args << "-DKDE_INSTALL_QMLDIR=lib/qt5/qml"
    args << "-DKDE_INSTALL_PLUGINDIR=lib/qt5/plugins"

    mkdir "build" do
      system "cmake", "..", *args
      system "make", "install"
      prefix.install "install_manifest.txt"
    end
  end

  def caveats; <<-EOS.undent
    You need to take some manual steps in order to make this formula work:
      ln -sf "$(brew --prefix)/share/kf5" "$HOME/Library/Application Support"
      ln -sf "$(brew --prefix)/share/kservicetypes5" "$HOME/Library/Application Support"
    EOS
  end
end
