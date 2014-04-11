 module Users
  class ContactsController < ApplicationController
    def new
      @contact = Contact.new
      @user = current_user
    end

    def create
      @contact = Contact.new(contact_params)
      @contact.owner_id = current_user.id
      if @contact.save
        redirect_to new_users_contact_path, notice: "#{@contact.email} added"
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
end
