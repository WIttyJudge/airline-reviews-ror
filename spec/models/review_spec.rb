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
require 'rails_helper'

RSpec.describe Review, type: :model do
  context "validate" do
    before do
      airline = Airline.create(:name => "test", :image_url => "test")
      @review = Review.create(:title => "test", :description => "test", :score => 5, :airline_id => airline.id)
    end
    
    it "valid" do
      expect(@review.valid?).to be(true)
    end

    context "validates_persence_of" do
      it "title is required" do 
        @review.title = ""
        expect(@review.valid?).to be(false)
        expect(@review.errors[:title]).to eq(["can't be blank"])
      end

      it "description is required" do
        @review.description = ""
        expect(@review.valid?).to be(false)
        expect(@review.errors[:description]).to eq(["can't be blank"])
      end

      it "score is required" do
        @review.score = nil
        expect(@review.valid?).to be(false)
        expect(@review.errors[:score]).to include("can't be blank")
      end
    end

    context "validates_numericality_of" do
      it "score cannot be greater than 5" do
        @review.score = 10
        expect(@review.valid?).to be(false)
        expect(@review.errors[:score]).to eq(["must be less than or equal to 5"])
      end

      it "score cannot be equal to 0" do
        @review.score = 0
        expect(@review.valid?).to be(false)
        expect(@review.errors[:score]).to eq(["must be greater than 0"])
      end

      it "score cannot be float type" do 
        @review.score = 1.4
        expect(@review.valid?).to be(false)
        expect(@review.errors[:score]).to eq(["must be an integer"])
      end
    end
  end
end
