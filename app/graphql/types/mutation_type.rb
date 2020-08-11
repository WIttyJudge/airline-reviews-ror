module Types
  class MutationType < Types::BaseObject
    field :create_review, mutation: Mutations::CreateReview

    field :create_airline, mutation: Mutations::CreateAirline
  end
end
