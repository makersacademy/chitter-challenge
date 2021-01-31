require 'sinatra'
require 'sinatra/flash'
require 'uri'
require_relative "lib/peep"
require_relative "lib/user"
require_relative 'database_connection_setup'

class Chitter < Sinatra::Base
  enable :sessions, :method_override
  register Sinatra::Flash

  get '/' do
    erb :index
  end

  get '/user/new' do
    erb :new_user
  end

  post '/user' do
    user = User.create(params[:name], params[:username], params[:email], params[:password])
    session[:user_id] = user.id
    redirect '/peeps'
  end

  get '/peeps' do
    @user = User.find(session[:user_id])
    @peeps = Peep.all.reverse
    erb :peeps
  end

  get '/peeps/new' do
    erb :new
  end

  post '/peeps' do
    Peep.create(params[:message])
    redirect '/peeps'
  end

  get '/sessions/new' do
    erb :new_session
  end

  post '/sessions' do
    user = User.authenticate(params[:email], params[:password])
    if user
      session[:user_id] = user.id
      redirect('/peeps')
    else
      flash[:notice] = 'Please check your email or password.'
      redirect('/sessions/new')
    end
  end

  post '/sessions/destroy' do
    session.clear
    flash[:notice] = 'You have signed out.'
    redirect('/')
  end

  run! if app_file == $0
end
