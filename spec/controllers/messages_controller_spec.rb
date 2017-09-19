require 'rails_helper'
describe MessagesController, type: :controller do
  let(:user) {create(:user)}

  describe 'GET #index' do
    before do
      login_user user
    end

    it "get @message" do
      group = create(:group)
      get :index, group_id: group
      expect(assigns(:message)).to be_a_new(Message)
    end

    it "get @messages" do
      group    = create(:group)
      messages = group.messages
      get :index, group_id: group
      expect(assigns(:messages)).to match(messages)
    end

    it "renders the :index template" do
      group = create(:group)
      get :index, group_id: group
      expect(response).to render_template :index
    end
  end

  describe 'GET #index' do
    it "redirected to the :index template when a user doesn't sign in" do
      group = create(:group)
      get :index, group_id: group
      expect(response).to redirect_to(new_user_session_path)
    end
  end

  describe 'POST #create' do
    before do
      login_user user
    end

    it "saves the new message in the database when a user is signed in" do
      group = create(:group)
      expect{
        post :create, group_id: group, message: attributes_for(:message)
      }.to change(Message, :count).by(1)
    end

    it "redirect to the :create template" do
      group = create(:group)
      post :create, group_id: group, message: attributes_for(:message)
      expect(response).to redirect_to(group_messages_path)
    end

    it "could not save a message in the database when a user is signed in" do
      group = create(:group)
      expect{
        post :create, group_id: group, message: attributes_for(:message, body: nil, image: nil)
      }.not_to change(Message, :count)
    end

    it "render the :index template when it could not save a message" do
      group = create(:group)
      post :create, group_id: group, message: attributes_for(:message, body: nil, image: nil)
      expect(response).to render_template :index
    end
  end

  describe 'POST #create' do
    it "redirect when a user who isn't signed in tries to send a message" do
      group = create(:group)
      post :create, group_id: group, message: attributes_for(:message)
      expect(response).to redirect_to(new_user_session_path)
    end
  end
end
