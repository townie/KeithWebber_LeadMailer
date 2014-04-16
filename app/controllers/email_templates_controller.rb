class EmailTemplatesController < ApplicationController
  def index
    @emailtemplates  = EmailTemplate.all
  end

  # admin stuff
  def new
    @emailtemplate = EmailTemplate.new
  end

  def create
    @emailtemplate = EmailTemplate.new(template_params)
    if @emailtemplate.save
      redirect_to campaigns_path, notice: "Template created"
    else
      render 'new'
    end
  end
  # ^^^ admin

  def show
    @emailtemplates= [EmailTemplate.find(params[:id])]
  end

  protected

  def template_params
    params.require(:email_template).permit(:filename, :title)
  end

end
