FROM steamcmd/steamcmd:ubuntu-20
COPY docker-entrypoint ./
RUN chmod +x docker-entrypoint

ENV ECO_SERVER_PATH /eco
ENV STEAMCMD_USER anonymous
ENV STEAMCMD_PASS ${1:+1}
ENV STEAMCMD_ID 739590

EXPOSE 3000 3001

ENTRYPOINT [ "./docker-entrypoint" ]
