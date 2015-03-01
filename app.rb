require 'sinatra'
require 'data_mapper'
require 'rack-flash'

env = ENV['RACK_ENV'] || 'development'

DataMapper.setup(:default, "postgres://localhost/chitter_#{env}")

require './lib/cheet'
require './lib/user'

DataMapper.finalize
DataMapper.auto_upgrade!

enable :sessions
set :session_secret, 'encryption key'
use Rack::Flash
use Rack::MethodOverride

get '/' do
  @cheets = Cheet.all
  erb :index
end

post '/cheets' do
  content = params["content"]
  Cheet.create(:text => content, :time => Time.now.to_s)
  redirect to('/')
end

get '/users/new' do
  @user = User.new
  erb :"users/new"
end

post '/users' do
  @user = User.new(username: params[:username],
                   password: params[:password],
                   password_confirmation: params[:password_confirmation],
                   name: params[:name],
                   email: params[:email]
                  )
  if @user.save
    session[:user_id] = @user.id
    redirect to ('/')
  else
    flash.now[:errors] = @user.errors.full_messages
    erb :"users/new"
  end

end

get '/sessions/new' do
  erb :"sessions/new"
end

post '/sessions' do
  username, password = params[:username], params[:password]
  user = User.authenticate(username, password)
  if user
    session[:user_id] = user.id
    redirect to('/')
  else
    flash[:errors] = ["The email or password is incorrect"]
    erb :"sessions/new"
  end
end

delete '/sessions' do
  flash[:notice] = "Good bye!"
  session[:user_id] = nil
  redirect to('/')
end

helpers do
  def current_user
    @current_user ||=User.get(session[:user_id]) if session[:user_id]
  end
end