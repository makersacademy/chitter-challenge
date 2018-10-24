require 'sinatra/base'
require './lib/user'

class Chitter < Sinatra::Base
  enable :sessions

  get '/' do
    erb :index
  end

  post '/sign_up' do
    name = params[:name]
    username = params[:username]
    email = params[:email]
    password = params[:password]
    User.create(name: name, username: username, email: email, password: password)
    redirect "/#{username}"
  end

  get '/:username' do
    @name = User.all.last.name
    @username = User.all.last.username
    erb :profile
  end

end
