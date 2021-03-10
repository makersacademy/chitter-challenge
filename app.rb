require 'sinatra/base'
require 'pg'
require_relative './lib/peep'
require_relative './lib/user'
class Chitter < Sinatra::Base
    enable :sessions

    get '/' do
        @peeps = Peep.all
        erb :home
    end

    get '/new' do
        erb :new
    end

    post '/' do
        Peep.add(id: params[:id], body: params[:body], time: params[:time])
        redirect '/'
    end

    get '/signup' do
        erb :signup
    end

    post '/newusers' do
        User.newuser(id: params[:id], name: params[:name], email: params[:email], username: params[:username], password: params[:password])
        redirect '/'
    end

    post '/login_details' do
        if User.check_password(login_email: params[:login_email], login_password: params[:login_password])
            print "IN HERE"
            session[:user] = User.find(email: params[:login_email])
            redirect '/'
        else
            print params
        end
    end
end
