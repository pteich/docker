Nginx stable with optimized default settings. You can load your own config for nginx settings and vhosts. 

This container expects two mounted volumes: `/config` for additional nginx config files (*.conf) and `/data`. If not found this container will create two other folders in `/data` - `logs` for log files and `http` for you web host files.

To run this container:

```sh

docker run -d --name=nginx -p 80:80 -v <data-dir>:/data:rw -v <config-dir>:/config:ro pteich/nginx
```

**Auto restart**  
This container automatically restarts nginx if it detects changed files in /config (your mounted config folder). So you can change any virtual hosts configs without restarting your container.