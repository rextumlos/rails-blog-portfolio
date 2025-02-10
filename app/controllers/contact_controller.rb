class ContactController < ApplicationController
  rate_limit to: 3, within: 1.minute, with: -> { redirect_to root_path, alert: "Too many submissions!" }, only: :create

  def create
    @contact = ContactForm.new(contact_params)
    
    if @contact.valid?
      ContactMeMailer.with(contact: {
        email: @contact.email,
        subject: @contact.subject,
        message: @contact.message
      }).contact_me.deliver_later
      respond_to do |format|
        format.turbo_stream { flash.now[:notice] = "Your message has been sent!" }
        format.html { redirect_to root_path, notice: "Your message has been sent!" }
      end
    else
      respond_to do |format|
        format.turbo_stream { flash.now[:alert] = "There was an error sending your message." }
        format.html { render root_path, status: :unprocessable_entity }
      end
    end
  end

  private

  def contact_params
    params.permit(:email, :subject, :message)
  end
end
