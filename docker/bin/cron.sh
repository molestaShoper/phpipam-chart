#!/bin/ash
# shellcheck shell=dash
# shellcheck disable=SC2317

# Pull in custom CAs from /usr/local/share/ca-certificates/
update-ca-certificates

# Verify timezone is valid
if [ -z "$TZ" ]; then
  echo "Info: Please configure timezone (env TZ), defaulting to UTC"
  echo "Info: See supported environment variables https://hub.docker.com/r/phpipam/phpipam-www"
  export TZ="UTC"
fi

if [ -f /usr/share/zoneinfo/"$TZ" ]; then
  ln -sf /usr/share/zoneinfo/"$TZ" /etc/localtime
else
  echo "Error: Invalid timezone: $TZ"
  exit 1
fi

# Start CRON
case "$SCAN_INTERVAL" in
  5m)  CRON_S="*/5 *"
  ;;
  10m) CRON_S="*/10 *"
  ;;
  15m) CRON_S="*/15 *"
  ;;
  30m) CRON_S="*/30 *"
  ;;
  1h)  CRON_S="0 *"
  ;;
  2h)  CRON_S="0 */2"
  ;;
  4h)  CRON_S="0 */4"
  ;;
  6h)  CRON_S="0 */6"
  ;;
  12h) CRON_S="0 */12"
  ;;
  *)   CRON_S="0 *"
  ;;
esac

{
  echo "$CRON_S *  *  * /usr/bin/php /phpipam/functions/scripts/discoveryCheck.php"
  echo "$CRON_S *  *  * /usr/bin/php /phpipam/functions/scripts/pingCheck.php"
  echo "$CRON_S *  *  * /usr/bin/php /phpipam/functions/scripts/resolveIPaddresses.php"
} >/etc/crontabs/apache

/usr/sbin/crond -f -l 8 -L /dev/stdout
