# Enterprise web stack

"MVC it' good for web, but should not do architectural stuff, let's crush monoliths!

## Scope of the project

With this project we want to create a web development architecture ready to scale and easly manteinable.

Usually when a web project becomes big happens that using an unique monolithic MVC framework become hard to mantain for different reasons, but first of all, view models speciation.

Use an all-in-one MVC framework it's a good choice, but the problem starts when for different reasons as "marketing", "economics", "analisys" "seo" "user interfaces" exposed view models starts to differ from the main "domanin objects".

What happen usually it's that domain objects become heavy and rich in additional properties or worst become humus for extreme data denormalization.

Domain objects should instead stay small and well organized in order to have an healthy project growth and for easiness of maintenance.

### Part 1 - DOMAIN LOGIC APIs

As said a modern MVC framework should be enough to produce domain logic.
First step should be to create a relational mapping for domain objects and then expose simple C.R.U.D. operations via rest APIs.

This means that complex aggregation queries used for search, should be kept off this set of apis, that should only allow their user to create, read, update and delete domain objects.

Listing or search this object should not be allowed, as well as aggregate informations about them.
The only listing operation admited should be list with pagination or retriver one entry by id.

This set of api should be also sufficient to create a basic and automatable GUI backend without complex search feature, that is out of scope for this  part.

### Part 2 - SEARCH AND COMPLEX MODELING APIs

A service (elastic search is a reasonable option) that is more reliable for search and aggregations should be used to search among domain objects and derived complex views.

This searvice should contain a representation of the data ready to be searched and aggregated facilitating business needings without polluting the main domain realized in part 1.

A separated proxy written in an high capability language (go is a reasonable option), should be the frontend API for this search service.

This search service shold be transparently synchronized with the relational database behind domain object storage in part 1.

But also it can collect informatios for other infrastructural services as proxies (nginx logs) to create even more complete view models, without polluting main database.

## Instructions

### First config

Make all the bash files executable

```
sudo chmod +x ./bin/*.sh
sudo chmod +x ./entrypoint/*.sh
```

Launch in order to synchronize nginx hosts to your local machine:

```
./bin/configure_local_hosts_file.sh
```

### Test postgres container

Access the contianer:

```
docker exec -it bash
```

Once into the container:

```
psql -U dbuser -h postgres dbproject
```
### Test nginx container

point your browser to www.project.dev and check for the welcome page
