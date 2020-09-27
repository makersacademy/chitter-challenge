require 'sinatra/base'
require './lib/peeps.rb'
require './lib/user.rb'

class Chitter < Sinatra::Base

  enable :sessions 

  get '/' do 
    @peeps = Peeps.all
    @user = User.find(session[:id])
    erb(:index)
  end 

  post '/' do 
    peep = params[:add_peep]
    Peeps.post(peep)
    redirect '/'
  end 

  get '/sign_up' do
    erb(:sign_up)
  end
  
  post '/sign_up' do 
    user = User.create(email: params[:email], password: params[:password], username: params[:username])
    session[:id] = user.id 
    redirect '/'
  end 

end 