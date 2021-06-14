# Local build
```
docker build -t genivi/dlt-daemon .
```

# Run container

```
docker run -it --rm -v /tmp:/tmp -p 3490:3490 genivi/dlt-daemon
# Update permissions
sudo chmod o+rw /tmp/dlt
```
