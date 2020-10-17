require './lib/database_setup'
require 'rack'
require 'sinatra/base'
require './lib/peep'
require './lib/formats'

class Chitter < Sinatra::Base
  enable :sessions

  get '/chitter' do
    @user = session[:user]
    @peeps = Peep.all
    erb :chitter
  end

  get '/chitter/user/new' do
    erb :new_user
  end

  post '/chitter/user' do
    session[:user] = User.create(name: params[:name], username: params[:username], email: params[:email], password: params[:password])
    redirect '/chitter'
  end
end
