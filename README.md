# steamcmd-eco

Eco server on ubuntu-20. Installs and updates server on container start. Run with docker command or compose file. Mount a volume at `/eco` for persistence. If first start, should stop the server and edit [server configurations](https://wiki.play.eco/en/Server_Configuration) to your preference. 

Running with docker:
``` 
docker run \
    --restart=always \
    --name=steamcmd-eco \
    -v ~/localserverpath:/eco \
    -p 3000:3000 \
    -p 3001:3001 \
    emackie/steamcmd-eco
```

If running server long term, schedule periodic restarts to update the server through cron or your preferred scheduler. Example cron job:
``` 
# Restart steamcmd-eco at 4:30am system time, Monday through Fridays
 4 30 * * 1-5 docker restart steamcmd-eco
# An empty line is required at the end of this file for a valid cron file.

```

Dockerfile will expose the following ports:
- `3000/tcp EcoServer`
- `3001/tcp EcoWebServer`

Alternatively, can run docker compose from the source code: `docker compose up -d --build`
