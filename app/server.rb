require 'sinatra'
require 'data_mapper'
require 'rack-flash'

env = ENV['RACK_ENV'] || 'development'

DataMapper.setup(:default, "postgres://localhost/5hitter_#{env}")

require './app/models/sheet'
require './app/models/user'

DataMapper.finalize
DataMapper.auto_upgrade!

enable :sessions
set :session_secret, 'super secret'
use Rack::Flash
use Rack::MethodOverride

set :public_folder, Proc.new { File.join(root, '..', "public") }

get '/' do
  @sheets = Sheet.all#(:order => :created_at.desc)
  erb :index
end

get '/users/new' do
  @user = User.new
  erb :'users/new'
end

post '/users' do
  @user = User.create(:name => params[:name],
                      :email => params[:email],
                      :username => params[:username],
                      :password => params[:password],
                      :password_confirmation => params[:password_confirmation])
  if @user.save
    session[:user_id] = @user.id
    redirect to('/')
  else
    flash.now[:errors] = @user.errors.full_messages
    erb :'users/new'
  end
end

get '/sessions/new' do
  erb :'sessions/new'
end

post '/sessions' do
  username, password = params[:username], params[:password]
  user = User.authenticate(username, password)
  if user
    session[:user_id] = user.id
    redirect to('/')
  else
    flash[:errors] = ['The username or password is incorrect']
    erb :'sessions/new'
  end
end

delete '/sessions' do
  flash[:notice] = 'Good bye!'
  session[:user_id] = nil
  redirect to('/')
end

post '/sheets/new' do
  erb :'sheets/new'
end

post '/sheet' do
   Sheet.create(:text => params[:sheet],
                :user_id => session[:user_id])
   redirect to('/')
end

post '/user/profile' do
  @sheets = Sheet.all(:user_id => session[:user_id])
  erb :'users/profile'
end

helpers do

  def current_user
    @current_user ||=User.get(session[:user_id]) if session[:user_id]   
  end

end