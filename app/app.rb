ENV['RACK_ENV'] ||= 'development'

require 'sinatra/base'
require 'sinatra/flash'
require 'rake'
require 'securerandom'

require_relative 'datamapper_setup'

class Chitter < Sinatra::Base

  enable :sessions
  set :session_secret, ENV.fetch('SESSION_SECRET') { SecureRandom.hex(64) }
  register Sinatra::Flash

  # start the server if ruby file executed directly
  run! if app_file == $0

  get '/' do
    redirect '/peeps'
  end

  get '/peeps' do
    @peeps = Peep.all
    erb :'peeps/index'
  end

  get '/peeps/new' do
    erb :'peeps/add_peep'
  end

  post '/peeps' do
    Peep.create(body: params[:body])
    redirect '/peeps'
  end

  get '/users/new' do
    @user = User.new
    erb :'users/add_user'
  end

  post '/users' do
    @user = User.new(name: params[:name],
                    username: params[:username],
                    email: params[:email],
                    password: params[:password], 
                    password_confirmation: params[:password_confirmation])
    if @user.save
      session[:user_id] = @user.id
      redirect '/peeps'
    else
      flash.now[:notice] = "Password and confirmation password do not match"
      erb :'users/add_user'
    end
  end

  get '/sessions/login' do
    erb :'sessions/login'
  end

  post '/sessions' do
  end

end