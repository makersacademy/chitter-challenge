ENV["RACK_ENV"] ||= "development"

require 'sinatra/base'
require 'sinatra/flash'
require_relative 'data_mapper_setup'

class Chitter < Sinatra::Base

  register Sinatra::Flash
  use Rack::MethodOverride

  enable :sessions
  set :session_secret, 'super secret'

  get '/' do
    current_user
    @peeps = Peep.all(order: :id.desc)
    erb :index
  end

  get '/sign_up' do
    erb :'/users/new'
  end

  post '/users/new' do
    user = User.create(name: params[:name],
                       username: params[:username],
                       email: params[:email],
                       password: params[:password],
                       password_confirmation: params[:password_confirmation])
    if user.save
      session[:user_id] = user.id
      redirect '/'
    else
      flash[:errors] = user.errors.full_messages
      redirect '/sign_up'
    end
  end

  post '/sign_in' do
    user = User.authenticate(params[:username], params[:password])
    if user
      session[:user_id] = User.first(username: params[:username]).id
    else
      flash[:errors] = ["Invalid username or password"]
    end
    redirect('/')
  end

  delete '/sessions' do
    session[:user_id] = nil
    redirect '/'
  end

  post '/peep' do
    peep = Peep.create(message: params[:new_peep],
                       username: current_user.username,
                       name: current_user.name)
    redirect '/'
  end

  helpers do
    def current_user
      @current_user ||= User.first(id: session[:user_id])
    end
  end
end
