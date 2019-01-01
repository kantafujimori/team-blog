class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true
  validates :text, presence: true, if: -> { image.blank? }
  validates :image, presence: true, if: -> { text.blank? }
end
