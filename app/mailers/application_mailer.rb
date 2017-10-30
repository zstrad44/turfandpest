class ApplicationMailer < ActionMailer::Base
  include Roadie::Rails::Automatic
  default from: "#{Rails.configuration.app_name} <info@turfandpest.com>"
  layout 'mailer'
end
