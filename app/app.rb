ENV["RACK_ENV"] ||= "development"
require 'sinatra/base'
require_relative 'data_mapper_setup'
require 'sinatra/flash'
require 'bcrypt'

class Chitter < Sinatra::Base
  # enable :sessions
  # set :session_secret; 'super_secret'
  # register Sinatra::Flash

  get '/home/new' do
    erb :'new_peep'
  end

  post '/home' do
    peep = Peep.new()
    redirect 'home'
  end

end
