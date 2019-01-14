require 'sinatra/base'
require 'pry'

## classes/tables 
require './lib/user'
require './lib/message'
require './lib/comment'
require './lib/comment_message'
require './lib/messaging'


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
        message = Message.create(content:  message_content)
        user = User.get(session[:user_id])
        message.users << user
        message.save

        names =  UsersMentioned.find_names(message_content)
        #----------this should be in amodule but error at the mo.
        names.each do|name|
            user = User.first(:username => name)
            if user
                # error right now p'ing out so cant see has name 
                p Email.send_message(user)
            end
        end
        # -------- shouldnt be here
       redirect '/'
    end

    get '/logout' do 
        session.clear
        redirect '/'
    end

    post '/comment' do 
        messageId = params[:message_id].to_i
        comment = Comment.create(content: params[:comment])
        message = Message.get(messageId)
        message.comments << comment
        message.save
        redirect '/'
    end
end  