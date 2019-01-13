ENV['RACK_ENV'] ||= 'development'

require 'sinatra/base'
require './config/data_mapper'
require 'pry'

class Chitter < Sinatra::Base

  enable :sessions
  enable :method_override

  get '/' do 
    @peeps = Peep.all
    erb :index
  end 

  post '/peeps' do 
    Peep.create(content: params[:content])
    redirect '/'
  end

  get '/peeps/:id' do 
    @peep = Peep.get(params[:id])
    erb :peeps
  end

  get '/signup' do 
    erb :signup
  end

  post '/signup' do 
    user = User.create(name: params[:name], username: params[:username], email: params[:email], password: params[:password])
    # if user.valid?
    #   session[:id] = user.id
      redirect('/signin')
    # else 
    #   redirect '/error'
    # end
  end
  

  get '/signin' do 
    erb :signin
  end

  post '/signin' do 
    user = User.authenticate(params[:email], params[:password])
    if user
      session[:id] = user.id
      redirect("/profile/#{session[:id]}")
    else
      redirect'/error'
    end
  end

  get '/profile/:id' do
    @user = User.get(params[:id])
    erb :profile
  end

end
