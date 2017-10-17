# Enterprise web stack
This stack provides out of the box:

* Postgres
* Elastic Search
* nginx

## First config
Make all the bash files executable

```
sudo chmod +x ./bin/*.sh
sudo chmod +x ./entrypoint/*.sh
```

## Test postgres container
Access the contianer:
```
docker exec -it bash
```
Once into the container:
```
psql -U dbuser -h postgres dbproject
```
## Test nginx container
