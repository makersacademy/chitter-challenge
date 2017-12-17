ENV["RACK_ENV"] ||= "development"

require 'sinatra/base'
require 'sinatra/flash'
require 'data_mapper'
require_relative 'data_mapper_setup'
require_relative 'models/peep'
require_relative 'models/user'

class Chitter < Sinatra::Base

  enable :sessions
  set :session_secret, 'super secret'
  register Sinatra::Flash

  get '/users/new' do
    @user = User.new
    erb :'users/new'
  end

  post '/users' do
    @user = User.create(name:      params[:name],
                       email:     params[:email],
                       username:  params[:username],
                       password:  params[:password],
                       password_confirmation: params[:password_confirmation])
    if @user.save
      session[:user_id] = @user.id
      redirect '/peeps'
    else
      flash.now[:notice] = "Password and confirmation password do not match"
      erb :'users/new'
    end
  end

  get '/peeps' do
    @peeps = Peep.all.reverse
    erb :'peeps/index'
  end

  get '/peeps/new' do
    erb :'peeps/new'
  end

  post '/peeps' do
    @timestamp = Time.new.strftime("%d/%m/%y at %I:%M%p")
    Peep.create(message: params[:message], timestamp: @timestamp)
    redirect '/peeps'
  end

  helpers do
    def current_user
      @current_user ||= User.get(session[:user_id])
    end
  end

  run! if app_file == $0
end
