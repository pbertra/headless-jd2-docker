FROM openjdk:8-jre-alpine


# Create directory, downloader JD" and start JD2 for the initial update and creation of config files.
RUN \
	apt update && apt install ffmpeg && \
	mkdir -p /opt/JDownloader/ && \
	wget -O /opt/JDownloader/JDownloader.jar --user-agent="https://hub.docker.com/r/plusminus/jdownloader2-headless/" --progress=bar:force http://installer.jdownloader.org/JDownloader.jar && \
	java -Djava.awt.headless=true -jar /opt/JDownloader/JDownloader.jar


COPY startJD2.sh /opt/JDownloader/
RUN chmod +x /opt/JDownloader/startJD2.sh


# Run this when the container is started
CMD /opt/JDownloader/startJD2.sh
