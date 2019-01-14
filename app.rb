require 'pry'
require 'sinatra/base'
require './config/data_mapper'

class Chitter < Sinatra::Base
  enable :sessions
  enable :method_override

  ENV['RACK_ENV'] ||= 'development'

  get '/' do
    @peeps = Peep.all
    erb :index
  end

  post '/peep' do
    @peep = Peep.create(
      text: params[:peep], posted_at: Time.now, user: current_user
    )
    redirect '/'
  end

  get '/signup' do
    erb :signup
  end

  get '/signin' do
    erb :signin
  end

  post '/signin' do
    user = User.authenticate(params[:email], params[:password])
    if user
      session[:user_id] = user.id
      redirect '/profile'
    else
      redirect '/error'
    end
  end

  post '/signup' do
    user = User.new(
      email: params[:email],
      password: params[:password],
      actualname: params[:actualname],
      username: params[:username]
    )
    if user.save
      session[:id] = user.id
      redirect '/profile'
    else
      redirect '/error'
    end
  end

  get '/profile' do
    @peeps = Peep.all
    if signed_in?
      erb :profile
    else
      redirect 'signin'
    end
  end

  get '/error' do
    erb :error
  end

  delete '/log-out' do
    session.delete(:user_id)
    redirect '/'
  end

private

  def signed_in?
    !current_user.nil?
  end

  def current_user
    @current_user ||= User.get(session[:user_id])
  end
end
