require 'sinatra/base'
require 'pry'

## classes 
require './lib/user'
require './lib/message'
require './lib/comment'
require './lib/comment_message'

## datamapper 
require './config/datamapper'


class ChitterApp < Sinatra::Base
    set :sessions, true

    get '/' do 
        @user = User.get(session[:user_id])
        
        @messages = Message.all
    
        # if theres a user logged on and messages to display
        if @user && @messages
            @script = 'comment_form'
        end
     
        erb :home
    end

    get '/signup' do 
        erb :signup
    end 

    get '/signin' do 
        erb :signin
    end 

    post '/signup' do 
        user = User.first_or_create(email: params[:email], password: params[:password], name: params[:name], username: params[:username])
        #redirect '/error2' unless user.valid?
        if user
            session[:user_id] = user.id
            redirect '/'
        else 
            'error'
            # session[:errors] = 'error'
            # redirect '/signup'
        end
    end

    post '/signin' do 
        
        user = User.authenticate(params[:email], params[:password])
        if user
          session[:user_id] = user.id
          redirect '/'
        else
            p user
            'error'
            # session[:errors] = 'error'
            # redirect '/signin'
        end
    
    end

    post '/add_message' do
        Message.create(content: params[:message]) 

        redirect '/'
    end

    get '/logout' do 
        session.clear
        redirect '/'
    end

    post '/comment' do 
        Comment.create(content: params[comment])
        redirect '/'
    end
  
end  