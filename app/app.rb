ENV["RACK_ENV"] ||= "development"
require 'sinatra/base'
require_relative 'data_mapper_setup'
require 'sinatra/flash'
require 'bcrypt'

class Chitter < Sinatra::Base
  # enable :sessions
  # set :session_secret; 'super_secret'
  # register Sinatra::Flash
  get '/home' do
    @peeps = Peep.all
    erb :'home'
  end

  post '/home' do
    peep = Peep.new(content: params[:peep])
    peep.save
    redirect 'home'
  end
  get '/home/new' do
    erb :'peeps/new_peep'
  end



end
