module Types
  class QueryType < Types::BaseObject
    field :airlines, [AirlineType], null: false do
      description "Find all airlines"
    end

    def airlines
      Airline.all
    end

    field :airline, AirlineType, null: false do
      description "Find airline by slug"
      argument :slug, String, required: true
    end

    def airline(slug:)
      Airline.find_by(slug: slug)
    end

    field :reviews, [ReviewType], null: false do
      description "Find all reviews"
    end

    def reviews
      Review.all
    end
  end
end
