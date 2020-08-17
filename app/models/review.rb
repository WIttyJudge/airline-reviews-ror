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
class Review < ApplicationRecord
  belongs_to :airline
  
  validates_presence_of :title, :description, :score
  validates_numericality_of :score, only_integer: true, greater_than: 0, less_than_or_equal_to: 5
end
