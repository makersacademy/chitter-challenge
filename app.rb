require 'sinatra/base'
require 'sinatra/flash'
require 'pg'
require_relative "./lib/peep"
require_relative "./lib/user"
require_relative "./lib/user_authenticator"
require_relative "./database_setup"

class Chitter < Sinatra::Base

  enable :sessions
  register Sinatra::Flash

  get '/' do
    flash[:invalid] = "Incorrect login details supplied" unless session[:invalid]
    erb :index
  end

  get '/peeps' do
    redirect to('/') unless session[:user]
    @user = session[:user]
    @peeps = Peep.all
    erb :peep
  end

  post '/peeps' do
    Peep.create(params[:peep])
    redirect to '/peeps'
  end

  get '/new_user' do
    erb :new_user
  end

  post '/users' do
    session[:user] = User.create(params)
    redirect to '/peeps'
  end

  post '/sign_in' do
    if UserAuthenticator.valid?(params[:username], params[:password])
      session[:user] = User.find_by_username(params[:username])
      redirect to '/peeps'
    else
      session[:invalid] = true
      redirect to '/'
    end
  end
end
