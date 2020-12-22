class Api::V1::MessagesController < ApplicationController
  before_action :set_channel

  def index
    messages = Message.where("channel_id = #{@channel.id}").order(created_at: :desc)
    messages_new = messages.map do |message|
      {
        "id": message.id,
        "author": message.user.email,
        "content": message.content,
        "created_at": message.created_at
      }
    end
    render json: messages_new
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
