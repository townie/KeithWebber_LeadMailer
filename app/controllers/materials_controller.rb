class MaterialsController < ApplicationController
  def index
    @materials = Material.all
  end

  def show
    @material = Material.find(params[:id])
  end

  def new
    @material = Material.new
    @campaign = Campaign.find(session[:current_campaign])

  end

  def create

    @material = Material.new(material_params)
    @material.campaign = Campaign.find(session[:current_campaign])
    if @material.save
      redirect_to @material, notice: "Successfully created"
    else
      render 'new'
    end
  end
protected

  def material_params
    params.require(:material).permit( :title, :field1, :field2, :field3, :field4, :field5, :field6, :field7, :field8, :field9, :field10)
  end
end
