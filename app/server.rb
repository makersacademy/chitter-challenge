require 'sinatra'
require 'data_mapper'

env = ENV['RACK_ENV'] || 'development'

DataMapper.setup(:default, "postgres://localhost/5hitter_#{env}")

require './app/models/sheet'
require './app/models/user'

DataMapper.finalize
DataMapper.auto_upgrade!

enable :sessions
set :session_secret, 'super secret'

get '/' do
  @sheets = Sheet.all#(:order => :created_at.desc)
  erb :index
end

get '/users/new' do
  erb :'users/new'
end

post '/users' do
  user = User.create(:name => params[:name],
              :email => params[:email],
              :username => params[:username],
              :password => params[:password])
  session[:user_id] = user.id
  redirect to('/')
end

helpers do

  def current_user
    @current_user ||=User.get(session[:user_id]) if session[:user_id]   
  end

end