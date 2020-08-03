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
require 'rails_helper'

RSpec.describe Airline, type: :model do
  context "validates" do
    before do
      @airline = Airline.create(:name => "https://test.com", :image_url => "test")
    end

    it "name is required" do
      @airline.name = ""
      expect(@airline.valid?).to be(false)
    end

    it "image_url is required" do
      @airline.image_url = ""
      expect(@airline.valid?).to be(false)
    end
    
    it "all records are not required" do
      expect(@airline.valid?).to be(true)
    end

  end
end
