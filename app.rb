require 'sinatra/base'
require 'pg'
require_relative './database_connection_setup'
require_relative './lib/user'
require_relative './lib/message'


class Chitter < Sinatra::Base

    get '/' do
        @user = User.current
        @messages = Message.all
        erb :index  
    end

    get '/register' do
        erb :register
    end
    
    post '/register' do
        User.create(user_id: params[:user_id], name: params[:name], email: params[:email], password: params[:password])

        redirect('/')
    end

    get '/message' do
        erb :message
    end

    post '/message' do
        user = User.current
        Message.create(user_id: user.user_id, time: Time.now, content: params[:message])

        redirect('/')
    end

end