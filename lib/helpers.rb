require 'pg'
require_relative 'database'
require 'pry'

module DatabaseHelper
  def self.connection_details
    ENV['RACK_ENV'] == 'test' ?
    {:dbname => 'chitter_app_test'} : {:dbname => 'chitter_app'}
  end
end

module MailHelper
  def self.tagged_user(params)
     result = Database.execute('SELECT email, username FROM users where username = $1', [params])
     result.to_a.size == 0 ? false : result.to_a[0]
  end
end
