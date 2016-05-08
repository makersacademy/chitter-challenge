ENV["RACK_ENV"] ||= "development"
require 'sinatra'
#require 'sinatra/base'
require_relative 'models/peep'
require_relative 'models/user'

class Chitter < Sinatra::Base

enable :sessions
set :session_secret, 'super secret'

  helpers do
 def current_user
   @current_user ||= User.get(session[:user_id])
 end
end

  get '/' do
    'hello!, sign up to chitter!'
  end

  get '/peeps' do
    @peeps = Peep.all
    erb :'peeps/index'
  end

  get '/new' do
  erb :'peeps/new'
end

post '/new' do
  Peep.create(content: params[:content], created_at: Time.now,)
  redirect to('/peeps')
end

get '/users/new' do
  erb :'users/new'
end

post '/users' do
  @user = User.create(
    name: params[:name],
    uname: params[:uname],
    email: params[:email],
    password: params[:password],
    password_confirmation: params[:password_confirmation]
  )
session[:user_id] = user.id
  redirect to('/peeps')
end
  run! if app_file == $0
end