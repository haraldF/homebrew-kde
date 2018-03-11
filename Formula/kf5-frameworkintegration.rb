class Kf5Frameworkintegration < Formula
  desc "Framework providing components to allow applications to integrate with a KDE Workspace"
  homepage "https://www.kde.org"
  url "https://download.kde.org/stable/frameworks/5.44/frameworkintegration-5.44.0.tar.xz"
  sha256 "9a3b9ac280f4fa6e1ba49e0facfd635efcb36c3b6391053a2b889c1d980186cd"
  revision 1

  head "git://anongit.kde.org/frameworkintegration.git"

  depends_on "cmake" => :build
  depends_on "KDE-mac/kde/kf5-extra-cmake-modules" => :build

  depends_on "KDE-mac/kde/kf5-knewstuff"
  depends_on "KDE-mac/kde/kf5-kpackage"

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
      ln -sf "$(brew --prefix)/share/kf5" "$HOME/Library/Application Support"
      ln -sf "$(brew --prefix)/share/knotifycations5" "$HOME/Library/Application Support"
    EOS
  end
end
