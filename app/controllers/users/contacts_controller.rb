 module Users
  class ContactsController < ApplicationController
    def new
      @contact = Contact.new
      @user = current_user
    end

    def create
      @contact = Contact.new(contact_params)
      @contact.user_id = current_user.id

      if @contact.save
        redirect_to new_users_contact_path, notice: "#{@contact.email} added"
      else
        render 'new', alert: "That email already exists"
      end
    end

    def index
      @contacts = Contact.where("user_id = ?", current_user.id)
    end

    def callback

      @new_contacts =  Contact.gmail_email_catcher(request.env['omnicontacts.contacts'], current_user)


    end

    protected

    def contact_params
      params.require(:contact).permit(:email, :first_name, :last_name, :phone_number)
    end

  end
end
