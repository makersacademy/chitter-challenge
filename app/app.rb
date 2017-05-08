require 'sinatra/base'
require_relative "./datamapper_setup"

class Chitter < Sinatra::Base

  get '/' do 
    erb(:index)
  end

  get '/user/new' do 
    p params
    erb(:new_user)
  end

  post '/user/registered' do 
    p params
    @username = params[:username]
    erb(:registered)
  end

  run! if app_file == $0

end