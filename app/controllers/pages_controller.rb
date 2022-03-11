class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  def home
  end

  def switch_mode
    current_user.dark_mode = !current_user.dark_mode
    current_user.save
    # redirect_to params[:url]
    head :ok
  end

end
