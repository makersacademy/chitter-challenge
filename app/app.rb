ENV['RACK_ENV'] ||= 'development'
require 'sinatra/base'
require 'sinatra/flash'
require_relative 'models/peep'
require_relative 'data_mapper_setup'

class Chitter < Sinatra::Base
  enable :sessions
  set :session_secret, 'session'
  register Sinatra::Flash
  include BCrypt

  helpers do
    def current_user
      @current_user ||= User.get(session[:user_id])
    end
  end

  get '/' do
    "hello"
  end

  get '/peeps' do
    @peeps = Peep.all
    erb :'peeps/index'
  end

  get '/peeps/new' do
    erb :'peeps/new'
  end

  post '/peeps' do
    current_user
    Peep.create(content: params[:content], time: Time.now, name: @current_user.name, username: @current_user.username
    )
    redirect '/peeps'
  end

  get '/users/new' do
    @user = User.new
    erb :'users/new'
  end

  post '/users' do
    @user = User.create(email: params[:email],
                name: params[:name],
                username: params[:username],
                password: params[:password],
                password_confirmation: params[:password_confirmation])

    if @user.save
      session[:user_id] = @user.id
      redirect '/peeps'
    else flash.now[:error] = @user.errors.values.join("<br>")
      erb :'users/new'
    end
  end


  run! if app_file == $0

end
