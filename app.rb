require 'sinatra/base'
require './lib/peep'
require './lib/user'

class Chitter < Sinatra::Base

  get '/peeps' do
    @peeps = Peep.all
    erb(:peeps)
  end 

  post '/peeps/add' do 
    Peep.add(name: params[:name], username: params[:username], text: params[:text], date_time: DateTime.now)
    redirect '/peeps'
  end 

  get '/users/add' do 
    erb(:add_user)
  end 

  post '/users/add' do
    @name = params[:name] 
    User.add(name: params[:name], username: params[:username], email: params[:email], password: params[:password])
    erb(:new_user)
  end 

end 