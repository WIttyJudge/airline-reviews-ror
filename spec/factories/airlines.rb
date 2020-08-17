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
    image_url { 'https://images.unsplash.com/photo-1532882191016-9133c6d82083?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=360&q=80' }
  end
end
