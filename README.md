# bn2pvp
minecraft pvp server

```
docker build -t 1.18.2-mcpvp .
docker run -itd --privileged -p 25565:25565 -p 8000:8000 --name bn2pvp --hostname minecraft 1.18.2-mcpvp
```