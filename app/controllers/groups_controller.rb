class GroupsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_group, only: [:show, :edit, :update, :destroy]

  def show
    @groups = current_user.groups.ordered
    @message = Message.new
  end

  def new
    @group = current_user.groups.build
    render layout: false
  end

  def create
    @group = current_user.groups.build(group_params)
    @group.save
    redirect_to @group
  end

  def edit
    render layout: false
  end

  def update
    @group.update(group_params)
    redirect_to @group
  end

  def destroy
    @group.destroy
    redirect_to root_path
  end

  private

  def group_params
    params.require(:group).permit(:name)
  end

  def set_group
    @group = current_user.groups.find(params[:id])
  end
end
