# Load the Rails application.
require_relative 'application'

# Initialize the Rails application.
Rails.application.initialize!

ActionMailer::Base.smtp_settings =   {
    :address            => 'smtp.gmail.com',
    :port               => 587,
    :domain             => 'gmail.com',
    :authentication     => :plain,
    :user_name          => ENV['GMAIL_LOGIN'],
    :password           => ENV['GMAIL_PWD']
  }


=begin
ActionMailer::Base.smtp_settings = {
  user_name: ENV['MAILJET_KEY'],
  password: ENV['MAILJET_SECRETKEY'],
  domain: 'bobato.herokuapp.com',
  address: 'in-v3.mailjet.com',
  port: 587,
  authentication: :plain,
  enable_starttls_auto: true
}
=end