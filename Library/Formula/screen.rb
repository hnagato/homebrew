require 'formula'

class Screen <Formula
  head 'git://git.savannah.gnu.org/screen.git', :using => :git
  homepage 'http://www.gnu.org/software/screen/'

  def install
    cd 'src' do
      system "/bin/sh autogen.sh"
      system "./configure", "--enable-colors256", "--enable-locale",
                            "--enable-pam", "--enable-telnet",
                            "--with-sys-screenrc=/etc/screenrc",
                            "--disable-debug", "--disable-dependency-tracking",
                            "--prefix=#{prefix}"
      system "make"
      system "make install"
    end
  end
end