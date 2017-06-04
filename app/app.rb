ENV['RACK_ENV'] ||= 'development'

require 'sinatra/base'
require_relative 'data_mapper_setup'

class Chitter < Sinatra::Base
  enable :sessions
  set :session_secret, 'super extra secret'

  get '/' do
    redirect '/posts'
  end

  get '/signup' do
    erb :signup
  end

  post '/signup' do
    @user = User.create(email: params[:email],
                password: params[:password],
                password_confirmation: params[:password_confirmation])
    if @user.save
      session[:user_id] = @user.id
      redirect '/posts'
    end
  end

  helpers do
    def current_user
      @current_user ||= User.get(session[:user_id])
    end
  end

  get '/posts' do
    @peeps = Peep.all
    erb :'posts/index'
  end

  get '/posts/new' do
    erb :'posts/new'
  end

  post '/posts' do
    peep = Peep.create(message: params[:message],timestamp:Time.now)
    peep.save
    redirect '/posts'
  end

end
