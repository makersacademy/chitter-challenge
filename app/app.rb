ENV["RACK_ENV"] ||= "development"

require 'sinatra/base'
require 'sinatra/flash'
require 'tilt/erb'
require_relative 'data_mapper_setup'

class Chitter < Sinatra::Base
    use Rack::MethodOverride
    
    enable :sessions
    set :session_secret, 'super secret'
    
    register Sinatra::Flash
    
    helpers do
        def current_user
            @current_user ||= User.get(session[:user_id])
        end
    end
    
    get '/' do
       redirect '/users/new' 
    end
    
    get '/users/new' do
        @user = User.new
        erb :'users/new'
    end
    
    post '/users' do
        @user = User.create(email: params[:email],
                    name: params[:name],
                    user_name: params[:user_name],
                    password: params[:password],
                    password_confirmation: params[:password_confirmation])
        if @user.save
            session[:user_id] = @user.id
            redirect '/peeps'
        else
            flash.now[:errors] = @user.errors.full_messages
            erb :'users/new'
        end
    end
    
    get '/sessions/new' do
        erb:'sessions/new'
    end
    
    post '/sessions' do
        user = User.authenticate(params[:email], params[:password])
        if user
            session[:user_id] = user.id
            redirect '/peeps'
        else
            flash.now[:errors] = ["The email or password is incorrect"]
            erb :'sessions/new'
        end
    end
    
    delete '/sessions' do
        session[:user_id] = nil
        flash.keep[:notice] = 'Peep you later!'
        redirect to '/peeps'
    end
    
    get '/peeps' do
        @peeps ||= Peep.reverse_chronological
        erb(:peeps)
    end
    
    post '/peeps' do
        peep = Peep.create(body: params[:peep])
        current_user.peeps << peep
        current_user.save
        if peep.save
            flash.keep[:notice] = "Peep... away!"
        end
        redirect '/peeps'
    end
    
    # start the server if ruby file executed directly
    run! if app_file == $0
end
