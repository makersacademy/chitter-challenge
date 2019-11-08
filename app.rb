require 'sinatra/base'
require './lib/user'

class Chitter < Sinatra::Base

    enable :sessions
    
    get '/' do 
        session[:user] ? redirect('/home') : redirect('/login')
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
        User.create(params[:email], params[:password])
        redirect('/signup/success')
    end

    get '/signup/success' do
        erb(:success)
    end

    get '/home' do 
        redirect('/login') if !session[:user]
        @user = session[:user]
        erb(:home)
    end
end