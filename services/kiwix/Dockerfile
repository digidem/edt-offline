FROM kiwix/kiwix-serve:latest
COPY start.sh /opt/start.sh
RUN (crontab -u $(whoami) -l; echo "*/2 * * * * /usr/local/bin/kiwix-manage /data/library.xml add /data/zims/*.zim" ) | crontab -u $(whoami) -
ENTRYPOINT ["sh", "/opt/start.sh"]
