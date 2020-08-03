# == Schema Information
#
# Table name: reviews
#
#  id          :integer          not null, primary key
#  title       :string           not null
#  description :text             not null
#  score       :integer          not null
#  airline_id  :integer          not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
class Review < ApplicationRecord
  belongs_to :airline
end
