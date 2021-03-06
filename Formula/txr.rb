class Txr < Formula
  desc "Original, new programming language for convenient data munging"
  homepage "https://www.nongnu.org/txr/"
  url "http://www.kylheku.com/cgit/txr/snapshot/txr-194.tar.bz2"
  sha256 "56b2595db8e739a92fdfe73f80b5f8d2ae186fb5326986a9d5e940841ed38198"
  head "http://www.kylheku.com/git/txr", :using => :git

  bottle do
    cellar :any_skip_relocation
    sha256 "ea330f3004ae9e85181aafe8b3c9a89ac46807d71adc579b94f30b511271bf06" => :high_sierra
    sha256 "12b1b4860ecca53d7d259ccfa598981a277f247e0bb3703ac444ddc02f071dbe" => :sierra
    sha256 "6ae4770e2a550b6dba868ab1e9f643adb9bdf7446cf41b62c316dc35b1f4587a" => :el_capitan
  end

  def install
    ENV.deparallelize
    system "./configure", "--prefix=#{prefix}"
    system "make"
    system "make", "install"
  end

  test do
    assert_equal "3", shell_output(bin/"txr -p '(+ 1 2)'").chomp
  end
end
