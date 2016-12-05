ENV['RACK_ENV']||='development'
require 'sinatra/base'
require 'pry'
require_relative  './models/user.rb'
require_relative  './models/peep.rb'
require_relative './models/database_setting.rb'
require 'dm-core'
require 'sinatra'
require 'sinatra/flash'
require "sinatra/partial"



class Chitter < Sinatra::Base
  enable :sessions
  set :sessions_secret, 'super secret'
  register Sinatra::Flash
  register Sinatra::Partial
  use Rack::MethodOverride
  set :partial_template_engine, :erb


  enable :partial_underscores


  helpers do
    def current_user
      User.first(id: session[:id])
    end
  end

  before do
    @user = current_user
  end

  get '/' do
    @peeps = Peep.all.reverse
    erb :'index'
  end

  post '/new' do
    your_peep = params[:text]
    time_now = Time.now.strftime("%H:%M")
    @user.peeps << Peep.create(text: your_peep, time: time_now)
    @user.save
    redirect '/'
  end


  post '/sessions' do
    user = User.authenticate(params[:user_name], params[:password])
    if user
      session[:id] = user.id
      redirect to('/')
    else
      flash.now[:notice] = ['The email or password is incorrect']
      erb :'sessions/new'
    end
  end

  get '/users/new' do
    erb :'users/new'
  end

  post '/users' do
    user = User.create(name: params[:name], user_name: params[:user_name],
    email: params[:email], password: params[:password])
    if user.save
      session[:id] = user.id
      redirect '/'
    else
      flash.now[:notice] = "Email is already taken"
      erb :'users/new'
    end
  end

  get '/sessions/new' do
    erb :'sessions/new'
  end

  delete '/sessions' do
    session[:id] = nil
    redirect to '/'
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
