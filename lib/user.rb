# frozen_string_literal: true

require 'pg'

# Stores information of the current user
class User

  @@id = nil

  def self.username(id)
    'Matt'
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
end
