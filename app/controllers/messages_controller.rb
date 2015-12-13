class MessagesController < ApplicationController
  before_action :authenticate_user!

  def index
    @messages =  Message.all
    @message = Message.new
  end

  def create
    @message = Message.new
    if @message.save!
      redirect_to root_path
    else
      render :message
  end

  private
  def message_params
    params.require(:message).permit(:title, :content)
  end
end