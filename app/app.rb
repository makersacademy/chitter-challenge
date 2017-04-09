ENV['RACK_ENV'] ||= 'development'

require 'data_mapper'
require 'sinatra/base'
require_relative 'data_mapper_setup'
require 'sinatra/flash'
# require_relative 'models/user'

class Chitter < Sinatra::Base

  enable :sessions
  register Sinatra::Flash
  set :session_secret, 'super_secret'

  get '/' do
    redirect to ('/peeps/index')
  end

  get '/peeps/index' do
    @peeps = Peep.all
    @username = current_user.username if current_user
    erb :'peeps/index'
  end

  post '/peeps' do
    peep = Peep.new(peep: params[:peep])
    peep.save
    redirect to ('/peeps/index')
    erb :'peeps/index'
  end

  get '/user/new' do
    @user = User.new
    erb :'/user/new'
  end

  post '/user' do
    @user = User.new(username: params[:username],
                     email: params[:email],
                     password: params[:password],
                     password_confirmation: params[:password_confirmation])
    if @user.save
      session[:user_id] = @user.id
      redirect to('/peeps/index')
    else
      flash.now[:error] = "Passwords didn't match, please try again"
      erb :'/user/new'
    end
  end



  helpers do
    def current_user
      @current_user ||= User.get(session[:user_id])
    end
  end


end
