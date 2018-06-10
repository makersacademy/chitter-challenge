require 'sinatra/base'
require './database_connection_setup'
require './lib/peep.rb'
require './lib/user.rb'
require 'sinatra/flash'

class Chitter < Sinatra::Base
    enable :sessions
    register Sinatra::Flash

    get '/' do
        @peeps = Peep.all.reverse
        erb :index
    end
    
    get '/peeps' do
        @user = User.find(session[:user_id])
        @peeps = Peep.all.reverse
        erb :"peeps/index"
    end

    post '/new' do
        peep = params['content']
        Peep.create(content: peep)
        redirect '/'
    end

    get '/signup' do
        erb :signup
    end
    
    post '/signup' do
        user = User.create(
            display_name: params['display_name'],
            username: params['username'],
            email: params['email'],
            password: params['password']
        )
        session[:user_id] = user.id
        redirect '/peeps'
    end

    get '/login' do
        erb :login
    end

    post '/login' do
        user = User.authenticate(params['email'], params['password'])
        if user
            session[:user_id] = user.id
            redirect('/peeps')
        else
            flash[:notice] = 'Please check your email or password'
            redirect('/login')
        end
    end

    get '/logout' do
        erb :index
        session.clear
        flash[:notice] = "Log back in soon!"
    end
end