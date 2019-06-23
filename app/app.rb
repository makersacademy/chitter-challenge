require 'sinatra/base'
require_relative '../lib/peep'
require_relative './database_connection_setup.rb'

class ChitterApp < Sinatra::Base

  enable :sessions

  get '/chitter' do
    @peeps = Peep.all
    erb :chitter
  end

  get '/chitter/new' do
    erb :compose
  end

  post '/chitter' do
    Peep.create(content: params[:content])
    redirect '/chitter'
  end

  get '/chitter/sign_up' do
    erb :sign_up
  end

  post '/chitter/account' do
    User.create(
      first_name: params[:first_name],
      last_name: params[:last_name],
      username: params[:username],
      email: params[:email],
      password: params[:password],
    )
    session[:user] = user
    redirect '/chitter/account'
  end

  get '/chitter/account' do
    @peeps = Peep.all
    @first_name = session['user'].first_name
    erb :chitter_greet
  end

  run! if app_file == $0
end
