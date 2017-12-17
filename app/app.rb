ENV["RACK_ENV"] ||= "development"

require 'sinatra/base'
require 'data_mapper'
require_relative 'models/peep'
require_relative 'models/user'
require 'date'
require_relative 'models/data_mapper_setup'
require 'bcrypt'

class Chitter < Sinatra::Base
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
  erb :'users/new'
end

post '/users' do
  user = User.create(email: params[:email],
              password: params[:password],
              password_confirmation: params[:password_confirmation])
  session[:user_id] = user.id
  redirect to('/peeps')
end

helpers do
 def current_user
   @current_user ||= User.get(session[:user_id])
 end
end

run! if app_file == $0

end
