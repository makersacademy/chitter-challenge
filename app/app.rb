ENV['RACK_ENV'] ||= 'development'

require 'sinatra/base'
require 'sinatra/flash'
require_relative 'data_mapper_setup'

class Chitter < Sinatra::Base
  register Sinatra::Flash
  use Rack::MethodOverride
  enable :sessions
  set :session_secret, 'super secret'
  get '/' do
    peeps = Peep.all
    @peeps = peeps.reverse
    erb :index
  end

  get '/sign_up' do
    @user = User.new
    erb :sign_up
  end

  post '/new_user' do
    @user = User.new(name: params[:name], email: params[:email],
      username: params[:username], password: params[:password],
      password_confirmation: params[:password_confirmation])
    if @user.save
      session[:user_id] = @user.id
      redirect('/')
    else
      flash.now[:errors] = @user.errors.full_messages
      erb :sign_up
    end
  end

  get '/log_in' do
    erb :log_in
  end

  post '/new_session' do
    user = User.authenticate(params[:username], params[:password])
    if user
      session[:user_id] = user.id
      redirect('/')
    else
      flash.now[:errors] = ['The username or password is incorrect']
      erb :log_in
    end
  end

  delete '/log_out' do
    session[:user_id] = nil
    redirect('/')
  end

  post '/new_peep' do
    user = current_user
    Peep.create(message: params[:message],
      username: user.username, user: user.name, time: Time.now)
    redirect('/')
  end


  helpers do
    def current_user
      @current_user ||= User.get(session[:user_id])
    end
  end

  run! if app_file == $0
end