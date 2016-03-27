ENV["RACK_ENV"] ||= "development"

require 'sinatra/base'
require 'sinatra/flash'
require_relative './models/user'
require_relative './models/peep'
require_relative './data_mapper_setup'

class Chitter < Sinatra::Base
  use Rack::MethodOverride
  enable :sessions
  register Sinatra::Flash

  helpers do
    def current_user
      @current_user ||= User.get(session[:user_id])
    end
  end

  get '/' do
    erb :index
  end

  get '/sign-up' do
    erb :sign_up
  end

  post '/sign-up' do
    @user = User.new(username: params[:username], email: params[:email], password: params[:password], password_confirmation: params[:password_confirmation])
    if @user.save
      session[:user_id] = @user.id
      redirect to('/chitter_feed')
    else
      flash.now[:error] = @user.errors.full_messages
      erb :sign_up
    end
  end

  get '/log-in' do
    erb :log_in
  end

  post '/log-in' do
    user = User.first(email: params[:email])
    if user.nil?
      flash.now[:error] = ["User does not exist!"]
      erb :log_in
    elsif user.authenticate(params[:password])
      redirect to('/chitter_feed')
    else
      flash.now[:error] = user.errors.full_messages
      erb :log_in
    end
  end

  get '/chitter_feed' do
    @peeps = Peep.all
    erb :chitter_feed
  end

  delete '/sessions' do
    flash.keep[:notice] = "Goodbye!"
    session[:user_id] = nil
    redirect to '/'
  end

  get '/chitter_feed/new' do
    erb :new_peep
  end

  post '/chitter_feed/new' do
    peep = Peep.new(message: params[:message], time: Time.now)
    if current_user
      current_user.peeps << peep
      peep.save
      redirect to '/chitter_feed'
    else
      flash.now[:error] = ["Log in to peep!"]
      erb :log_in
    end
  end

  run! if app_file == $0
end
