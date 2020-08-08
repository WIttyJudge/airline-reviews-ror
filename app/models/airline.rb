# == Schema Information
#
# Table name: airlines
#
#  id         :integer          not null, primary key
#  name       :string
#  image_url  :text
#  slug       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Airline < ApplicationRecord
	has_many :reviews, dependent: :destroy

  validates :name, :image_url, presence: true
  
  before_create :name_to_title, :slugify

  def average_score
    reviews.present? ? reviews.average(:score).round(2).to_f : 0
  end
  
  private

  def name_to_title
    self.name = name.titleize
  end

  def slugify
    self.slug = name.parameterize
  end

end
