require 'sinatra/base'
require 'pg'
require_relative './database_connection_setup'
require_relative './lib/user'

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

end