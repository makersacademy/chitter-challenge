require './config/data_mapper'
require 'pry'
require 'sinatra/base'
require 'sinatra/flash'

class Chitter < Sinatra::Base
  enable :sessions
  enable :method_override
  register Sinatra::Flash

  ENV['RACK_ENV'] = 'development'

  get '/' do
    @peeps = Peep.all
    erb :index
  end

  post '/peep' do
    peep = Peep.new(text: params[:peep], user: current_user)
    flash[:signout] = 'You are not signed in' unless peep.save

    redirect '/'
  end

  get '/signup' do
    erb :signup
  end

  post '/signup' do
    user = User.new(
      email: params[:email],
      password: params[:password],
      name: params[:name],
      username: params[:username]
    )

    if user.save
      session[:id] = user.id
      redirect '/profile'
    else
      flash[:error] = 'Error: email or username already exists'
      redirect '/signup'
    end
  end

  get '/profile' do
    if signed_in?
      erb :profile
    else
      flash[:signout] = 'You are not signed in'
      redirect '/'
    end
  end

  get '/signin' do
    erb :signin
  end

  post '/signin' do
    user = User.authenticate(params[:email], params[:password])
    if user
      session[:id] = user.id
      redirect '/profile'
    else
      flash[:error] = 'Error: email address or password invalid'
      redirect '/signin'
    end
  end

  delete '/signin' do
    session.delete(:id)
    redirect '/'
  end

  private

  def signed_in?
    !current_user.nil?
  end

  def current_user
    @current_user ||= User.get(session[:id])
  end
end
