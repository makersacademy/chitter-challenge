require 'sinatra/base'

class Chitter < Sinatra::Base

    enable :sessions
    
    get '/' do 
        session[:login] == true ? redirect('/home') : redirect('/login')
    end

    get '/login' do 
        erb(:login)
    end

    post '/login' do
        user = User.find(params[:email], params[:password]) 
        user.length == 1 ? session[:user] = user.first : redirect('/login')
        redirect('/home')
    end

    get '/signup' do 
        erb(:signup)
    end

    post '/signup' do 
        #Need to complete
    end

    get '/home' do 
        @user = session[:user]
        erb(:home)
    end
end