require 'mailgun'
require_relative 'database_connection'

class PeepMailer
  def initialize(mailer: Mailgun::Client, connection: DatabaseConnection)
    @mailer = mailer.new(ENV['MAILGUN_API_KEY'])
  end

  def get_details(reply_id)
    details = DatabaseConnection.query('SELECT users.email, users.username '\
      "FROM users INNER JOIN peeps ON peeps.id = #{reply_id};")[0]
  end

  def send_notification(peep_id, reply_id)
  end 
end
