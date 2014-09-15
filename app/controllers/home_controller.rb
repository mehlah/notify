class HomeController < ApplicationController
  def show
    if current_user
      redirect_to current_user.groups.first || new_setup_path
    end
  end
end
