require 'rails_helper'
describe Message do
  describe '#create' do
    it "is valid if a message has a body" do
      message = create(:message, body: "aaaaaaaa", image: "")
      expect(message).to be_valid
    end
  end

  describe '#create' do
    it "is valid if a message has an image" do
      message = create(:message, body: nil)
      expect(message).to be_valid
    end
  end

  describe '#create' do
    it "is valid if a message has both a body and a image" do
      message = create(:message)
      expect(message).to be_valid
    end
  end

  describe '#create' do
    it "is invalid if a message doesn't have both a body and a image" do
      message = build(:message, body: "", image: "")
      expect(message).not_to be_valid
    end
  end

  describe '#create' do
    it "is invalid if a message doesn't have a group_id" do
      message = build(:message, group_id: "")
      expect(message).not_to be_valid
    end
  end

  describe '#create' do
    it "is invalid if a message doens't have a user_id" do
      message = build(:message, user_id: "")
      expect(message).not_to be_valid
    end
  end
end
