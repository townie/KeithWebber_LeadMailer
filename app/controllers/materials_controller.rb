class MaterialsController < ApplicationController
  def index
    @materials = Material.all
  end

  def show
    @material = Material.find(params[:id])

    if !@material.email_template.nil?
      filename= @material.email_template.filename
    else
      filename = 'email1review'
    end
    @emailtemplate = "emailblast/#{filename}"
  end

  def new
    @material = Material.new
    @campaign = Campaign.find(session[:current_campaign])
    if session[:template_customize].present?
      @material.email_template = EmailTemplate.find(session[:template_customize])
    end
  end

  def edit
    @material = current_user.materials.find(params[:id])
    if !@material.email_template.nil?
      filename= @material.email_template.filename
    else
      filename = 'email1'
    end
    @emailtemplate = "emailblast/#{filename}"
  end

  def create
    @material = Material.new(material_params)
    @material.campaign = Campaign.find(session[:current_campaign])
    if session[:template_customize].present?
      @material.email_template = EmailTemplate.find(session[:template_customize])
    end
    if @material.save
      redirect_to @material, notice: "Successfully created"
    else
      render 'new'
    end
  end

  def update
    @material = current_user.materials.find(params[:id])
    @material.update(material_params)
    redirect_to material_path(@material)
  end

  def sendemail
    @material = current_user.materials.find(params[:id])
    EmailWorker.perform_async(@material.id)
    redirect_to @material, notice: "Sending email"
  end

  protected

  def material_params
    params.require(:material).permit( :title, :field1, :field2, :field3, :field4, :field5, :field6, :field7, :field8, :field9, :field10)
  end
end
