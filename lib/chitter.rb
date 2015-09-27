require 'sinatra/base'
require_relative 'data_mapper_setup'

class Chitter < Sinatra::Base
  enable :sessions

  get '/' do
    erb :index
  end

  get '/peeps/all' do
  #   @peeps = Peep.all
    erb :'peeps/all'
  end

  get '/user/new' do
    erb :'user/new'
  end

  post '/user/new' do
    user = User.new(email: params[:email],
                    username: params[:username],
                    password: params[:password],
                    password_confirm: params[:password_confirm],
                    name: params[:name])
    if user.save
      redirect '/session/new'
    end
  end

  get '/session/new' do
    erb :'session/new'
  end

  post '/session/new' do
    user = User.authenticate(params[:username], params[:password])
    if user
      session[:user_id] = user.id
      redirect '/peeps/all'
    end
  end

  def current_user
    current_user ||= User.first(id: session[:user_id])
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
