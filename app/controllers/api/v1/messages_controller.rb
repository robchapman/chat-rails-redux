class Api::V1::MessagesController < ApplicationController
  before_action :set_channel

  def index
    messages = Message.order(created_at: :desc)
    render json: messages
  end

  def create
    message = Message.create(content: message_params[:content], user: current_user)
    render json: message
  end

  private

  def set_channel
    @channel = Channel.find_by(name: params[:channel_id])
  end

  def message_params
    params.require(:post).permit(:content)
  end
end
