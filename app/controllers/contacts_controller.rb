class ContactsController < ApplicationController
  def new
    @contact = Contact.new
  end

  def create
    @contact = Contact.new(params[:contact])
    @contact.request = request
    if @contact.deliver
   redirect_to root_path, notice: 'Thank you for your application. We will respond to you soon!'
    else
      flash.now[:error] = 'Cannot send message. Please try again!'
      render :new
    end
  end
end