class I386JosElfGdb < Formula
  homepage "https://www.gnu.org/software/gdb/"
  url "https://ftpmirror.gnu.org/gdb/gdb-7.11.1.tar.xz"
  mirror "https://ftp.gnu.org/gnu/gdb/gdb-7.11.1.tar.xz"
  sha256 "e9216da4e3755e9f414c1aa0026b626251dfc57ffe572a266e98da4f6988fc70"

  depends_on "i386-jos-elf-binutils"
  depends_on "i386-jos-elf-gcc"

  def install
    system "./configure", "--disable-werror",
                          "--prefix=#{prefix}",
                          "--program-prefix=i386-jos-elf-",
                          "--target=i386-jos-elf",
                          "--with-gdb-datadir=#{pkgshare}"
    system "make"
    system "make", "install"
  end
end
