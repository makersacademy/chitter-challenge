require 'sinatra/base'
require_relative 'database_env_setup'
require './lib/peep'
require './lib/user'
require './lib/user_peep'
require 'sinatra/flash'

class Chitter < Sinatra::Base
    enable :sessions
    database_setup
    register Sinatra::Flash

    get '/' do

        erb :index
    end

    get '/peeps' do
        @user = User.find(session[:user_id])
        @info = UserPeep.show
        erb :peep_list
    end
    
    get '/peeps/:id/add' do
       erb :add_peep
    end

    post '/peeps/add' do
        peep = Peep.add(params[:peep_content])
        UserPeep.add(session[:user_id], peep.id )
        redirect '/peeps'
    end

    #Signup
    get '/users/new' do
        erb :signup
    end

    post '/users' do
        user = User.create(params[:username],params[:email],params[:password])
        session[:user_id] = user.id
        redirect '/peeps'
    end 

    #Login 
    get '/sessions/new' do
        erb :login
    end

    post '/sessions' do
        user = User.authenticate(params[:email],params[:password])
        if user 
            session[:user_id] = user.id
            redirect '/peeps'
        else
            flash[:notice] = 'Incorrect email or password'
            redirect '/sessions/new'
        end
    end




    run! if app_file == $0
end