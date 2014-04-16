class CampaignsController < ApplicationController
  def index
    @campaigns = current_user.campaigns
  end

  def show
    @campaign = Campaign.find(params[:id])
    @contacts = @campaign.contacts
    @email_template = 'emailblast/email1'
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
    @email_template = EmailTemplate.all
  end

  def update
    @campaign = current_user.campaigns.find(params[:id])
    @campaign.update(campaign_contacts_params)
    redirect_to campaign_path
  end

  protected

  # def email_template_params
  #   params.require(:campaign).permit( :email_template)
  # end

  def campaign_contacts_params
    params.require(:campaign).permit(:email_template_id, :contact_ids => [])
  end

  def campaign_params
    params.require(:campaign).permit(:title, :purpose, :contact_ids)
  end
end
