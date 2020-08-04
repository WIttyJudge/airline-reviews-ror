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
      expect(@airline.errors.messages[:name]).to eq ["can't be blank"]
    end

    it "image_url is required" do
      @airline.image_url = ""
      expect(@airline.valid?).to be(false)
      expect(@airline.errors.messages[:image_url]).to eq ["can't be blank"]
    end
    
    it "all records are not required" do
      expect(@airline.valid?).to be(true)
    end

    context "before_create" do
      it "name_to_title" do
        airline = Airline.create(:name => "test:test TesT", :image_url => "https://test.com")
        expect(airline.name).to eq("Test:Test Tes T")
      end
    end

  end
end
