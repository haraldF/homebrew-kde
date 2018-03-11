class Kf5Tier2Frameworks < Formula
  desc "Metapackage for Tier 2 KF5 frameworks"
  homepage "https://api.kde.org/frameworks"
  url "https://raw.githubusercontent.com/KDE-mac/homebrew-kde/master/tools/empty"
  version "0"
  sha256 "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855"

  depends_on "KDE-mac/kde/kf5-kactivities" => :build
  depends_on "KDE-mac/kde/kf5-kauth" => :build
  depends_on "KDE-mac/kde/kf5-kcompletion" => :build
  depends_on "KDE-mac/kde/kf5-kcrash" => :build
  depends_on "KDE-mac/kde/kf5-kdoctools" => :build
  depends_on "KDE-mac/kde/kf5-kfilemetadata" => :build
  depends_on "KDE-mac/kde/kf5-kimageformats" => :build
  depends_on "KDE-mac/kde/kf5-kjobwidgets" => :build
  depends_on "KDE-mac/kde/kf5-knotifications" => :build
  depends_on "KDE-mac/kde/kf5-kpackage" => :build
  depends_on "KDE-mac/kde/kf5-kpty" => :build # the page say is not ready for macos, but build ok (?)
  depends_on "KDE-mac/kde/kf5-kunitconversion" => :build

  def install
    touch "empty"
    prefix.install "empty"
  end
end
