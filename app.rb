require 'sinatra/base'
require 'pry'

## classes 
require './lib/user'
require './lib/message'

## datamapper 
require './config/datamapper'


class ChitterApp < Sinatra::Base
    set :sessions, true

    get '/' do 
        @user = User.get(session[:user_id])
        @messages = Message.all
        erb :home
    end

    get '/signup' do 
        erb :signup
    end 

    get '/signin' do 
        erb :signin
    end 

    post '/signup' do 
        user = User.create(email: params[:email], password: params[:password], name: params[:name], username: params[:username])
        #redirect '/error2' unless user.valid?
        if user
            session[:user_id] = user.id
            redirect '/'
        else 
            session[:errors] = 'error'
            redirect '/signup'
        end
    end

    post '/signin' do 
    end

    post '/add_message' do
        Message.create(content: params[:message]) 
        redirect '/'
    end

    get '/logout' do 
        session.clear
        redirect '/'
    end
  
end  