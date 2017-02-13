default['bonusbits_mediawik_nginx']['packages'] = %w(
  apr
  apr-util
  enchant
  git
  ImageMagick
  json-c
  mysql56
  nfs-utils
  nginx
  openssl
  openssl-devel
  pcre
  perl-core perl-CPAN
  perl-Crypt-SSLeay
  perl-DateTime
  perl-libwww-perl
  perl-Sys-Syslog
  php70-cli
  php70-common
  php70-enchant
  php70-fpm
  php70-intl
  php70-mbstring
  php70-mcrypt
  php70-mysqlnd
  php70-pdo
  php70-pecl-apcu
  php70-pecl-imagick
  php70-process
  php70-xml
  texlive
)

# php70-jsonc
# php70-pecl-http
# php70-pecl-raphf

default['bonusbits_mediawik_nginx']['optional_packages'] = %w(
  htop
  mlocate
  vim
)