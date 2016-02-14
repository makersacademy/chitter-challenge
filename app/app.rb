ENV['RACK_ENV'] ||= 'development'

require 'sinatra/base'
require 'data_mapper'
require 'sinatra/flash'
require_relative '../models/data_mapper_setup'


class Chitter < Sinatra::Base
  register Sinatra::Flash

  enable :sessions
  set :session_secret, 'super secret'

  get '/' do
    'THIS. IS. CHITTERRR!'
    erb :index
  end

  get '/users/new' do
    @user = User.new
    erb :'users/new'
  end

  post '/users' do
    @user = User.create(username: params[:username],
                           name: params[:name],
                          email: params[:email_address],
                       password: params[:password],
          password_confirmation: params[:password_confirmation])
    if @user.save
      session[:user_id] = @user.id
      redirect to('/')
      erb :layout
    else
      flash.now[:notice] = "Soz mate, that password ain\'t right!"
      erb :'/users/new'
    end
  end

  helpers do
    def current_user
      @current_user ||= User.get(session[:user_id])
    end
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
