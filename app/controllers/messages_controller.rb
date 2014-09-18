class MessagesController < ApplicationController
  before_action :authenticate_user!

  respond_to :json

  def index
    group = current_user.groups.find(params[:group_id])
    render json: group.messages.ordered
  end

  def create

    group = current_user.groups.find(params[:group_id])
    message = group.messages.new(message_params)
    if message.save
      message.broadcast
      render json: message, status: :created
    else
      render json: message.errors, status: :unprocessable_entity
    end
  end

  private

  def message_params
    params.require(:message).permit(:body)
  end
end
