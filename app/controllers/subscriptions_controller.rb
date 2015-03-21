class SubscriptionsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_group

  def destroy
    Subscription.find(params[:id]).destroy
    redirect_to @group
  end

  private

  def set_group
    @group = current_user.groups.find(params[:group_id])
  end
end
