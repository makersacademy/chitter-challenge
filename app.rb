ENV["RACK_ENV"] ||= "development"

require 'sinatra/base'
require 'sinatra/flash'
require './lib/user'
require './lib/peep'
require './data_mapper_setup'

class Chitter < Sinatra::Base
  use Rack::MethodOverride
  enable :sessions
  register Sinatra::Flash

  get '/' do
    erb :homepage
  end

  get '/sign-up' do
  	erb :'sign-up'
  end

  post '/sign-up' do
  	user = User.new(name: params[:name], user_name: params[:user_name],
      email: params[:email], password: params[:password], password_confirmation: params[:password_confirmation])
    if user.save
      session[:user_id] = user.id
      redirect to('/chitter-feed')
    else
      flash.now[:error] = user.errors.full_messages
      erb(:'sign-up')
    end

  end

  helpers do
    def current_user
      @current_user ||= User.get(session[:user_id])
    end

    def find_user_name(user_id)
    	User.get(user_id).user_name
    end
  end

  get '/chitter-feed' do
  	@posts = Peep.all.reverse
  	erb :'chitter-feed'
  end

  post '/create-peep' do
  	Peep.create(post: params[:post], time: Time.now.strftime("%Y-%m-%d %H:%M"), user_id: session[:user_id])
  	redirect '/chitter-feed'
  end

  delete '/sessions' do
  	session[:user_id] = nil
  	flash.keep[:notice] = 'Goodbye'
  	redirect to '/'
  end

  get '/log-in' do
  	erb :'log-in'
  end

  post '/log-in' do
  	user = User.first(email: params[:email])
		if user.nil?
      flash.now[:error] = ["User does not exist"]
      erb :"log-in"
    elsif user.authenticate(params[:password])
    	session[:user_id] = user.id
      redirect to('/chitter-feed')
    else
      flash.now[:error] = ["Incorrect password"]
      erb(:"log-in")
    end
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
