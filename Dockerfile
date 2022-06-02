FROM steamcmd/steamcmd:ubuntu-20

# Install .NET: https://docs.microsoft.com/en-us/dotnet/core/install/linux-ubuntu
RUN apt-get update && apt-get install -y wget
RUN wget \
    https://packages.microsoft.com/config/ubuntu/20.04/packages-microsoft-prod.deb \
    -O packages-microsoft-prod.deb && \
    dpkg -i packages-microsoft-prod.deb
RUN rm packages-microsoft-prod.deb

RUN apt-get update && \
    apt-get install -y \
        dotnet-runtime-6.0 \
        libgdiplus

COPY docker-entrypoint ./
RUN chmod +x docker-entrypoint

ENV ECO_SERVER_PATH /eco
ENV STEAMCMD_USER anonymous
ENV STEAMCMD_PASS ${1:+1}
ENV STEAMCMD_ID 739590

EXPOSE 3000 3001

ENTRYPOINT [ "./docker-entrypoint" ]
