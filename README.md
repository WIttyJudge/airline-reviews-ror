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

**Error with graphiql-rails**

1.  Add inside development
    ```
    gem "graphiql-rails"
    ```
2.  Create app/assets/config/manifest.js and add:
    ```
    //= link graphiql/rails/application.css
    //= link graphiql/rails/application.js
    ```
3.  mkdir -p app/assets/config && touch app/assets/config/manifest.js
4.  And create a _config/initializers/assets.rb_ with:

    ```
    # config/initializers/assets.rb
    if Rails.env.development?
      Rails.application.config.assets.precompile += %w[graphiql/rails/application.js graphiql/rails/application.css]
    end
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

````

```

```
````
