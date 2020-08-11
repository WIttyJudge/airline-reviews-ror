module Mutations
  class CreateAirline < BaseMutation
    argument :name, String, required: true
    argument :image_url, String, required: true

    field :airline, Types::AirlineType, null: true
    field :errors, String, null: false 

    def resolve(name: nil, image_url: nil)
      airline = Airline.create(
        name: name,
        image_url: image_url
      )

      if airline.save
        {
          airline: airline,
          errors: []
        }
      else
        {
          airline: nil,
          errors: airline.errors.full_messages
        }
      end
    end
  end
end