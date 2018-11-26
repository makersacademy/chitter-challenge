require 'sinatra/base'
require 'capybara'
require 'pg'
require './database_connection_setup'
require_relative './lib/peeps.rb'
require_relative './lib/users.rb'

class Chitter < Sinatra::Base
  enable :sessions

  get '/peeps' do
    @user = Users.find(session[:id])
    @peeps = Peeps.all
    erb :index
  end

  get '/post_peep' do
    @user = Users.find(session[:id])
    erb :post_peep
  end

  post '/peeps' do
    @peep = Peeps.post(params[:context])
    redirect '/peeps'
  end

  get '/register' do
    erb :register
  end

  post '/register/new' do
    user = Users.create(
      username: params[:username],
      email: params[:email],
      password: params[:password])
    session[:id] = user.id
    redirect '/peeps'
  end

  get '/welcome' do
    @user
    erb :welcome
  end

  run! if app_file == $0

end
