ENV["RACK_ENV"] ||= "development"
require 'sinatra/flash'
require 'sinatra/base'
require 'data_mapper'
require 'date'
require 'bcrypt'

require_relative 'models/peep'
require_relative 'models/user'
require_relative 'models/data_mapper_setup'

class Chitter < Sinatra::Base
  register Sinatra::Flash
  enable :sessions
  set :session_secret, 'super super secret'

  get '/' do
    "hello"
  end


get '/peeps' do
  @peeps = Peep.all.reverse
  erb :'peeps/index'
end

get '/peeps/new' do
  erb :'peeps/new'
end

post '/peeps' do
  Peep.create(msg: params[:msg], time_stamp: Time.new)
  redirect '/peeps'
end

get '/users/new' do
  @user = User.new
  erb :'users/new'
end

post '/users' do
  @user = User.new(email: params[:email],
              password: params[:password],
              password_confirmation: params[:password_confirmation])
  if @user.save
  session[:user_id] = @user.id
  redirect to('/peeps')
  else
    flash.now[:notice] = "Password and confirmation password do not match"
    erb :'users/new'
  end
end

helpers do
 def current_user
   @current_user ||= User.get(session[:user_id])
 end
end

run! if app_file == $0

end
