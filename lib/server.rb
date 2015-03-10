require 'data_mapper'
require 'sinatra'
require './lib/helpers/application'
require 'rack-flash'

require_relative 'user'
require_relative 'peep'

use Rack::Flash
env = ENV['RACK_ENV'] || 'development'

# DataMapper::Logger.new($stdout, :debug)
DataMapper.setup(:default, "postgres://localhost/chitter_challenge_#{env}")

require './lib/user'
DataMapper.finalize
# DataMapper.auto_migrate!
DataMapper.auto_upgrade!

enable :sessions
set :session_secret, 'super secret'

get '/' do
  @peeps = Peep.all
  erb :index
end

post '/peeps' do
  message = params["message"]
  Peep.create(:message => message)
  redirect to('/')
end

get '/users/new' do
  @user = User.new
  erb :'/users/new'
end

post '/users' do
  puts params[:password]
  @user = User.create(:name => params[:name],
                   :user_name => params[:user_name],
                   :email => params[:email],
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



get '/signup' do
  erb :signup
end

get '/signout' do
  erb :index
end

get '/sessions/new' do
  erb :"sessions/new"
end


post '/sessions' do
  email, password = params[:email], params[:password]
  user = User.authenticate(email, password)
  if user
    session[:user_id] = user.id
    redirect to ('/')
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















