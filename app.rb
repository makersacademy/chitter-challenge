require 'sinatra/base'
require 'sinatra/reloader'
require './lib/peeps'
require './lib/user'
require 'bcrypt'

class App < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
  end
  enable :sessions

  get '/signup' do
    erb :signup
  end

  post '/signup' do
    begin
      session[:error_message] = nil
      user = User.create(user_name: params[:user_name], password: params[:password], email: params[:email])
      redirect to '/login'
    rescue => exception
      p exception
      session[:error_message] = "This login or email has already been used"
      redirect to '/signup'
    end
  end

  get '/login' do
    erb :login
  end
  
  post '/login' do
    begin
      session[:error_message] = nil
      user = User.login_find(user_name: params[:user_name], password: params[:password])
      session[:user] = user
      redirect to '/peep'
    rescue => exception
      p exception
      session[:error_message] = "Wrong login or password"
      redirect to '/login'
    end
  end

  get '/peep' do
    @peeps = Peep.all
    erb :peep
  end

  post '/peep' do
    user = session[:user]
    Peep.create(peep_text: params[:peep_text], user_id: user.id)
    redirect to :peep
  end

  post '/logout' do
    session[:user] = nil
    redirect to :login
  end

  run! if app_file == $0
end
