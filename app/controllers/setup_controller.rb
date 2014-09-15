class SetupController < ApplicationController
  def new
    @group = current_user.groups.build
  end
end
