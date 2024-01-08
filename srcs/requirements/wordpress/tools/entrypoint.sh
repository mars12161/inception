#!/bin/bash

echo "Running entrypoint.sh"
./config.sh

echo "Starting PHP-FPM"
/usr/sbin/php-fpm7.3 -F
