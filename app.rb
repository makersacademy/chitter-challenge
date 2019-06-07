require 'sinatra/base'
require './lib/username'

class ChitterManager < Sinatra::Base

  enable :sessions

  get '/' do
    erb :index
  end

  get '/sign_up' do
    erb :sign_up
  end

  post '/sign_up/username' do
    Username.create(params[:username])
    session[:user] = params[:username]
    redirect '/peeps'
  end

  get '/peeps' do
    @user = session[:user]
    erb :peeps
  end
end
