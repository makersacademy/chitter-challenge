# frozen_string_literal: true

require 'pg'

# Stores information of the current user
class User

  @@id = nil

  def self.request_login(username, password)
    requested_user = connection.query("SELECT * FROM users WHERE username = '#{username}';").first
    login(requested_user['id']) if requested_user['pword'] == password
  end

  def self.login(n)
    @@id = n
  end

  def self.logout
    @@id = nil
  end

  def self.id
    @@id
  end

  def self.username
    return nil if @@id.nil?
    connection.query("SELECT * FROM users WHERE id = #{@@id};").first['username']
  end

  def self.connection
    PG.connect(dbname: "chitter_zimmja#{'_test' if ENV['ENVIRONMENT'] == 'test'}")
  end
end
