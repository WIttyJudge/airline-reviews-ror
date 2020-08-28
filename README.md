# Airline Reviews

Ruby on Rails api for airline reviews project.

## System Dependencies

### Main
- rack-cors
- graphql

### Testing
- rspec-rails
- factory_bot_rails

### Development
- annotate
- graphiql-rails

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
