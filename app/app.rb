ENV['RACK_ENV'] ||= 'development'
require 'sinatra/base'
require './app/models/peep'
require_relative 'data_mapper_setup'
require 'date'

class Chitter < Sinatra::Base
  enable :sessions
  set :session_secret, 'super secret'

  get '/' do

    @peeps = Peep.all

    if current_user
      erb :'peeps/index'
    else
      redirect('users/new')
    end

  end

  get '/peeps/new' do

    erb :'peeps/new'
  end

  post '/peeps/message' do
    # binding.pry
    Peep.create(message: params[:message_input], user_id: current_user.id)

    redirect('/')
  end

  get '/users/new' do
    erb :'users/new'
  end

  post '/users' do
    User.create(email: params[:email], first_name: params[:first_name],
      last_name: params[:last_name], password: params[:password])
    session[:user_id] = User.last.id
    redirect to('/')
  end

  helpers do
    def current_user
      @current_user ||= User.get(session[:user_id])
    end
  end

end
