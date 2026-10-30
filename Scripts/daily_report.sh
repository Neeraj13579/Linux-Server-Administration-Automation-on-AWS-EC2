#!/bin/bash
# Daily System Report - collects key system health info into a dated log file.
# Install: sudo cp daily_report.sh /usr/local/bin/ && sudo chmod +x /usr/local/bin/daily_report.sh
# Schedule (6 AM daily): 0 6 * * * /usr/local/bin/daily_report.sh

REPORT_FILE="/var/log/daily_report_$(date +%Y%m%d).txt"

{
  echo "====================================="
  echo "Daily System Report - $(date)"
  echo "====================================="
  echo ""

  echo "--- System Info ---"
  hostname
  uptime
  echo ""

  echo "--- Disk Usage ---"
  df -h
  echo ""

  echo "--- Memory Usage ---"
  free -h
  echo ""

  echo "--- Top 5 CPU Processes ---"
  ps aux --sort=-%cpu | head -6
  echo ""

  echo "--- Logged In Users ---"
  who
  echo ""

  echo "--- Recent Error Logs ---"
  # Amazon Linux/RHEL use /var/log/messages; Ubuntu/Debian use /var/log/syslog
  if [ -f /var/log/messages ]; then
    tail -20 /var/log/messages
  elif [ -f /var/log/syslog ]; then
    tail -20 /var/log/syslog
  else
    journalctl -p err -n 20 --no-pager 2>/dev/null
  fi
} > "$REPORT_FILE"

echo "Report saved to: $REPORT_FILE"
