# Documentation: https://github.com/Homebrew/homebrew/blob/master/share/doc/homebrew/Formula-Cookbook.md
#                http://www.rubydoc.info/github/Homebrew/homebrew/master/Formula
# PLEASE REMOVE ALL GENERATED COMMENTS BEFORE SUBMITTING YOUR PULL REQUEST!

class Sbrlmod < Formula
  desc "Scalable Bayesian Rule Lists. C-library to build a scalable rule list from input data and labels."
  homepage "https://github.com/margoseltzer/sbrlmod-brew/wiki"
  url "https://github.com/margoseltzer/sbrlmod-brew"
  version "1.0"
  sha256 "23998f40fb51d1790dfc128c4e511646b86554b025142e1bbd4594f4729b0262"
  # depends_on "cmake" => :build
  depends_on "gsl"
  depends_on "gmp"

  def install
    system "./configure", "--disable-debug",
                          "--disable-dependency-tracking",
                          "--disable-silent-rules",
                          "--prefix=#{prefix}"
    system "make", "install"
  end

  test do
    system "#{bin}/testprog", "-t3", "#{share}/sbrlmod/ttt_train.out", "#{share}/sbrlmod/ttt_train.label", "#{share}/sbrlmod/ttt_test.out", "#{share}/sbrlmod/ttt_test.label"
  end
end
