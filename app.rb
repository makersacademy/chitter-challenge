ENV["RACK_ENV"] ||= "development"

require 'sinatra'
require 'sinatra/base'
require './models/user.rb'
require './models/peeps.rb'
require 'sinatra/flash'

class Chitter < Sinatra::Base

  enable :sessions
  set :session_secret, 'super secret'
  register Sinatra::Flash
  use Rack::MethodOverride

  get '/sign_up' do
    erb :sign_up
  end

  post '/sign_up' do
    email = params[:email]
    name = params[:name]
    user_name = params[:user_name]
    password = params[:password]
    @user = User.create(email: email,
                        name: name,
                        user_name: user_name,
                        password: password)
    session[:user_id] = @user.id
    erb :sign_up
    redirect '/peeps'
  end

  get '/sessions_new' do
    erb :sessions_new
  end

  post '/sessions' do
    @user = User.authenticate(params[:user_name], params[:password])
    if @user
      session[:user_id] = @user.id
      erb :sessions_new
      redirect to '/peeps'
    else
      flash.now[:errors] = ['The user_name or password is incorrect']
      erb :sessions_new
    end
  end

  delete '/sessions' do
    session[:user_id] = nil
    flash.keep[:notice] = 'goodbye!'
  end

  get '/peeps_new' do
    erb :new_peep
  end

  post '/peeps' do
    peep = params[:peep]
    @peep = Peep.new(user: current_user,peep: peep, time: Time.new)
    @peep.save
    redirect '/peeps'
  end

  get '/peeps' do
    @peeps = Peep.all.reverse
    @users = User.all
    erb :peep
  end

  helpers do
    def current_user
      @current_user ||= User.get(session[:user_id])
    end
  end

  run! if app_file == $0
end
