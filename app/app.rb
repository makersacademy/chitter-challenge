ENV['RACK_ENV'] ||= 'development'

require_relative './models/data_mapper_setup'
require 'sinatra/base'
require 'sinatra/flash'

class Chitter < Sinatra::Base
register Sinatra::Flash
enable :sessions
set :session_secret, 'super secret'
set :public_folder, Proc.new { File.join(root, "public") }


    get '/' do
        erb :home
    end

    get '/sign_up' do
        erb :sign_up
    end

    post '/sign_up' do
        if @user = User.create(email: params[:email], password: params[:password], 
          username: params[:username], password_confirmation: params[:password], name: params[:name])
        @user.save 
        session[:user_id] = @user.id
        redirect '/peeps'
      else
        flash.now[:notice] = "Please enter details for all fields"
        erb :sign_up
        end
    end

    get '/log_in' do
        erb :log_in
    end

    post '/log_in' do
    	if user = User.authenticate(params[:email],params[:password])
        session[:user_id] = user.id
        redirect '/peeps'
        else
        flash.now[:error] = "Incorrect credentials"
        erb :log_in
        end
    end

    get '/sessions' do
        session[:user_id] = nil
        flash.keep[:notice] = "goodbye!"
        redirect to '/peeps'
    end

    get '/peep' do
        erb :peep
    end

    post  '/peep' do
        @peep = Peep.create(content: params[:content], created_at: Time.now, user: current_user)
        @peep.save
        redirect ('/peeps')
    end


    get '/peeps' do
        @peeps = Peep.all(:order => [:created_at.desc])
    	erb :peeps
    end

    helpers do
        def current_user
          @current_user ||= User.get(session[:user_id])
        end
    end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
