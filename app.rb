require 'sinatra/base'
require './lib/model'
require './lib/user'
require 'pg'

class Chitter < Sinatra::Base
enable :sessions

 get '/chitterapp' do 
  @peeps = Peep.all
  @user = User.find(session[:id]) if session[:id]
  erb :index
 end 

 post '/chitterapp' do
   Peep.create(peeps: params[:message])
  
  redirect '/chitterapp'
 end

 get '/users/new' do
  erb :new
 end

 post '/users' do
  user = User.create(name: params[:name], username: params[:username], email: params[:email], password: params[:password])
  session[:id] = user.id
  redirect to '/chitterapp'
 end


 run! if app_file == $0

end 

 

    