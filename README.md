# postgresELKDockerStack
Postgres - Elasticsearch - Logstash - Kibana all in one docker stack

## Test postgres container
Access the contianer:
```
docker exec -it bash
```
Once into the container:
```
psql -U dbuser -h postgres dbproject
```
