ENV['RACK_ENV'] ||= 'development'
require 'data_mapper'
require 'dm-postgres-adapter'
require 'sinatra/base'
require 'sinatra/flash'
require 'erb'
require_relative 'models/user'
require_relative 'models/peep'
require_relative 'data_mapper_setup'

class Chitter < Sinatra::Base
  register Sinatra::Flash
  enable :sessions
  set :session_secret, 'super secret'

  helpers do
    def current_user
      @current_user ||= User.get(session[:user_id])
    end
  end

  get '/' do
    erb :index
  end

  get '/peeps/new' do
    erb :new_peep
  end

  get '/peeps' do
    @user = current_user
    @peeps = Peep.all
    erb :peeps
  end

  post '/peeps' do
    peep = Peep.create(message: params[:message])
    peep.save
    redirect '/peeps'
  end

  get '/users/new' do
    erb :new_user
  end

  post '/users' do
    @user = User.create(:name => params[:name],
                        :username => params[:username],
                        :email => params[:email],
                        :password => params[:password],
                        :password_confirmation => params[:password_confirmation])
    if @user.save
      session[:user_id] = @user.id
      redirect '/peeps'
    else
      flash.now[:warning] = @user.errors.full_messages.last
      erb :new_user
    end
  end

  # get '/sessions/new' do
  #   @user = current_user
  #   erb :'sessions/new'
  # end
  #
  # post '/sessions' do
  #   @user = User.authenticate(params[:email], params[:password]) || User.new
  #   @email = params[:email]
  #   if @user.id
  #     session[:user_id] = @user.id
  #     redirect '/peeps'
  #   else
  #     flash.now[:warning] = "Sign in failed"
  #     erb :'/sessions/new'
  #   end
  # end
  #
  # post '/sessions/end' do
  #   flash.next[:goodbye] = "We love you, #{current_user.email}. Please come back soon xoxo"
  #   session.clear
  #   @current_user = nil
  #   redirect '/'
  # end

  run! if app_file == $0
end
