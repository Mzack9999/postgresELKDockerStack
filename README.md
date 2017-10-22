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

Add  hosts to your local host file (only for dev environent in local)

```
./bin/configure_local_hosts_file.sh
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
