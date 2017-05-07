require 'sinatra/base'

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
    # redirect ('/user/registered')
  end

  get '/user/registered' do 
    @username = params[:username]
    erb(:registered)
  end

  run! if app_file == $0

end