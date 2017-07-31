ENV["RACK_ENV"] ||= "development"

require_relative 'data_mapper_setup'
require 'sinatra/base'
require 'sinatra/flash'
require 'pry'

class Chitter < Sinatra::Base

  enable :sessions
  set :session_secret, 'super secret'
  register Sinatra::Flash
  use Rack::MethodOverride

  helpers do
    def current_user
      @current_user ||= User.get(session[:id])
    end
  end

  get '/peeps/new' do
    erb :'peeps/new'
  end

  get '/peeps' do
    @user = current_user
    @peeps = Peep.all.sort_by{ |peep| peep.created_at }.reverse
    erb :'peeps/index'
  end

  post '/peeps' do
    peep = Peep.create(content: params[:content])
    current_user.peeps << peep
    current_user.save
    redirect '/peeps'
  end

  get '/users/new' do
    @user = User.new
    erb :'users/new'
  end

  post '/users' do
    @user = User.new(name: params[:name],
            user_name: params[:user_name],
            email_address: params[:email_address],
            password: params[:password],
            password_confirmation: params[:password_confirmation])
    if @user.save
      session[:id] = @user.id
      redirect '/peeps'
    else
      flash.now[:errors] = @user.errors.full_messages
      erb :'users/new'
    end
  end

  get '/sessions/new' do
    erb :'sessions/new'
  end

  post '/sessions' do
    user = User.authenticate(params[:email_address], params[:password])
    if user
      session[:id] = user.id
      redirect '/peeps'
    else
      flash.now[:errors] = ['The email or password is incorrect']
      erb :'sessions/new'
    end
  end

  delete '/sessions' do
    session[:user_id] = nil
    flash.keep[:notice] = 'Laters!'
    redirect to '/peeps'
  end

end
