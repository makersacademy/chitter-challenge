require 'sinatra/base'
require_relative './lib/user'
require_relative './lib/peep'
require_relative './lib/feed'
require_relative 'connection_setup'

class Chitter < Sinatra::Base
  enable :sessions

  get '/' do
    erb :index
  end

  get '/chitter/account/new' do
    erb :'account/new'
  end

  post '/chitter/account/new' do
    user = User.create(params[:username],params[:email],params[:password],params[:full_name])
    session[:username] = params[:username]
    session[:user_id] = user.id
    redirect "/chitter/account/#{session[:username]}"
  end

  get '/chitter/account/:username' do
    @user = User.find(session[:user_id])
    erb :'account/feed'
  end

  post '/chitter/account/:username/post_peep' do
    peep = Peep.create(params["peep_body"])
    user = User.find(session[:user_id])
    Feed.add(user, peep)


    redirect "/chitter/account/#{session[:username]}"
  end

  run! if app_file == $0
end