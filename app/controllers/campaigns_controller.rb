class CampaignsController < ApplicationController
  def index
    @campaigns = current_user.campaigns
  end

  def show
    @campaign = Campaign.find(params[:id])
     @contacts = @campaign.contacts
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
    @contact_campaign = ContactCampaign.new
    @contacts = current_user.contacts
  end

  def update
    @campaign = current_user.campaigns.find(params[:id])
    @contact_campaign = campaign_contacts_params

    @contact_campaign.each do |contact_tagged_for_email|
      if contact_tagged_for_email != 0
        ContactCampaign.create(contact_id: contact_tagged_for_email.to_i, campaign: @campaign)
      end
    end

    redirect_to @campaign

  end

  protected
  def campaign_contacts_params
    params.require(:campaign).require(:contact_ids)

  end

  def campaign_params
    params.require(:campaign).permit(:title, :purpose, :contact_ids)
  end
end
