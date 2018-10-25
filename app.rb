require 'sinatra/base'
require './lib/user'

class ChitterApp < Sinatra::Base
  enable :sessions

  get '/' do
    erb :index
  end

  get '/sign_up' do
    erb :sign_up
  end

  post '/sign_up' do
    name = params[:name]
    username = params[:username]
    emailaddress = params[:emailaddress]
    password = params[:password]
    User.create(name: name, username: username, emailaddress: emailaddress, password: password)
    redirect "/#{username}"
  end

  get '/:username' do
    @name = User.name
    @username = params[:username]
    erb :profile
  end

    run! if app_file == $0
end
