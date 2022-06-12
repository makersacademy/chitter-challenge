require 'sinatra/base'
require 'sinatra/reloader'
require 'sinatra/flash'
require_relative './lib/peep.rb'
require_relative './lib/user.rb'
require_relative './lib/database_connection_setup.rb'
require 'date'

class Chitter < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
  end

  enable :sessions
  register Sinatra::Flash

  get '/' do
    redirect '/chitter'
  end

  get '/chitter' do
    @peeps = Peep.all
    @user = User.find(id: session[:user_id])
    erb :'chitter/index'
  end

  post '/chitter' do
    p params
    @peep = Peep.create(content: params[:content], time_created: Time.now.to_s, user_id: session[:user_id])
    redirect '/chitter'
  end

  get '/chitter/user' do
    erb :'chitter/user'
  end

  post '/chitter/user' do
    user = User.create(
      first_name: params[:first_name], last_name: params[:last_name], email: params[:email], handle: params[:handle], password: params[:password]
    )
    session[:user_id] = user.id
    redirect '/chitter'
  end

  get '/sessions/new' do
    erb :'sessions/new'
  end

  post '/sessions' do
    user = User.authenticate(email: params[:email], password: params[:password]) 
    if user
      session[:user_id] = user.id
      redirect '/chitter'
    else
      flash[:notice] = "Please check your email or password."
     redirect ('/sessions/new')
   end
  end

    run! if app_file == $0
end