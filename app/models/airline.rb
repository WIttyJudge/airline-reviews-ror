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
class Airline < ApplicationRecord
	has_many :reviews, dependent: :destroy

  validates_presence_of :name, :image_url
  validates_uniqueness_of :name, message: "A company with this name already exists"
  
  before_create :name_to_title, :slugify
  before_update :name_to_title, :slugify

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
