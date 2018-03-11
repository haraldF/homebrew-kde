class Kf5Kcmutils < Formula
  desc "Utilities for interacting with KCModules"
  homepage "https://www.kde.org"
  url "https://download.kde.org/stable/frameworks/5.44/kcmutils-5.44.0.tar.xz"
  sha256 "eeda78f024b5f03c67815865abdb7b1a47966a7aa9b8d6a55f40596a1905b5a9"
  revision 1

  head "git://anongit.kde.org/kcmutils.git"

  depends_on "cmake" => :build
  depends_on "doxygen" => :build
  depends_on "graphviz" => :build
  depends_on "KDE-mac/kde/kf5-extra-cmake-modules" => :build

  depends_on "KDE-mac/kde/kf5-kdeclarative"

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

  def caveats; <<~EOS
    You need to take some manual steps in order to make this formula work:
      ln -sf "$(brew --prefix)/share/kservicetypes5" "$HOME/Library/Application Support"
    EOS
  end
end
