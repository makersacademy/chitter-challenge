ENV["RACK_ENV"] ||= "development"

require 'sinatra/base'
require_relative 'Data_mapper_setup'
require_relative 'models/peep'
require_relative 'models/user'


class Chitter < Sinatra::Base
  enable :sessions
  set :session_secret, 'super secret'


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
  	erb :'users/new'
  end

  post '/users' do
  	user = User.create(name: params[:name],
  				handle: params[:handle],
  				email: params[:email],
  				password: params[:password])
  	session[:user_id] = user.id
  	redirect to('/peeps')
  end

  helpers do
  	def current_user
  	  @current_user ||= User.get(session[:user_id])
  	end
  end

  run! if app_file == $0
end