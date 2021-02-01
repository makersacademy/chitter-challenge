require 'sinatra'
require_relative './lib/chitter'
require_relative './lib/user'

class ChitterApp < Sinatra::Base

    enable :sessions

    get '/test' do 
        "Hello chitter"
    end

    get '/home' do 
        @chitters = Chitter.timeline
        @user = User.find(session[:user_id])
        erb :homepage 
    end

    get '/post' do 
        erb :post
    end

    post '/post_peep' do
        Chitter.post_peep(peep: params[:peep], userid: session[:user_id])
        redirect '/home'
    end

    get '/sign-up' do
        erb :sign_up
    end

    post '/signed_up' do
        user = User.create(email: params[:email], password: params[:password], name: params[:name], username: params[:username])
        session[:user_id] = user.userid 
        redirect '/home'
    end

    run! if app_file == $0 
end