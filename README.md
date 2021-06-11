# README

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

## Config subdomain
Add to `/etc/hosts`
```
127.0.0.1 philips.ea.dave fonel.ea.dave
```

`philips` and `fonel` is subdomain for companies

Add to `config/development.rb`

```
config.hosts << 'philips.ea.dave'
config.hosts << 'fonel.ea.dave'
```

## Api document
```
http://philips.ea.dave:3000/swagger
```
