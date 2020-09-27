require 'sinatra/base'
require_relative 'database_env_setup'
require './lib/peep'
require './lib/user'

class Chitter < Sinatra::Base
    enable :sessions
    database_setup

    get '/' do

        erb :index
    end

    get '/peeps/' do
        @user = User.find(session[:user_id])
        @peeps = Peep.show
        erb :peep_list
    end
    
    get '/peeps/:id/add' do
       erb :add_peep
    end

    post '/peeps/add' do
        Peep.add(params[:peep_content])
        UserPeep.add
        redirect '/peeps'
    end

    get '/users/new' do
        erb :signup
    end

    post '/users' do
        user = User.create(params[:username],params[:email],params[:password])
        session[:user_id] = user.id
        redirect '/peeps/'
    end 

    get '/sessions/new'
        erb :login
    end


    run! if app_file == $0
end