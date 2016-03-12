class Contact < MailForm::Base
  attribute :name,      :validate => true
  attribute :email,     :validate => /\A([\w\.%\+\-]+)@([\w\-]+\.)+([\w]{2,})\z/i
  attribute :about
  attribute :tax_number
  attribute :phone
  attribute :admin
  attribute :nickname,  :captcha  => true

  # Declare the e-mail headers. It accepts anything the mail method
  # in ActionMailer accepts.
  def headers
    {
      :subject => "Charity Application",
      :to => "tfctimeforcharity@gmail.com",
      :from => %("#{name}" <#{email}>)
    }
  end
end

