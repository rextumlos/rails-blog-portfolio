class ContactForm
  include ActiveModel::Model

  attr_accessor :email, :subject, :message

  validates :email, presence: true, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :subject, presence: true
  validates :message, presence: true
end
