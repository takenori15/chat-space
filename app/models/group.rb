class Group < ApplicationRecord
  validates :group_name, presence: true
  has_many :users, through: :members
  has_many :members
  has_many :messages

  validate :add_error_messages
  def add_error_messages
    if group_name.empty?
      errors.add(:group_name, "に関係するエラーが発生")
    end
  end
end
