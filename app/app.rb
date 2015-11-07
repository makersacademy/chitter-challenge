ENV['RACK_ENV'] ||= 'development'

require 'sinatra/base'
require 'sinatra/flash'
require_relative 'models/user'
require_relative 'models/peep'
require_relative 'data_mapper_setup'

class Chitter < Sinatra::Base

  enable :sessions
  set :session_secret, 'rochefort rocks'
  register Sinatra::Flash
  use Rack::MethodOverride

  get '/' do
    erb :index, :layout => :home_layout
  end

  get '/users/new' do
    erb :'users/new'
  end

  post '/users' do
    @user = User.new(name: params[:name], username: params[:username],
                    email: params[:email], password: params[:password],
                    password_confirmation: params[:password_confirmation] )
    if @user.save
      redirect '/sessions/new'
    else
      flash.now[:errors] = @user.errors.full_messages
      erb :'users/new'
    end
  end

  get '/sessions/new' do
    erb :'sessions/new'
  end

  delete '/sessions' do
    session[:user_id] = nil
    redirect '/'
  end

  post '/sessions' do
    @user = User.authenticate(params[:email], params[:password])

    if @user
      session[:user_id] = @user.id
      redirect '/feeds/view'
    else
      erb :'sessions/new'
    end
  end

  get '/feeds/view' do
    erb :'/feeds/view'
  end

  get '/message/new' do
    redirect '/feeds/view' unless current_user
    erb :'message/new'
  end

  post '/message' do
    current_user.peeps << Peep.new(message: params[:message])
    current_user.save
    redirect '/feeds/view'
  end

  helpers do
    def current_user
      @current_user ||= User.get(session[:user_id])
    end
  end

  run! if app_file == $0
end
