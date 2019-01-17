require 'sinatra/base'
require 'pry'

## classes/tables 
require './lib/user'
require './lib/message'
require './lib/comment'

## modules 
require './lib/email'
require './lib/user_mentioned'
## datamapper 
require './config/datamapper'


class ChitterApp < Sinatra::Base
    set :sessions, true

    get '/' do 
        @user = User.get(session[:user_id])
        @messages = Message.all
        @comments = Comment.all
    
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
        redirect '/' unless user.valid?
        if user
            session[:user_id] = user.id
            redirect '/'
        else 
            redirect '/signup'
        end
    end

    post '/signin' do 
        
        user = User.authenticate(params[:email], params[:password])
        if user
          session[:user_id] = user.id
          redirect '/'
        else
          redirect '/signin'
        end
    
    end

    post '/add_message' do
        message_content = params[:message]
        message = Message.create(content:message_content, user_id:session[:user_id])
        names = message.mentions(message_content, User)
       redirect '/'
    end

    get '/logout' do 
        session.clear
        redirect '/'
    end

    get '/comment_on/:id' do 
        session[:message_id] = params[:id] 
        redirect '/'
    end

    post '/add_comment' do 
        comment_content = params[:comment]
        message = Message.get(session[:message_id].to_i)
        user = User.get(session[:user_id].to_i)
        comment = Comment.create(content:comment_content, user_id:user.id, message_id:message.id)
        redirect '/'
    end
end  