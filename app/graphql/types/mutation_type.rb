module Types
  class MutationType < Types::BaseObject
    field :create_review, mutation: Mutations::Review::CreateReview
    # field :delete_review, mutation: Mutations::Review::DeleteReview
    
    field :create_airline, mutation: Mutations::Airline::CreateAirline
  end
end
