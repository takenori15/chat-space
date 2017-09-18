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
end
