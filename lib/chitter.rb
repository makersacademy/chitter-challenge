# frozen_string_literal: true

require_relative 'database_connection'
require 'user'

class Chitter
  def self.sign_up(username:, email:, password:)
    if email_used?(email)
      'email used'
    elsif username_used?(username)
      'username used'
    else
      User.create(username: username, email: email, password: password)
    end
  end

  def self.log_in(account: , password:)
    user = DatabaseConnection.query("SELECT * FROM users WHERE username = '#{account}' OR email = '#{account}'").first
    if user['password'] == password
      create_object(user)
    else
      return false
    end
  end

  class << self
    def username_used?(username)
      results = DatabaseConnection.query("SELECT * FROM users WHERE username = '#{username}'").first
      if results == nil
        false
      else
        true
      end
    end

    def email_used?(email)
      results = DatabaseConnection.query("SELECT * FROM users WHERE email = '#{email}'").first
      if results == nil
        false
      else
        true
      end
    end
  end
end
