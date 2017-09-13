class MessagesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_group
  def index
    @groups = current_user.groups
    @message = Message.new
  end

  def create
    @message = Message.new(message_params)
    @message.save
  end

  private
  def message_params
    params.require(:message).permit(:body, :image).merge(group_id: @group.id, user_id: current_user.id)
  end

  def set_group
    @group = Group.find(params[:group_id])
  end
end
