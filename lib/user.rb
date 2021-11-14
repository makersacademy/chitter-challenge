# frozen_string_literal: true

require 'pg'

# Stores information of the current user
class User

  @@id = nil

  class << self
    def request_login(username, password)
      requested_user = connection.query("SELECT * FROM users WHERE username = '#{username}';").first
      login(requested_user['id']) if requested_user['pword'] == password
    end

    def login(n)
      @@id = n
    end

    def logout
      @@id = nil
    end

    def all
      connection.exec('SELECT * FROM users')
    end

    def create(email, pword, fullname, username)
      created = connection.exec_params('INSERT INTO users (email,pword,fullname,username) 
      VALUES ($1,$2,$3,$4) RETURNING id', [email, pword, fullname, username])
      created.first['id']
    end

    def id
      @@id
    end

    def username
      return 'none' if @@id.nil?
      connection.query("SELECT * FROM users WHERE id = #{@@id};").first['username']
    end

    def fullname
      return 'none' if @@id.nil?
      connection.query("SELECT * FROM users WHERE id = #{@@id};").first['fullname']
    end

    def time(time = Time.new)
      "#{ft(time.hour)}:#{ft(time.min)}, #{ft(time.day)}/#{ft(time.month)}/#{time.year}"
    end

    private

    def ft(n) # format time
      n < 10 ? "0#{n}" : n
    end

    def connection
      PG.connect(dbname: "chitter_zimmja#{'_test' if ENV['ENVIRONMENT'] == 'test'}")
    end
  end
end
