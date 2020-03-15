require 'sinatra/activerecord'
require 'sinatra/base'
require_relative './models/user'
require_relative './models/peep'

class Chitter < Sinatra::Base
    enable :sessions
    get '/users/new' do 
        erb :'users/new'
    end

    post '/users' do
        session[:user] = User.create(username: params["username"], name: params["name"], email: params["email"])
        @user = session[:user]
        erb :'users/user'
    end
    get '/peeps/new' do
        erb :'peeps/new'
    end
    post '/peeps' do
        @peep = Peep.create(content: params["content"], user_id: session[:user].id, created: Time.now)
        redirect '/peeps'
    end
    get '/peeps' do
        @peeps = Peep.all  # sort this
        erb :'peeps/list'
    end

end