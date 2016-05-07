ENV['RACK_ENV'] ||= 'development'

require 'sinatra/base'
require_relative './models/peep'
require_relative './models/user'
require 'sinatra/flash'
require 'sinatra/partial'
require_relative 'data_mapper_setup'

class Chitter < Sinatra::Base
  enable :sessions
  set :session_secret, 'super secret'

  register Sinatra::Flash
  register Sinatra::Partial
  
  set :partial_template_engine, :erb
  enable :partial_underscores

  helpers do
	 def current_user
	   @current_user ||= User.get(session[:user_id])
	 end
	end

  get '/' do
    'Hello world!'
  end

  get '/peeps' do
  	@peeps = Peep.all.reverse
  	erb :'peeps/index'
  end

  get '/peeps/new' do
  	erb :'peeps/new'
  end

  post '/peeps' do
  	Peep.create(content: params[:content], time: Time.now)
  	redirect '/peeps'
  end

  post '/users' do
    @user = User.new(name: params[:name], username: params[:username], email: params[:email], 
    	password: params[:password], password_confirmation: params[:password_confirmation])
    if @user.save
      session[:user_id] = @user.id
      redirect '/peeps'
    else
      erb :'users/new'
    end
  end

  get '/users/new' do
    @user = User.new
    erb :'/users/new'
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end