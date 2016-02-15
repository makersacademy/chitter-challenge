config.assets.initialize_on_precompile = false
#ENV["RACK_ENV"] ||= "development"
require 'sinatra/base'
require 'rubygems'
require 'data_mapper'
require_relative 'models/user'
require_relative 'models/peep'
require 'tilt/erb'
require 'sinatra/flash'
require_relative 'data_mapper_setup.rb'



class Chitter < Sinatra::Base
    use Rack::MethodOverride
	enable :sessions
    register Sinatra::Flash
	set :session_secret, 'super secret'
    get '/' do 
        redirect('/user/new')
    end

    get '/user/new' do 
        @peep = Peep.all
    	erb :'links/signup'
    end

    post '/users' do 
       	@user = User.create(name: params[:name], mail: params[:mailup], password: params[:passwordup], password_confirmation: params[:password_confirmation]) 
        if @user.save
            session[:username] = @user.name
    	   redirect('/welcome')
        else 
            flash.now[:erros] = ['The email or password is incorrect']
            erb :'links/log-in'
        end

    end

    get '/welcome' do 
    	@current_user = session[:username]
    	erb :'links/index'
    end

    get '/sessions/log-in' do 
        erb :'links/log-in'
    end

    get '/mywall' do 
        @peep = Peep.all
        erb :'links/thewall'
    end

    post'/wall' do 
        time = Time.now.to_s[0,20]
        Peep.create(name: session[:username], peep: params[:peep], time: time)
        redirect to('/mywall')
    end

    post '/sessions' do 
        user = User.authenticate(params[:mail], params[:password])
        if user
            session[:username] = user.name 
            redirect to('/welcome')
        else
            flash.now[:erros] = ['The email or password is incorrect']
            erb :'links/log-in'
        end
    end

    delete '/log-out' do 
        session[:username] = nil
        flash.keep[:notice] = 'See you sOon!'
        redirect('/welcome')
    end
run! if app_file == $0
end