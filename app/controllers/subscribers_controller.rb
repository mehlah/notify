class SubscribersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_group

  def new
    @subscriber = Subscriber.new
    render layout: false
  end

  def create
    subscriber = Subscriber.new(subscriber_params)
    if subscriber.save
      @group.subscriptions.create(subscriber: subscriber)
      redirect_to @group
    else
      head 502
    end
  end

  private

  def subscriber_params
    params.require(:subscriber).permit(:name, :phone)
  end

  def set_group
    @group = current_user.groups.find(params[:group_id])
  end
end
