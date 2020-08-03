# README

1. Add rspec-rails to both the :development and :test groups of your app’s Gemfile.
2. rails generate rspec:install
3. gem 'rack-cors'

```
$ bundle install
```

Create database before db:migrate

```
psql postgres://username:password@localhost:5432

create database airline_dev;
create database airline_test;
```

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

- Ruby version

- System dependencies

- Configuration

- Database creation

- Database initialization

- How to run the test suite

- Services (job queues, cache servers, search engines, etc.)

- Deployment instructions

- ...
