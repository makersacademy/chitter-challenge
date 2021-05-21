require 'sinatra/base'
require 'sinatra/reloader'

class Chitter < Sinatra::Base
  configure :development do 
    register Sinatra::Reloader
  end

  get '/' do 
    erb :index
  end

  post '/sign_up' do 
    @name = params[:name]
    @email = params[:email]
    @user_name = params[:user_name]
    @password = params[:password]
    erb :homepage
  end

  run! if app_file == $0
end
