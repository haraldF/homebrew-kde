class Kf5Attica < Formula
  desc "Qt5 library that implements the Open Collaboration Services API"
  homepage "https://www.kde.org"
  url "https://download.kde.org/stable/frameworks/5.44/attica-5.44.0.tar.xz"
  sha256 "6fab4079f5fb43e559f6620a2333ca60777f18e6cd45c51eef98ae459344e642"
  revision 1

  head "git://anongit.kde.org/attica.git"

  depends_on "cmake" => :build
  depends_on "doxygen" => :build
  depends_on "graphviz" => :build
  depends_on "KDE-mac/kde/kf5-extra-cmake-modules" => :build

  depends_on "qt"

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
end
