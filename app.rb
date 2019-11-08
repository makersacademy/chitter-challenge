require 'sinatra/base'
require './src/DbHelper'
require './src/User'

class Chitter < Sinatra::Base
    enable :sessions

    get '/' do 
        redirect '/login'
    end

    get '/login' do
        erb(:login)
    end

    post '/load_user' do
        session[:user] = User.convert_to_user(DbHelper.get(params[:email]))
        @current_user = session[:user]
        erb(:home)
    end


    run! if app_file == $0
end 