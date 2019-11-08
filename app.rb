require 'sinatra/base'
require './lib/chitter'

class ChitterApp < Sinatra::Base
    
    get '/' do
        erb :index
    end

    get '/users' do
        @users = Chitter.return_users
        erb :'/users/users-names'
    end

    get '/messages' do
        @messages = Messages.return_messages
        erb :'/messages/messages'
    end

    get '/users/new' do
        erb :'/users/new'
    end

    post '/users' do
        Chitter.create_user(name: params[:name], username: params[:username], email: params[:email], password: params[:password])
        redirect '/users'
    end
    
    run! if app_file == $0
end