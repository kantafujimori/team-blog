class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :tweet
  mount_uploader :image, ImageUploader
  validates :text, presence: true, if: -> { image.blank? }
  validates :image, presence: true, if: -> { text.blank? }
end
