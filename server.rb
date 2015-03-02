require 'sinatra'
require 'data_mapper'
require './lib/chit'
require './lib/user'



env = ENV['RACK_ENV'] || 'development'

DataMapper.setup(:default, "postgres://localhost/chitter#{env}")

attr_reader :password
attr_accessor :password_confirmation

validates_confirmation_of :password

enable :sessions
set :session_secret, 'super secret'

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
  erb :"users/new"
end

post '/users' do
  user = User.create(:email => params[:email], 
              :password => params[:password]),
              :password_confirmation => params[:password_confirmation])  
  session[:user_id] = user.id
  redirect to('/')
end

helpers do

  def current_user
    @current_user ||=User.get(session[:user_id]) if session[:user_id]
  end

end

