require 'sinatra/base'

class Chitter < Sinatra::Base
  enable :sessions

  get '/' do
    redirect '/login'
  end

  get '/login' do
    erb :login
  end

  post '/username' do
    session[:username] = params[:username]
    redirect '/feed'
  end

  get '/feed' do
    @username = session[:username]
    erb :feed
  end
end
