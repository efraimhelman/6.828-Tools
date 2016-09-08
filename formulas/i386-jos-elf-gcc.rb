class I386JosElfGcc < Formula
  homepage "https://gcc.gnu.org"
  url "https://ftpmirror.gnu.org/gcc/gcc-6.2.0/gcc-6.2.0.tar.bz2"
  mirror "https://ftp.gnu.org/gnu/gcc/gcc-6.2.0/gcc-6.2.0.tar.bz2"
  sha256 "9944589fc722d3e66308c0ce5257788ebd7872982a718aa2516123940671b7c5"

  depends_on "gmp"
  depends_on "libmpc"
  depends_on "mpfr"
  depends_on "i386-jos-elf-binutils"
  
  def install
    mkdir "build" do
      binutils = Formulary.factory "i386-jos-elf-binutils"
      ENV["PATH"] += ":#{binutils.prefix/"bin"}"
      
      # GCC will suffer build errors if forced to use a particular linker.
      ENV.delete "LD"

      system "../configure", "--disable-nls",
                             "--disable-libmudflap",
                             "--disable-libssp",
                             "--disable-werror",
                             "--enable-languages=c",
                             "--prefix=#{prefix}",
                             "--target=i386-jos-elf",
                             "--with-newlib",
                             "--without-headers"
      system "make", "all-gcc"
      system "make", "install-gcc"
      system "make", "all-target-libgcc"
      system "make", "install-target-libgcc"
    end
  end
end
