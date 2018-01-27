require_relative 'datamapper_setup'
require 'sinatra/base'
ENV['RACK_ENV'] ||= 'development'
require 'sinatra/flash'

class Chitter < Sinatra::Base
  enable :sessions
  register Sinatra::Flash
  set :session_secret, '0ac8368e8d59a45c4d9f5d11f36dbfaa2108a8c0f7b1be98f39933356bcee17a'

  helpers do
    def current_user
      @current_user ||= User.get(session[:user_id])
    end
 end

  get '/peeps' do
    @peeps = Peep.all(order:[:created_at.desc])
    @current_user = current_user
    erb :'peeps/index'
  end

  get '/peeps/new' do
    erb :'peeps/new'
  end

  post '/peeps' do
    Peep.create(post:params[:post])
    redirect '/peeps'
  end

  post '/users/new' do
    @user =  User.new(name: params[:name], username: params[:username], email_address: params[:email_address],password_confirmation: params[:password_confirmation], password: params[:password])
    if @user.save
      session[:user_id] = @user.id
      redirect '/peeps'

    else
      flash.now[:errors] = @user.errors.full_messages
      erb :'users/user_signup'
    end
  end

  get '/users/new' do
    @user = User.new
    erb :'users/user_signup'
  end

end
