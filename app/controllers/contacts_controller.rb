class ContactsController < ApplicationController
  def new
    @contact = Contact.new
  end

  def create
    @contact = Contact.new(params[:contact])
    @contact.request = request
    if @contact.deliver
      flash.now[:notice] = 'Thank you for your application. We will respond to you soon!'
    else
      flash.now[:error] = 'Cannot send message. Please try again!'
      render :new
      redirect_to charForm_path
    end
  end
end