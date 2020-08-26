module Types
  class MutationType < Types::BaseObject
    field :create_review, mutation: Mutations::ReviewMutations::CreateReview
    
    field :create_airline, mutation: Mutations::AirlineMutations::CreateAirline
  end
end
