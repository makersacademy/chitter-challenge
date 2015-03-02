require 'sinatra'
require 'data_mapper'
require 'rack-flash'
require './lib/chit'
require './lib/user'
require './helpers/application'

enable :sessions
set :session_secret, 'super secret'
use Rack::Flash

env = ENV['RACK_ENV'] || 'development'

DataMapper.setup(:default, "postgres://localhost/chitter#{env}")


DataMapper.finalize 

DataMapper.auto_upgrade!


get '/' do
  @chit = Chit.all
  erb :index
end

post '/chits' do
  username = params["username"]
  text = params["text"]
  Chit.create(:username => username, :text => text)
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
    flash[:notice] = "Sorry, your passwords don't match"
    erb :"users/new"
  end
end