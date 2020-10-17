require './lib/database_setup'
require 'rack'
require 'sinatra/base'
require 'sinatra/flash'
require './lib/constants'
require './lib/peep'
require './lib/user'

class Chitter < Sinatra::Base
  enable :sessions
  register Sinatra::Flash

  get '/chitter' do
    @user = session[:user]
    @peeps = Peep.all
    erb :chitter
  end

  get '/chitter/user/new' do
    erb :new_user
  end

  post '/chitter/peep' do
    Peep.create(body: params[:peep], user_id: session[:user].id)
    redirect '/chitter'
  end
  
  post '/chitter/user' do
    session[:user] = User.create(name: params[:name], username: params[:username], email: params[:email], password: params[:password])
    
    if ERROR_HANDLING[session[:user]]
      flash[:error] = ERROR_HANDLING[session[:user]]
      session[:user] = nil
      redirect '/chitter/user/new'
    else
      redirect '/chitter'
    end
  end
end
