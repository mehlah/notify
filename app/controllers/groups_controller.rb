class GroupsController < ApplicationController
  before_action :authenticate_user!

  def show
    @group = current_user.groups.find(params[:id])
    @groups = current_user.groups
  end

  def new
    @group = current_user.groups.build
    render layout: false
  end

  def create
    @group = current_user.groups.build(group_params)
    if @group.save
      redirect_to @group
    else
      render :new
    end
  end

  private

  def group_params
    params.require(:group).permit(:class_name)
  end
end
