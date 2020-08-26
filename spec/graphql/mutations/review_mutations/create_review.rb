require 'rails_helper'

module Mutations
  module ReviewMutations

    RSpec.describe CreateReview, :type => :request do
      describe ".resolve" do
        let(:review) { create(:review) }
        
        it "valid" do
          expect do
            post '/api/v2/graphql', params: { graphql: query(title: review.title, description: review.description, score: review.score, airline_id: review.airline_id ) }
          end.to change { Airline.count }.by(1)
        end
      end

      def query(title:, description:, score:, airline_id:)
        <<~GQL
          mutation {
            createReview (
              input: {
                title: #{title},
                description: #{description},
                score: #{score},
                airlineId: #{airline_id}
            }) {
              review {
                id
              }
              errors
            }
          }
        GQL
      end
    end

  end
end