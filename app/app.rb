ENV["RACK_ENV"] ||= "development"

require 'sinatra/base'
require 'sinatra/flash'
require_relative '../data_mapper_setup'
require_relative "./models/user.rb"


class Chitter < Sinatra::Base
	register Sinatra::Flash
  enable :sessions
  set :session_secret, 'super secret'


  get '/' do
  	redirect "users/new"
  end

	get '/sessions/new' do
    erb :'sessions/new'
  end

  post '/sessions' do
    user = User.authenticate(params[:email], params[:password])
    if user
      session[:user_id] = user.id
      redirect to('/homepage')
    else
      flash.now[:errors] = ['The email or password is incorrect']
      erb :'sessions/new'
    end
  end

  get "/users/new" do
  	@user = User.new
  	erb :"users/new"
  end

  post '/users/new' do
    @user = User.create(name: params[:name],
    email: params[:email],
    user_name: params[:user_name], 
    password: params[:password], 
    password_confirmation: params[:passwordconf])
    if @user.save
      session[:user_id] = @user.id
      redirect "/homepage"
    else
      flash.now[:errors] = @user.errors.full_messages
      erb :"users/new"
    end
  end

  get "/homepage" do
  	@peeps = Peep.all
  	erb :homepage
	end


  # start the server if ruby file executed directly
  run! if app_file == $0
end
