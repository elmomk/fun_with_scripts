#!/bin/bash -xe
SERVICE=$1
RAM=$2
PATH_TO_JAR=$3
JAR=$4
PROFILES=$5
SYSTEMD_SERVICE="/etc/systemd/system/$SERVICE.service"
set +xe
USAGE="
$0 name_of_service max_ram path_to_jar jar profile
for example
$0 quantum 1024 /opt/z-bin/apps system-server.jar default,dev
"
set -xe
if [ -f "$SYSTEMD_SERVICE" ]; then
    echo "$SYSTEMD_SERVICE already exists"
exit 0
fi
echo "setting up $SYSTEMD_SERVICE"
echo "checking arguments"
if [ $# != 5 ]; then
    echo "$USAGE"
exit 1
fi
echo "arguments: ok, actually starting now"


cat << EOF > $SYSTEMD_SERVICE
[Unit]
Description= $SERVICE.service starts $PATH_TO_JAR with java
After network.target = $SERVICE.service

[Service]
WorkingDirectory=$PATH_TO_JAR
User=root
Group=root
SyslogIdentifier=$SERVICE
ExecStart=/usr/bin/env /bin/java -Xmx${RAM}m -Dspring.profiles.active=$PROFILES -jar $JAR -Djava.util.logging.manager=log4j
Restart=always

[Install]
WantedBy=multi-user.target
EOF

systemctl daemon-reload
systemctl enable $SERVICE
systemctl start $SERVICE
systemctl status $SERVICE
echo "if everything exists your daemon should be up and running now"
