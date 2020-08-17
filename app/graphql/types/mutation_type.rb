module Types
  class MutationType < Types::BaseObject
    field :create_review, mutation: Mutations::Review::CreateReview
    
    field :create_airline, mutation: Mutations::Airline::CreateAirline
  end
end
