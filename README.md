# README

# Overview
This project about using Grape API, Docker, Postgresql


## Docker
* Start
```
docker compose up
```

* Create database
```
docker-compose exec app bundle exec rake db:setup db:migrate
```

* Access to console
```
docker-compose exec app bundle exec rails console
```

* Debug
```
docker ps
```
Output

|Container ID|... |NAMES
|---|---|---|
|bfee914e4e8c|...|estate_agent|
___

```
docker attach bfee914e4e8c
```

## Api document
```
http://localhost:3000/swagger
```

## Check coding convention
```
pronto run -c develop
```
