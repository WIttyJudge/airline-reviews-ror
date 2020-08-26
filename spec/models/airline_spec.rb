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

RSpec.describe Airline, :type => :model do
  describe "testing factory" do
    let(:airline) { create(:airline) }

    it "valid factory" do
      expect(airline.save).to be_truthy
    end

    it "factory has a name" do
      expect(airline.name).not_to be nil
    end

    it "factory has a image_url" do
      expect(airline.image_url).not_to be nil
    end
  end

  describe ".validates_presence_of" do
    context "name" do
      let(:airline) { build(:airline, name: "") }

      it "cannot save" do
        expect(airline.save).to be_falsey
      end

      it "it is invalid" do
        expect(airline.valid?).to be_falsey
      end

      it "got error message" do
        airline.save
        expect(airline.errors.messages[:name]).to eq(["can't be blank"])
      end
    end

    context "image_url" do
      let(:airline) { build(:airline, image_url: "") }

      it "cannot save" do
        expect(airline.save).to be_falsey
      end

      it "it is invalid" do
        expect(airline.valid?).to be_falsey
      end

      it "got error message" do
        airline.save
        expect(airline.errors.messages[:image_url]).to eq(["can't be blank"])
      end
    end
  end

  describe ".validates_uniqueness_of" do
    context "name" do
      let(:airline) { create(:airline, name: "example name") }
      let(:airline1) { create(:airline, name: "example name") }

      it "cannot create" do
        expect(airline1.save).to be_falsey
      end

      it "it is not valid" do
        expect(airline1.valid?).to be_falsey
      end

      it "got error message" do
        airline1.save
        expect(airline1.errors.messages[:name]).to eq(["A company with this name already exists"])
      end
    end
  end

  describe ".before_create" do
    context "#name_to_title" do
      let(:airline) { create(:airline) }

      it "correct name" do
        expect(airline.name).to eq("First Airline")
      end
    end

    context "#slugify" do
      let(:airline) { create(:airline) }

      it "slug parsed by name correctly" do
        expect(airline.slug).to eq("first-airline")
      end
    end
  end

  describe "#average_score" do
    context "if airline has some reviews" do
      let(:airline) { create(:airline) }
      let!(:review1) { create(:review, score: 5, airline: airline) }
      let!(:review2) { create(:review, score: 4, airline: airline) }
      let!(:review3) { create(:review, score: 5, airline: airline) }

      it "it counted correctly" do
        # (5+4+5)/3
        expect(airline.average_score).to eq(4.67)
      end
    end

    context "if airline doesn't have any reviews" do
      let(:airline) { create(:airline) }

      it "it counted currectly" do
        expect(airline.average_score).to eq(0)
      end
    end

  end
end
