class MessagesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_group
  def index
    @message = Message.new
    @messages = @group.messages
  end

  def create
    @message = @group.messages.new(message_params)
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
    params.require(:message).permit(:body, :image, :group_id).merge(user_id: current_user.id)
  end

  def set_group
    @group = Group.find(params[:group_id])
  end

end
