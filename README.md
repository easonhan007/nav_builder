# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...


### Build Image

```shell
docker build . -t nav_builder
```

### Run Container

```shell
docker stop nav_builder
docker run -d --rm -p 12306:3000 -v ./storage:/rails/storage --name nav_builder nav_builder:latest
```

### TODO

- A mobile friendly top nav
- Fix section destroy issue
- Custom js code per page
- Dark mode
- Better navigation after creating sections and items 