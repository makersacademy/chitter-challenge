ENV['RACK_ENV'] ||= 'development'

require 'sinatra/base'
require 'sinatra/flash'
require_relative 'data_mapper_setup'
require_relative 'models/peep'
require_relative 'models/user'


class Chitter < Sinatra::Base

  use Rack::MethodOverride
  register Sinatra::Flash
  enable :sessions
  set :session_secret, 'super secret'



  get '/index' do
    erb :index
  end

  get '/sign_up' do
    erb :sign_up
  end

  post '/sign_up' do
    user = User.new(email: params[:email],password: params[:password])
    if user.valid?
      user.save
      flash[:notice] = 'HI created a user'
      session[:user_id] = user.id
      redirect '/peeps'
    else
      flash[:notice] = user.errors
      redirect'/peeps'
    end
  end

  get '/log_in' do
    erb :log_in
  end


  delete '/sessions' do
    session.delete(:user_id)
    flash.keep[:notice] = 'goodbye!'
    redirect '/index'
  end

  post '/log_in' do
    user = User.authenticate(params[:email],params[:password])
    if user
      session[:user_id] = user.id
      flash.now[:notice] = "logged in!!!!!"
      redirect '/peeps'
    else
      flash.now[:error] = "The email or password is incorrect"
      redirect '/log_in'
    end
  end

  get '/peeps/new' do
    erb :new
  end

  post '/peeps' do
      @new_peep = Peep.create(peep: params[:peep], created_at: Time.now, user:current_user)
    redirect '/peeps'
  end

  get '/peeps' do
     @peeps = Peep.all :order => :created_at.desc
     erb :peeps
  end

  helpers do
      def current_user
        @current_user ||= User.get(session[:user_id])
      end
  end

  run! if app_file == $0

end
