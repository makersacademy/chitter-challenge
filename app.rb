require 'sinatra/base'
require './lib/model'

class Chitter < Sinatra::Base
enable :sessions

 get '/chitterapp' do 
  @peeps = Peep.all
  erb :index
 end 

 post '/chitterapp' do
   Peep.create(peeps: params[:message])
  
  redirect '/chitterapp'
 end

 get '/users' do
  erb :new
 end

get '/users' do
  User.create(name: params[:name], username: params[:username], email: params[:email], password: params[:password])
  redirect to '/chitterapp'
end


 run! if app_file == $0

end 

 

    