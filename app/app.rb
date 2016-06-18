ENV["RACK_ENV"] ||= "development"

require 'sinatra/base'
require 'sinatra/flash'
require_relative 'Data_mapper_setup'
require_relative 'models/peep'
require_relative 'models/user'


class Chitter < Sinatra::Base
  enable :sessions
  set :session_secret, 'super secret'
  register Sinatra::Flash


  get '/' do
  	"Hello!"
  end

  get '/peeps' do
  	@peeps = Peep.all
  	erb :'peeps/index'
  end

  get '/peeps/new' do
  	erb :'peeps/new'
  end

  post '/peeps' do
  	peep = Peep.create(peep: params[:peep])
  	peep.save
  	redirect '/peeps'
  end

  get '/users/new' do
  	@user = User.new
  	erb :'users/new'
  end

  post '/users' do
  	@user = User.new(name: params[:name],
  				handle: params[:handle],
  				email: params[:email],
  				password: params[:password],
  				password_confirmation: params[:password_confirmation])
  	if @user.save
  	  session[:user_id] = @user.id
  	  redirect '/peeps'
  	else
  	  flash.now[:notice] = "Password and confirmation password do not match"	
  	  erb :'users/new'
  	end
  end

  helpers do
  	def current_user
  	  @current_user ||= User.get(session[:user_id])
  	end
  end

  run! if app_file == $0
end