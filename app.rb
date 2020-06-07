require 'sinatra/base'
require 'pg'
require './lib/chitter_account'

class Chitter < Sinatra::Base
  enable :sessions

  get '/' do
    erb :index
  end

  post '/login' do
    session[:name] = params[:name]
    session[:user] = params[:username]
    session[:email] = params[:email]
    session[:password] = params[:password]
    redirect '/login'
  end

  get '/login' do
    @chitter_account = ChitterAccount.sign_up(session[:name], session[:user], session[:email], session[:password])
    erb :login
  end

  run! if app_file == $0
end
