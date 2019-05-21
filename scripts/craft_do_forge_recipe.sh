#!/bin/bash

# Craft CMS Server Setup 
#
# Forge Bash Script Recipe for Craft CMS websites
#
# @author    webrgp & engram-design
# @link      https://github.com/webrgp
# @package   craft-forge-recipe
# @since     1.0.0
# @license   MIT

# Exit immediately if a simple command exits with a non-zero status (https://ss64.com/bash/set.html) 
set -e

# Helper functions
error_msg () { echo -e "\e[1;31m*** Error:\e[0m $1"; }
success_msg () { echo -e "\e[32m*** $1\e[0m"; }
info_msg () { echo -e "\e[34m*** $1\e[0m"; }
print_msg () { echo -e ">> $1"; }


# Install jpegoptim & optipng ( https://nystudio107.com/blog/creating-optimized-images-in-craft-cms )
install_image_tools () {
  type jpegoptim >/dev/null 2>&1 || { print_msg "Installing jpegoptim"; apt-get -y install jpegoptim; }
  type optipng >/dev/null 2>&1 || { print_msg "Installing optipng"; apt-get -y install optipng; }
  success_msg "jpegoptim & optipng installed!"
}


# Install the nginx partials from https://github.com/nystudio107/nginx-craft
install_nginx_partials () {

  if [ ! -d "/etc/nginx/nginx-partials" ]; then
    print_msg "Installing nginx-partials"
    git clone https://github.com/nystudio107/nginx-craft.git nginx-craft;
    cp -R nginx-craft/nginx-partials /etc/nginx;
    rm -rf nginx-craft;
  fi

  success_msg "nginx-partials installed!"
}


perform_craftcms_server_setup () {

  # Check if the user is root
  user="$(id -un 2>/dev/null || true)"
  if [ "$user" != 'root' ]; then

    error_msg 'this installer needs the ability to run commands as root.
We are unable to find either "sudo" or "su" available to make this happen.'
    exit 1
  fi

  success_msg "Woot! User is root :-)"

  # Install Steps
  install_image_tools
  install_nginx_partials

  success_msg "Craft CMS setup on Forge completed!"
}

info_msg "Start Craft CMS setup on Forge"

perform_craftcms_server_setup
