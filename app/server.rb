require 'sinatra'
require 'data_mapper'
require 'rack-flash'

require_relative 'data_mapper_setup'

require './app/models/user'
require './app/models/peep'

enable :sessions
set :session_secret, 'super secret'
use Rack::Flash

helpers do

  def register_user
    @registered_user ||= User.get(session[:id]) if session[:id]
  end

end

get '/' do
  @all_peeps = Peep.all
  @all_peeps.reverse!
  @all_users = User.all
  erb :index
end

get '/signup' do
  @user = User.new
  erb :signup
end

post '/signup' do
  @user = User.create(email: params[:email],
              password: params[:password],
              password_confirmation: params[:password_confirmation],
              name: params[:name],
              username: params[:username])
  if @user.save
    session[:id] = @user.id
    redirect '/'
  else
    flash.now[:notice] = @user.errors.full_messages
    erb :signup
  end
end

post '/login' do
  username = params[:username]
  password = params[:password]
  user = User.authenticate(username, password)
  if user
    session[:id] = user.id
    redirect to '/main'
  else
    flash[:notice] = 'The username or password was incorrect'
    redirect to '/'
  end
end

get '/main' do
  id = session[:id]
  user = User.get(id)
  @name = user.name
  @all_peeps = Peep.all
  @all_peeps.reverse!
  @all_users = User.all
  erb :mainpage
end

post '/main' do
  id = session[:id]
  time = Time.now
  user = User.get(id)
  @name = user.name
  message = params[:message]
  session[:peep] = message
  Peep.create(message: message,
              time: time,
              user_id: id)
  @all_peeps = Peep.all
  @all_peeps.reverse!
  @all_users = User.all
  erb :mainpage
end

get '/main/private' do
  @name = params[:makers]
  erb :private_peep
end

post '/main/private' do
  id = session[:id]
  time = Time.now
  user = User.get(id)
  @sender = user.name
  message = params[:message]
  @receiver = params[:receiver]
  session[:peep] = message
  Peep.create(message: message,
              time: time,
              user_id: id,
              personal_message_to: @receiver)
  @all_peeps = Peep.all(personal_message_to: @receiver)
  @all_peeps.reverse!
  erb :private_peep
end

delete '/session' do
  flash[:notice] = 'Goodbye!'
  session[:id] = nil
  redirect to '/'
end