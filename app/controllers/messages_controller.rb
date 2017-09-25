class MessagesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_group
  def index
    @message = Message.new
    @messages = @group.messages
    respond_to do |format|
      format.html
      format.json {@new_message = @messages.where('id > ?', params[:message][:id])}
    end
  end

  def create
    @messages = @group.messages
    @message = @group.messages.new(message_params)
    if @message.save
      respond_to do |format|
        format.html { redirect_to group_messages_path(@group), notice: "送信成功" }
        format.json
      end
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
