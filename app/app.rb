require 'sinatra/base'
require_relative "./datamapper_setup"

class Chitter < Sinatra::Base

  get '/' do 
    erb(:index)
  end

  get '/user/new' do 
    erb(:new_user)
  end

  post '/user' do 
  @username = params[:username]
  User.create(name: params[:name], username: params[:username], email: params[:email], password: params[])
    erb(:registered)
  end

  run! if app_file == $0

end

