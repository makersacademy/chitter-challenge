require 'sinatra'
require 'data_mapper'
require 'rack-flash'
require './app/models/peep'
require './app/models/user'
require './app/data_mapper_setup'

enable :sessions
set :session_secret, 'super secret'

use Rack::MethodOverride
use Rack::Flash


helpers do

  def current_user
    @current_user ||=User.get(session[:user_id]) if session[:user_id]
  end

end

get '/' do
  @peeps = Peep.all
  erb :index
end

post '/peeps' do
  content = params["content"]
  author = params["author"]
  datetime = DateTime.now
  Peep.create(:content => content, :author => author, :created_at => datetime)
  redirect to ('/')
end

get '/users/new' do
   @user = User.new
  erb :"users/new"
end

post '/users' do
  @user = User.create(:username => params[:username],
                    :email => params[:email],
                    :password => params[:password],
                    :password_confirmation => params[:password_confirmation])
  if @user.save
    session[:user_id] = @user.id
    redirect to('/')
  else
    flash[:errors] = @user.errors.full_messages
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
    flash[:errors] = ["The email or password is incorrect"]
    erb :"sessions/new"
  end
end

delete '/sessions' do
      flash[:notice] = "Good bye!"
      session[:user_id] = nil
      erb :"sessions/new"
  end








