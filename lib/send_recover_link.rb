# require 'mailgun'
#
# class SendRecoverLink
#
#  def initialize(mailer: nil)
#    @mailer = mailer || Mailgun::Client.new(ENV["your_api_key"])
#  end
#
#  def self.call(maker, mailer = nil)
#    new(mailer: mailer).call(maker)
#  end
#
#  def call(user)
#    mailer.send_message(ENV["mailgun_domain_name"], {from: "chitter@mail.com",
#        to: maker.email,
#        subject: "reset your password",
#        text: "click here to reset your password http://yourherokuapp.com/reset_password?token=#{maker.password_token}" })
#  end
#
#  private
#  attr_reader :mailer
# end
