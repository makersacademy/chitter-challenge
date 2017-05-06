ENV['RACK_ENV'] ||= 'development'

require 'sinatra/base'
require 'sinatra/flash'
require_relative 'models/user'
require_relative 'helpers'

class Chitter < Sinatra::Base
  enable :sessions
  set :session_secret, 'super secret'

  register Sinatra::Flash

  helpers Helpers

  get '/' do
    erb :home
  end

  post '/login' do
    @logged_in_user = User.authenticate(params[:username], params[:password])
    if @logged_in_user != nil
      session[:user_id] = @logged_in_user.id
      redirect to('/')
    else
      flash.now[:notice] = "Sorry, we can't find you. Try again?"
      erb :home
    end
  end

  get '/signup' do
    erb :signup
  end

  post '/signup' do
    User.create(name:  params[:name],  username: params[:username],
                email: params[:email], password: params[:password])
    redirect to('/')
  end

  post '/logout' do
    session.clear
    redirect to('/')
  end
end
