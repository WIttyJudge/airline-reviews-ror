module Mutations 
  module ReviewMutations
  
    class CreateReview < BaseMutation
      # arguments passed to the resolve method
      argument :title, String, required: true
      argument :description, String, required: true
      argument :score, Integer, required: true
      argument :airline_id, Integer, required: true

      field :review, Types::ReviewType, null: true
      field :errors, [String], null: false

      # return type from the mutation
      # type Types::AirlineType

      def resolve(title:, description:, score:, airline_id: )
        review = Review.create(
          :title => title,
          :description => description,
          :score => score,
          :airline_id => airline_id
        )

        if review.save
          {
            review: review,
            errors: []
          }
        else
          {
            review: nil,
            errors: review.errors.full_messages
          }
        end

      end
    end

  end
end