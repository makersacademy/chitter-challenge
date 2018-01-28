ENV["RACK_ENV"] ||= "development"
require 'sinatra/base'
require_relative 'models/peep'
require_relative 'data_mapper_setup'
require_relative 'models/user_account'
require 'sinatra/flash'

class Chitter < Sinatra::Base
  register Sinatra::Flash
  enable :sessions
  set :session_secret, 'super secret'

  helpers do
    def current_user
      @current_user ||= User.get(session[:user_id])
    end
  end

  get '/peeps' do
    @peeps = Peep.all
    erb :'peeps/index'
  end
  #
  get '/peeps/newpeep' do
    erb :'/peeps/newpeep'
  end

  post '/peeps' do
    Peep.create(message: params[:message], name: params[:name])
    redirect '/peeps'
  end

  post '/users' do
    @user = User.new(email: params[:email],
                    password: params[:password],
                    password_confirmation: params[:password_confirmation])
    if @user.save
      session[:user_id] = @user.id
      redirect to('/')
    else
      flash.now[:notice] = "Password and confirmation password do not match"
      erb :'users/new'
    end
  end

  get '/users/new' do
    @user = User.new
    erb :'users/new'
  end


end
