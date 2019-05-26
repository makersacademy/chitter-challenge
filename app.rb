require 'sinatra/base'

class Chitter < Sinatra::Base
  enable :sessions

  get '/chitter' do
    erb :chitter
  end

  post '/chitter' do
    session[:email] = params[:email]
    session[:password] = params[:password]
    session[:name] = params[:name]
    session[:username] = params[:username]
    redirect :signin
  end
end
