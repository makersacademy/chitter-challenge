ENV['RACK_ENV'] ||= "development"


require './app/init.rb'
require 'sinatra/base'


class Chitter < Sinatra::Base

  enable :sessions
  set :session_secret, 'super secret'

  get '/chitter-home' do
    @peeps = Peep.all
    erb :index
  end

  get '/signup' do
    erb :signup
  end

  post '/signup' do
    user = User.create(name: params[:name], email: params[:email], password: params[:password], username: params[:username])
    session[:username] = user.username
    redirect '/chitter-home'
  end

  get '/new' do
    erb :new
  end

  post '/new' do
    peep = Peep.create(body: params[:peep])
    p peep
    redirect '/chitter-home'
  end

  helpers do
    def current_user
      @current_user ||= User.first(username: session[:username])
    end
  end

  run! if app_file == $PROGRAM_NAME
end
