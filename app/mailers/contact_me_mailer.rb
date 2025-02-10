class ContactMeMailer < ApplicationMailer
  default from: 'jrpblogscontact@example.com'

  def contact_me
    @contact = params[:contact]
    email = @contact[:email]
    subject = @contact[:subject]
    message = @contact[:message]
    contact_email = Rails.application.credentials.contact_email

    mail(to: contact_email, subject: "[Portfolio] - #{subject}") do |format|
      format.html { render 'contact_me_mailer/contact_me', locals: { email: email, subject: subject, message: message } }
    end
  end
end
