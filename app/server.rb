require 'data_mapper'
require 'sinatra'
require 'rack-flash'
require 'sinatra/partial'

require_relative 'models/blabbs'
require_relative 'models/user'
require_relative 'helpers/application'
require_relative 'data_mapper_setup'

enable :sessions
set :session_secret, 'super secret'
use Rack::Flash
use Rack::MethodOverride
# set :public_dir proc { File.join(root, 'public') }
set :public_folder, 'public'

get '/' do
  @blabbs = Blabbs.all
  erb :index
end

post '/blabbs' do
  message = params['message']
  Blabbs.create(message: message)
  redirect to('/')
end

get '/users/new' do
  @user = User.new
  erb :'users/new'
end

post '/users' do
  @user = User.new(name: params[:name],
                   username: params[:username],
                   email: params[:email],
                   password: params[:password],
                   password_confirmation: params[:password_confirmation])
  if @user.save
    session[:user_id] = @user.id
    redirect to('/')
  else
    flash[:notice] = 'Sorry, your passwords do not match'
    erb :'users/new'
  end
end
