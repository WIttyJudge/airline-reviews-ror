# == Schema Information
#
# Table name: airlines
#
#  id         :bigint           not null, primary key
#  name       :string           not null
#  image_url  :text             not null
#  slug       :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
FactoryBot.define do
  factory :airline do
    name { 'first airline' }
    image_url { 'https://test.com/photo' }
  end
end
