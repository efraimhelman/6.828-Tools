class Mit6828Qemu < Formula
  homepage "http://wiki.qemu.org"
  url "http://web.mit.edu/ccutler/www/qemu.git", :using => :git, :tag => "6.828-2.3.0"
  
  #specific requirments for its use in 6.828
  depends_on "i386-jos-elf-binutils"
  depends_on "i386-jos-elf-gcc"
  depends_on "i386-jos-elf-gdb"
  #general requirements of qemu
  depends_on "pkg-config" => :build
  depends_on "libtool" => :build
  depends_on "jpeg"
  depends_on "libpng" => :recommended
  depends_on "gnutls"
  depends_on "glib"
  depends_on "pixman"
  depends_on "vde" => :optional
  depends_on "sdl" => :optional
  depends_on "gtk+" => :optional
  depends_on "libssh2" => :optional
  
  fails_with :gcc_4_0 do
    cause "qemu requires a compiler with support for the __thread specifier"
  end

  fails_with :gcc do
    cause "qemu requires a compiler with support for the __thread specifier"
  end

  def install
    ENV["LIBTOOL"] = "glibtool"

    system "./configure", "--disable-kvm",
                          "--disable-sdl",
                          "--prefix=#{prefix}"
    system "make"
    system "make", "install"
  end
end
