#!/bin/bash

echo "#!/bin/bash" > /app/cron_test.sh
echo "python3 /app/main.py" >> /app/cron_test.sh
chmod +x /app/cron_test.sh


touch /var/log/cron.log
echo "*/${CRON_INTERVAL_MINUTES} * * * * /app/cron_test.sh >> /var/log/cron.log 2>&1" >> /etc/cron.d/app-cron
chmod 0644 /etc/cron.d/app-cron

crontab /etc/cron.d/app-cron

crontab -l

cron && tail -f /var/log/cron.log
