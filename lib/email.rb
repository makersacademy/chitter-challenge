# frozen_string_literal: true

require 'net/smtp'
require 'pg'

# composes an email if a user is mentioned
class Email
  def self.mentions(username, words)
    words.each do |word|
      next unless word.start_with?('@')

      result = sql_query('
        SELECT COUNT(username)
        FROM users
        WHERE username = $1;
      ', [word]).first
      check_if_email_to_be_sent(username, word, result)
    end
  end

  def self.check_if_email_to_be_sent(username, word, count)
    result = sql_query('
      SELECT email
      FROM users
      WHERE username = $1;
    ', [word])
    send_email(result[0]['email'], username) unless count['count'].to_i.zero?
  end

  def self.send_email(to, peeper)
    our_email = 'makers_bnb@outlook.com'
    our_password = 'nakers_bmb'
    our_message = "From: <#{our_email}>\nTo: <#{to}>\n" \
                  "Subject: You were mentioned in a peep...\n\n" \
                  "#{peeper} mentioned you in a peep"
    smtp = Net::SMTP.new('smtp.office365.com', 587)
    smtp.enable_starttls # depends on smtp_server's authentication method
    smtp.start('localhost', our_email, our_password, :login) do |email|
      email.send_message our_message, our_email, to
    end
  end

  def self.sql_query(query, params = nil)
    connection = if ENV['ENVIRONMENT'] == 'test'
                   PG.connect(dbname: 'chitter_test')
                 else
                   PG.connect(dbname: 'chitter')
                 end
    connection.exec(query, params)
  end
end
