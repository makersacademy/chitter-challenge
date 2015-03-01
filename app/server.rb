require 'data_mapper'
require 'sinatra'
require 'rack-flash'


env = ENV['RACK_ENV'] || 'development'
DataMapper.setup(:default, "postgres://localhost/chitter_challenge_#{env}")

require_relative 'models/peep'
require_relative 'models/user'
require_relative './views/helpers/application'

enable :sessions
set :session_secret, 'super secret'
use Rack::Flash
# use Rack::MethodOverride

DataMapper.finalize
DataMapper.auto_upgrade!

get '/' do 
  @peeps = Peep.all
  erb :index
  end

  post '/peeps' do
  text = params["text"]
  Peep.create(:text => text)
  redirect to('/')
end

get '/users/new' do
  @user = User.new
  erb :"users/new"
end

post '/users' do
  @user = User.new(:email => params[:email], 
              :password => params[:password],
              :password_confirmation => params[:password_confirmation])  
  if @user.save
    session[:user_id] = @user.id
    redirect to('/')
  else
    flash.now[:errors] = @user.errors.full_messages
    erb :"users/new"
  end
end

get '/sessions/new' do
  erb :"sessions/new"
end

post '/sessions' do
  email, password = params[:email], params[:password]
  user = User.authenticate(email, password)
  if user
    session[:user_id] = user.id
    redirect to('/')
  else
    flash[:errors] = ["The email or password are incorrect"]
    erb :"sessions/new"
  end
end

delete '/sessions' do
  flash[:notice] = "Good bye!"
  session[:user_id] = nil
  redirect to('/')
end













