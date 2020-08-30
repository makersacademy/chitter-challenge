require 'sinatra/base'
require_relative './lib/peeps'
require_relative './lib/users'
require './database_connection_setup'

class Chitter < Sinatra::Base

  enable :sessions

get '/' do
   erb(:index)
end

post '/signup' do
   user = User.new_user(username: params[:username], email: params[:email], password: params[:password])
   session[:user_name] = user.username
  redirect '/peeps'
end

get '/peeps' do
  @peeps = Peeps.all
  @user = session[:user_name]
  erb(:peeps)
end

get '/peeps/new_peep' do
  erb :'peeps/new_peep'
end

post '/peeps' do
  Peeps.new_peep(text: params[:text])
  redirect '/peeps'
end

   run! if app_file == $0

end
