require 'rails_helper'

RSpec.describe Tweet, type: :model do
  describe '#create' do
    context 'can save' do
      it 'is valid with text' do
        expect(build(:tweet, image: nil)).to be_valid
      end

      it 'is valid with image' do
        expect(build(:tweet, text: nil)).to be_valid
      end

      it 'is valid with text and image' do
        expect(build(:tweet)).to be_valid
      end
    end

    context 'not can save' do
      it 'is invalid without text and image' do
        tweet = build(:tweet, text: nil, image: nil)
        tweet.valid?
        expect(tweet.errors[:text]).to include("can't be blank")
      end

      it 'is invalid without user_id' do
        tweet = build(:tweet, user_id: nil)
        tweet.valid?
        expect(tweet.errors[:user]).to include("must exist")
      end
    end
  end
end
