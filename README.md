# README

1. Add rspec-rails to both the :development and :test groups of your app’s Gemfile.
2. rails generate rspec:install
3. gem 'rack-cors'

```
$ bundle install
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

3.  And create a _config/initializers/assets.rb_ with:

    ```
    # config/initializers/assets.rb
    if Rails.env.development?
      Rails.application.config.assets.precompile += %w[graphiql/rails/application.js graphiql/rails/application.css]
    end
    ```

## System Dependencies

## Database initialization

```
rake db:{create,migrate,seed}
```

Database name:
- airline_dev
- airline_test

## GraphQL

### Queries

Get all airlines: 

```
query {
  airlines {
    id
    name
    imageUrl
    slug
    averageScore
    createdAt
    updatedAt
    reviews {
      id
      title
      description
    }
  }
}
```

Get one airline by slug:

```
query {
  airline(slug: "airline-slug") {
    id
    name
    imageUrl
    slug
    averageScore
    createdAt
    updatedAt
    reviews {
      id
      title
      description
    }
  }
}
```

### Mutations

Create review: 

```
mutation {
  createReview(input: {
    title: "test"
    description: "test"
    score: 5
    airlineId: 3
  }){
    review {
      id
    }
    errors
  }
}
```


## How to run test suite

```
bundle exec rspec spec/
```


Things you may want to cover:

- Ruby version


- Configuration
