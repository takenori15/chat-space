class Message < ApplicationRecord
  belongs_to :group
  belongs_to :user
  mount_uploader :image, ImageUploader
  validate :two_values_should_be_included

  def two_values_should_be_included
    condition = body || image
    errors.add(:body, "") unless condition.present?
  end
end
