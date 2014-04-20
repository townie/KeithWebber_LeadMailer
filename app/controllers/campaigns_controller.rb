class CampaignsController < ApplicationController
  def index
    @campaigns = current_user.campaigns
  end

  def show
    @campaign = Campaign.find(params[:id])
    @contacts = @campaign.contacts
    # if @campaign.email_template.present?
    #   filename= @campaign.email_template.filename
    # else
    #   filename = 'email1'
    # end
    # @email_template = "emailblast/#{filename}"
    session[:current_campaign] = @campaign.id
  end

  def new
    @campaign = Campaign.new
  end

  def create
    @campaign = current_user.campaigns.build(campaign_params)

    if @campaign.save
      redirect_to edit_campaign_path(@campaign), notice: "New Campaign Created"
    else
      render 'new'
    end
  end

  def edit
    @campaign = Campaign.find(params[:id])
    @contacts = current_user.contacts
  end

  def update
    @campaign = current_user.campaigns.find(params[:id])
    @campaign.update(campaign_contacts_params)
    redirect_to campaign_path
  end

protected

  def campaign_contacts_params
    params.require(:campaign).permit( :contact_ids => [])
  end

  def campaign_params
    params.require(:campaign).permit(:title, :purpose, :contact_ids)
  end
end
