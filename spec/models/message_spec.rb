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

end
