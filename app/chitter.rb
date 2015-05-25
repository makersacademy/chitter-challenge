require 'sinatra'
require 'data_mapper'
require 'byebug'
require_relative 'models/user'
require_relative 'models/peep'

env = ENV['RACK_ENV'] || 'development'

enable :sessions
set :session_secret, 'super secret'

DataMapper.setup(:default, "postgres://localhost/chitter_users_#{env}")

require_relative 'models/user'

DataMapper.finalize
DataMapper.auto_upgrade!

get '/' do
  @peeps = Peep.all
  erb :index
end

post '/peeps' do
  input = params[:text]
  Peep.create(text: input)
  redirect to('/')
end

get '/users/new' do
  erb :'/users/new'
end

post '/users' do
  user = User.create(username: params[:username],
              name: params[:name],
              email: params[:email],
              password: params[:password])
  session[:user_id] = user.id
  redirect to('/')
end

helpers do
  def current_user
    @current_user ||= User.get(session[:user_id]) if session[:user_id]
  end
end