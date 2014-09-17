class MessagesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_group

  def create
    @message = @group.messages.new(message_params)
    if @message.save
      redirect_to @group
    else
      head 502
    end
  end

  private

  def message_params
    params.require(:message).permit(:body)
  end

  def set_group
    @group = current_user.groups.find(params[:group_id])
  end
end
