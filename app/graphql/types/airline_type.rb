module Types
  class AirlineType < Types::BaseObject
    field :id, ID, null: false
    field :name, String, null: false
    field :image_url, String, null: false
    field :slug, String, null: false
    field :average_score, Float, null: false, method: :average_score
    field :reviews, [ReviewType], null: true
    field :created_at, GraphQL::Types::ISO8601DateTime, null: false
    field :updated_at, GraphQL::Types::ISO8601DateTime, null: false
  end
end
