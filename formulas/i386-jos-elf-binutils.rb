class I386JosElfBinutils < Formula
  homepage "https://www.gnu.org/software/binutils/binutils.html"
  url "https://ftp.gnu.org/gnu/binutils/binutils-2.27.tar.gz"
  sha256 "26253bf0f360ceeba1d9ab6965c57c6a48a01a8343382130d1ed47c468a3094f"

  def install
    system "./configure", "--disable-nls",
                          "--disable-werror",
                          "--enable-gold=yes",
                          "--prefix=#{prefix}",
                          "--target=i386-jos-elf"
    system "make"
    system "make", "install"
  end
end
