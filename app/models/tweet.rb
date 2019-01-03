class Tweet < ApplicationRecord
  belongs_to :user
  has_many :comments, dependent: :destroy
  mount_uploader :image, ImageUploader
  validates :text, presence: true, if: -> { image.blank? }
  validates :image, presence: true, if: -> { text.blank? }
end
