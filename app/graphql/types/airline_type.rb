module Types
  class AirlineType < Types::BaseObject
    field :id, ID, null: false
    field :name, String, null: true
    field :image_url, String, null: true
    field :slug, String, null: true
    field :average_score, Float, null: true, method: :average_score
    field :reviews, [ReviewType], null: true
    field :created_at, GraphQL::Types::ISO8601DateTime, null: true
    field :updated_at, GraphQL::Types::ISO8601DateTime, null: true
  end
end
