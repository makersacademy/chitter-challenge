require 'sinatra/base'
require 'sinatra/flash'
require './lib/peep'
require './lib/database_connection_setup'
require './lib/user'

class Chitter < Sinatra::Base
  enable :sessions
  register Sinatra::Flash

  get '/' do
    redirect '/peeps'
  end

  get '/peeps' do
    @user = User.find(session[:user_id])
    @peeps = Peep.all
    erb(:index)
  end

  get '/peeps/new' do
    erb(:create)
  end

  post '/peeps' do
    Peep.create(params, session[:user_id])
    redirect '/'
  end

  get '/users/new' do
    erb(:sign_up)
  end

  post '/users' do
    begin
      user = User.create(params)
      session[:user_id] = user.id
    rescue Exception => e
      flash[:taken] = e.message
      redirect '/users/new'
    end
    redirect '/'
  end

  get '/sessions/new' do
    erb(:sign_in)
  end

  post '/sessions' do
    user = User.authenticate(params[:email], params[:password])
    if user
      session[:user_id] = user.id
      redirect '/'
    else
      flash[:failed_sign_in] = "Please check your email or password."
      redirect '/sessions/new'
    end
  end

  get '/sessions/destroy' do
    session.clear
    flash[:sign_out] = 'You have signed out.'
    redirect('/')
  end
  # run! if app_file == $0
end
