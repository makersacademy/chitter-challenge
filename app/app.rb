ENV["RACK_ENV"] ||= "development"

require 'sinatra/base'
require_relative 'models/chitter'

class Chitter < Sinatra::Base
  get '/chits' do
    @chits = Chit.all
    erb :'chits/index'
  end

  get '/chits/new' do 
    erb :'chits/new'
  end

  post '/chits' do
  Chit.create(chitter_post: params[:chitter_post], user: params[:user])
  redirect to('/chits')
  end

  run! if app_file == $0
  
end