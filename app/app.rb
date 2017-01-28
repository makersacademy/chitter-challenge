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
    
    get '/peeps' do
        erb(:peeps)
    end
    
    # start the server if ruby file executed directly
    run! if app_file == $0
end