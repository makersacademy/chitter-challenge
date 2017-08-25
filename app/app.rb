ENV['RACK_ENV'] ||= 'development'
require 'sinatra/base'
require 'sinatra'
require_relative 'data_mapper_setup'

class ChitterWebsite < Sinatra::Base

  enable :sessions
  set :session_secret, 'super secret'

  get '/peeps' do
    @peeps = Peep.all(:order => [:id.desc])
    erb :'peeps/index'
  end

  get '/peeps/new' do
    erb :'peeps/new'
  end

  post '/peeps' do
    Peep.create(
      :message => params[:message],
      :created_at => Time.new
    )
    redirect '/peeps'
  end

  get '/sign_up' do
    erb :'users/sign_up'
  end

  post '/account_setup' do
    user = User.create(
      :name => params[:name],
      :username => params[:username],
      :email => params[:email],
      :password => params[:password]
    )
    session[:user_id] = user.id
    redirect '/welcome'
  end

  get '/welcome' do
    @user = User.first
    erb :'users/welcome'
  end

  get '/sessions/new' do
    erb :'users/log_in'
  end

  post '/sessions' do
    redirect '/welcome'
    # user = User.authenticate(params[:email], params[:password])
    # if user
    #   session[:username] = user.username
    #   redirect to '/welcome'
    # else
    #   flash.now[:errors] = ['The email or password is incorrect']
    #   erb :'sessions/new'
    # end
  end

  helpers do
   def current_user
     @current_user ||= User.get(session[:user_id])
   end
  end
end
