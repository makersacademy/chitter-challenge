require 'sinatra/base'
require 'sinatra/flash'
require_relative './lib/peeps'
require_relative './lib/users'
require './database_connection_setup'

class Chitter < Sinatra::Base
  register Sinatra::Flash
  enable :sessions

get '/' do
   erb(:index)
end

post '/signup' do
   user = User.new_user(username: params[:username], email: params[:email], password: params[:password])
   session[:user] = user.username
  redirect '/peeps'
end

get '/login' do
  erb(:login)
end

post '/login_user' do
  case User.login(username: params[:username], password: params[:password])
  when "Wrong username"
       flash[:notice] = "This username doesn't exist"
       redirect "/login"
     when "Wrong password"
       flash[:notice] = "Wrong password, please try again."
       redirect "/login"
     else
       user = User.login(username: params[:username], password: params[:password])
       session[:user] = user.username
       redirect "/peeps"
     end

  redirect '/peeps'
end

get '/peeps' do
  @peeps = Peeps.all
  @user = session[:user]
  erb(:peeps)
end

get '/peeps/new_peep' do
  @user_posting = session[:user]
  erb :'peeps/new_peep'
end

post '/peeps' do
  Peeps.new_peep(text: params[:text])
  redirect '/peeps'
end

  post '/logout' do
    session.clear
    redirect '/'
  end

   run! if app_file == $0

end
