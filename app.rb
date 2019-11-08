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
        email = params[:email]
        result = DbHelper.get_exac(email)
        @current_user = User.convert_to_user(result)
        session[:user] = @current_user
        erb(:home)
    end


    run! if app_file == $0
end 