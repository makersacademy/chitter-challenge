require 'pg'
require_relative 'database'
require 'pry'

module DatabaseHelper
  def self.connection_details
    ENV['RACK_ENV'] == 'test' ?
    {:dbname => 'chitter_app_test'} : {:dbname => 'chitter_app'}
  end
end

module LoginHelper
  def self.verify_log_in(params)
    result = Database.execute('SELECT id, hashed_password FROM users WHERE username = $1', [params[:username]])
    hashed_password = result.to_a[0]['hashed_password']
    user_id = result.to_a[0]['id']
    to_check = BCrypt::Password.new(hashed_password)
    return to_check == params[:password] ? user_id : false
  end
end
