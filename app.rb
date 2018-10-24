require 'sinatra/base'

class Chitter < Sinatra::Base
  enable :sessions

  get '/' do
    erb :index
  end

  post '/sign_up' do
    session[:name] = params[:name]
    session[:username] = params[:username]
    session[:email] = params[:email]
    session[:password] = params[:password]
    redirect "/#{params[:username]}"
  end

  get '/:username' do
    @name = session[:name]
    @username = session[:username]
    erb :profile
  end

end
