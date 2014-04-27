class PagesController < ApplicationController
  def index
   render :layout => "index"
  end

  def home
    @campaigns = current_user.campaigns
    @materials = current_user.materials
  end
end
