class ContactsController < ApplicationController
  def new
    @contact = Contact.new
  end

  def create
    @contact = Contact.new(contact_params)
    if @contact.save
      redirect_to new_contact_path, notice: "#{@contact.email} added"
    else
    end
  end

  def index
    @contacts = Contact.all
  end

  protected

  def contact_params
    params.require(:contact).permit(:email, :first_name, :last_name, :phone_number)
  end

end
