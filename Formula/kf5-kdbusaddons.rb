class Kf5Kdbusaddons < Formula
  desc "Addons to QtDBus"
  homepage "https://www.kde.org"
  url "https://download.kde.org/stable/frameworks/5.44/kdbusaddons-5.44.0.tar.xz"
  sha256 "a498cac1e34fc9fa2c584e0f77122fce4edb4e81baf31e5dacbdf03b052bab99"
  revision 1

  head "git://anongit.kde.org/kdbusaddons.git"

  depends_on "cmake" => :build
  depends_on "doxygen" => :build
  depends_on "graphviz" => :build
  depends_on "shared-mime-info" => :build
  depends_on "KDE-mac/kde/kf5-extra-cmake-modules" => :build

  depends_on "qt"
  depends_on "dbus"

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
