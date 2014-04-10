class CampaignsController < ApplicationController
  def index
    @campaigns = current_user.campaigns
  end

  def new
    @campaign = Campaign.new
  end

  def create
    @campaign = current_user.campaigns.build(campaign_params)
    if @campaign.save
      redirect_to campaigns_path, notice: "New Campaign Created"
    else
      render 'new'
    end
  end

  protected

  def campaign_params
    params.require(:campaign).permit(:title, :purpose)
  end
end
