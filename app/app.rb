ENV['RACK_ENV'] ||= 'development'

require 'sinatra/base'
require 'dm-postgres-adapter'
require_relative './datamapper_setup'
require_relative './models/peep.rb'
require_relative './models/user.rb'

class Chitter < Sinatra::Base

enable :sessions
set :session_secret, 'secret'

get '/' do
  erb(:index)
end

get '/users/new' do
  erb(:user)
end

post '/users' do
  user = User.create(name: params[:name], email: params[:email], username: params[:username], password: params[:password])
  session[:user_id] = user.id
  p user
  redirect to '/peeps'
end

post '/users/sign-in' do
  user = User.first(email: params[:email], password: params[:password])
  session[:user_id] = user.id
end

get '/newpeep' do
  erb(:newpeep)
end

post '/peeps' do
  Peep.create(text: params[:text], time_stamp: Time.now)
  redirect to '/peeps'
end


get '/peeps' do
  @peeps = Peep.all(:order => [:time_stamp.desc])
  erb(:peeps)
end

helpers do
 def current_user
   @current_user ||= User.get(session[:user_id])
 end
end

end


DataMapper.finalize
