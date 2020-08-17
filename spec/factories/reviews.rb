# == Schema Information
#
# Table name: reviews
#
#  id          :bigint           not null, primary key
#  title       :string           not null
#  description :text             not null
#  score       :integer          not null
#  airline_id  :bigint           not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
FactoryBot.define do
  factory :review do
    title { "First Title" }
    description { "First description" }
    score { 4 }
    
    association :airline, factory: :airline
  end
end
