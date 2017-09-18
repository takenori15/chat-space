class Message < ApplicationRecord
  belongs_to :group
  belongs_to :user
  mount_uploader :image, ImageUploader
  # validate :two_values_should_be_included
  validates :body, presence: true, unless: :image?

  # def two_values_should_be_included
  #   condition = body || image
  #   errors.add(:body, "に関するエラー") unless condition.present?
  # end
end
