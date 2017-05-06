ENV['RACK_ENV'] ||= 'development'

require 'data_mapper'
require 'dm-postgres-adapter'
require 'dm-timestamps'
require 'bcrypt'
require 'sinatra/flash'

require_relative 'models/response'
require_relative 'models/peep'
require_relative 'models/user'


DataMapper.setup(:default, ENV['DATABASE_URL'] || "postgres://localhost/chitter_#{ENV['RACK_ENV']}")
DataMapper.finalize
DataMapper.auto_upgrade!

  def login?
    if session[:user_id].nil?
      return false
    else
      return true
    end
  end

  def username
    return session[:username]
  end

  def current_user
   @current_user ||= User.get(session[:user_id])
 end
