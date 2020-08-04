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
	has_many :reviews

  validates :name, :image_url, presence: true
  
  before_create :name_to_title, :slugify
  
  private

  def name_to_title
    self.name = name.titleize
  end

  def slugify
    self.slug = name.parameterize
  end

end
