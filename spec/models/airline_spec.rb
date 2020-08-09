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
require 'rails_helper'

RSpec.describe Airline, type: :model do
  context "validates_presence_of" do
    before do
      @airline = Airline.create(:name => "https://test.com", :image_url => "test")
    end

    it "valid" do
      expect(@airline.valid?).to be(true)
    end

    it "name is required" do
      @airline.name = ""
      expect(@airline.valid?).to be(false)
      expect(@airline.errors[:name]).to eq ["can't be blank"]
    end

    it "image_url is required" do
      @airline.image_url = ""
      expect(@airline.valid?).to be(false)
      expect(@airline.errors[:image_url]).to eq ["can't be blank"]
    end

    context "before_create" do
      it "name_to_title" do
        airline = Airline.create(:name => "test:test TesT", :image_url => "https://test.com")
        expect(airline.name).to eq("Test:Test Tes T")
      end
    end

    context "validates_uniqueness_of" do
      it "name must be unique" do
        first_airline = Airline.create(:name => "test", :image_url => "https://test.com")
        second_airline = Airline.create(:name => "test", :image_url => "https://test.com")

        expect(second_airline.valid?).to be(false)
        expect(second_airline.errors).to eq(["A company with this name already exists"])
      end
    end

    context "class_methods" do 
      context "average_score" do
        it "airline average score is correct" do
          airline = Airline.create(:name => "test", :image_url => "https://test.com")
          reviews = Review.create([
            {
              :title => "test title",
              :description => "first description",
              :score => 2,
              :airline_id => airline.id
            },
            {
              :title => "test title",
              :description => "first description",
              :score => 5,
              :airline_id => airline.id
            },
            {
              :title => "test title",
              :description => "first description",
              :score => 1,
              :airline_id => airline.id
            },
          ])

          # (2+5+1) / 3
          expect(airline.average_score).to eq(2.67)
        end

        it "if we dont have any reviews, return 0" do 
          airline = Airline.create(:name => "test", :image_url => "https://test.com")
          expect(airline.average_score).to eq(0)
        end
      end
    end

  end
end
