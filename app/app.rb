ENV['RACK_ENV'] ||= 'development'
require 'sinatra/base'
require 'sinatra/flash'
require_relative 'data_mapper_setup'

class Chitter < Sinatra::Base
  enable :sessions
  set :session_secret, 'session'
  register Sinatra::Flash
  #include BCrypt

  get '/' do
    "hello"
  end



  run! if app_file == $0

end
