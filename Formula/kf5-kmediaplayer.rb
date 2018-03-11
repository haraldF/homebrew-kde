class Kf5Kmediaplayer < Formula
  desc "Plugin interface for media player features"
  homepage "https://www.kde.org"
  url "https://download.kde.org/stable/frameworks/5.44/portingAids/kmediaplayer-5.44.0.tar.xz"
  sha256 "1be55ed6a74e0ef2d07c41ee0436a5184fc968f7379db961f26a97c8ce5cd2fe"
  revision 1

  head "git://anongit.kde.org/kmediaplayer.git"

  depends_on "cmake" => :build
  depends_on "KDE-mac/kde/kf5-extra-cmake-modules" => :build

  depends_on "KDE-mac/kde/kf5-kparts"

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
