require 'sinatra/base'
require "./lib/users"
require "./lib/message"

class Chitter < Sinatra::Base
    get '/' do
        erb(:index)
    end

    get '/addmessage' do
        @message = Messages.list
        Messages.create(message: params[:message])
        redirect('/')
    end

    get '/register' do
        Users.create(name: params[:name], username: params[:username], email: params[:email], password: params[:password])
        redirect('/')
    end

    post 'login' do
        #TODO:
    end
    run! if app_file == $0
end