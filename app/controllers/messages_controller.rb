class MessagesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_group
  before_action :set_current_groups
  def index
    @message = Message.new
  end

  def create
    @message = Message.new(message_params)
    if @message.save
      flash[:notice] = "送信成功"
      redirect_to action: :index
    else
      flash.now[:alert] = "送信失敗"
      render :index
    end
  end

  private
  def message_params
    params.require(:message).permit(:body, :image).merge(group_id: @group.id, user_id: current_user.id)
  end

  def set_group
    @group = Group.find(params[:group_id])
  end

  def set_current_groups
    @groups = current_user.groups
  end
end
