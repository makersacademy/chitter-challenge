# frozen_string_literal: true

require 'pg'

# Stores information of the current user
class User

  @@id = nil

  def self.username
    connection.query("SELECT * FROM users WHERE id = #{@@id};").first['username']
  end

  def self.login(n)
    @@id = n
  end

  def self.logout
    @@id = nil
  end

  def self.user_id
    @@id
  end

  private

  def self.connection
    PG.connect(dbname: "chitter_zimmja#{'_test' if ENV['ENVIRONMENT'] == 'test'}")
  end
end
