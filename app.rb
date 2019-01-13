require './config/data_mapper'
require 'pry'
require 'sinatra/base'

class Chitter < Sinatra::Base
  enable :sessions
  enable :method_override

  ENV['RACK_ENV'] = 'development'

  get '/' do
    @peeps = Peep.all
    erb :index
  end

  post '/peep' do
    Peep.create(text: params[:peep], user: current_user)
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
      redirect '/signup'
    end
  end

  get '/profile' do
    if signed_in?
      erb :profile
    else
      redirect '/'
    end
  end

  private

  def signed_in?
    !current_user.nil?
  end

  def current_user
    @current_user ||= User.get(session[:id])
  end
end
