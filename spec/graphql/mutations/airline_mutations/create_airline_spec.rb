require 'rails_helper'

module Mutations
  module AirlineMutations

    RSpec.describe CreateAirline, :type => :request do
      describe ".resolve" do
        let(:airline) { create(:airline) }
        
        it "valid" do
          expect do
            post '/api/v2/graphql', params: { graphql: query(name: airline.name, image_url: airline.image_url) }
          end.to change { Airline.count }.by(1)
        end
      end

      def query(name:, image_url:)
        <<~GQL
          mutation {
            createAirline (
              input: {
                name: #{name},
                image_url: #{image_url}
            }) {
              airline{
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