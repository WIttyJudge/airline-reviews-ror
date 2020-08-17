require 'rails_helper'

RSpec.describe Review, type: :model do
  describe "testing factory" do
    let(:review) { create(:review) }

    it "valid factory" do
      expect(review).to be_truthy
    end

    it "factory has a title" do
      expect(review.title).to eq("First Title")
    end

    it "factory has a description" do
      expect(review.description).to eq("First description")
    end

    it "factory has a score" do
      expect(review.score).to eq(4)
    end

    it "factory assosiate with airline" do
      expect(review.airline.name).to eq("First Airline")
    end
  end

  describe ".validates_presence_of" do
    context "title" do
      let(:review) { build(:review, title: "") }

      it "cannot save" do
        expect(review.save).to be_falsey
      end

      it "it is not valid" do
        expect(review.valid?).to be_falsey
      end

      it "got error message" do
        review.save
        expect(review.errors.messages[:title]).to eq(["can't be blank"])
      end
    end

    context "description" do
      let(:review) { build(:review, description: "") }

      it "cannot save" do
        expect(review.save).to be_falsey
      end

      it "it is not valid" do
        expect(review.valid?).to be_falsey
      end

      it "got error message" do
        review.save
        expect(review.errors.messages[:description]).to eq(["can't be blank"])
      end
    end

    context "score" do
      let(:review) { build(:review, score: "") }

      it "cannot save" do
        expect(review.save).to be_falsey
      end

      it "it is not valid" do
        expect(review.valid?).to be_falsey
      end

      it "score required, it got error message" do
        review.save
        expect(review.errors.messages[:score]).to include("can't be blank")
      end

      it "score is a number, it got error message" do
        review.save
        expect(review.errors.messages[:score]).to include("is not a number")
      end
    end
  end

  describe "#validates_numericality_of" do
    context "score" do
      context "must be only integer" do
        let(:review) { build(:review, score: 1.2) }

        it "it is not valid" do
          expect(review.valid?).to be_falsey
        end

        it "cannot save" do
          expect(review.save).to be_falsey
        end

        it "got error message" do
          review.save
          expect(review.errors.messages[:score]).to eq(["must be an integer"])
        end
      end
      
      context "greater then 0" do
        let(:review) { build(:review, score: 0) }

        it "it is not valid" do
          expect(review.valid?).to be_falsey
        end

        it "cannot save" do
          review.save
          expect(review.save).to be_falsey
        end

        it "got error message" do
          review.save
          expect(review.errors.messages[:score]).to eq(["must be greater than 0"])
        end
      end

      context "less than or equel 5" do
        let(:review) { build(:review, score: 10) }

        it "it is not valid" do
          expect(review.valid?).to be_falsey
        end

        it "cannot save" do
          review.save
          expect(review.save).to be_falsey
        end

        it "got error message" do
          review.save
          expect(review.errors.messages[:score]).to eq(["must be less than or equal to 5"])
        end
      end
    end
  end
end
