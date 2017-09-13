class MessagesController < ApplicationController
  before_action :authenticate_user!
  def index
    @user = current_user
    @groups = current_user.groups
  end

  def create

  end
end
