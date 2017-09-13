class MessagesController < ApplicationController
  before_action :authenticate_user!
  def index
    @user = current_user
    @groups = current_user.groups
    @message = Message.new
    @group = Group.find(params[:group_id])
  end

  def create
    @group = Group.find(params[:group_id])
    @message = Message.new(body: message_params[:body], image: message_params[:image], group_id: @group.id, user_id: current_user.id)
    @message.save
  end

  private
  def message_params
    params.require(:message).permit(:body, :image)
  end
end
