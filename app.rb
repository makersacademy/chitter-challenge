require 'sinatra/flash'
require 'sinatra/base'
require './lib/peep'
require './lib/user'

class Chitter < Sinatra::Base
  enable :sessions
  register Sinatra::Flash

  get '/' do 
    redirect '/peeps'
  end

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
    if User.unique_username?(params[:username]) && User.unique_email?(params[:email])
      @name = params[:name] 
      User.add(name: params[:name], username: params[:username], email: params[:email], password: params[:password])
      erb(:new_user)
    else
      flash[:error] = 'Your username or email has already been taken'
      redirect '/users/add'
    end
  end 

  get '/users/login' do 
    erb(:login)
  end 

  post '/users/login' do 
    if User.authenticated?(params[:username],params[:passsword])
      redirect '/peeps'
    else 
      flash[:error] = 'Your username or password is incorrect'
    end
  end 
end 