require 'sinatra/base'
require 'sinatra/reloader'
require_relative 'lib/peeps'
require_relative './database_connection_setup'


class Chitter < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
    enable :session
  end

  get '/peeps' do
    @user = User.find(session[:id])
    @peeps = Peeps.all
    erb :'peeps/message'
  end
  
  get '/peeps/new' do
    erb :'peeps/index'
  end
  
  post '/peeps' do
    Peeps.create(message: params[:message])
    redirect '/peeps'
  end


get '/users/new' do
  erb :"users/new"
end

post '/users' do
  User.create(email: params[:email],password: params[:password],
  name: params[:name], username: params[:username])
  session[:id]= id
  redirect '/peeps'
end

  

 # start the server if ruby file executed directly
 run! if app_file == $0
end