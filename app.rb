require 'sinatra/base'
require_relative './lib/peep'
require_relative './lib/user'
require_relative './database_connection_setup'


class Chitter < Sinatra::Base

  enable :session

get '/' do
  'Welcome to Chitter!'
  erb :index
end

get '/peeps' do
  @user = User.find(id: session[:user_id])
  @peeps = Peep.all.reverse
  erb :peeps
end

get '/peeps/new' do
  erb :new
end

post '/peeps' do
  Peep.create(text: params['text'])
  redirect '/peeps'
end

get '/register' do
   erb :index
 end

 post '/register' do
  User.create(name: params[:name], email: params[:email], password: params[:password])
  session[:user_id] = user.id
  redirect "/peeps"
end

run! if app_file == $0
end
