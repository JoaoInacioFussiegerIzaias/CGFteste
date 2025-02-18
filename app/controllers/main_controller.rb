class MainController < ApplicationController
  def index
    flash[:notice] = "oiiiiiiiiiiiii"
    flash[:alert] = "oiiiiiiiiiiiii"
  end
end
