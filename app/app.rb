ENV['RACK_ENV'] ||= 'development'
require_relative 'data_mapper_setup'
require 'sinatra/base'
require 'sinatra/flash'
require 'bcrypt'

class Chitter < Sinatra::Base
  use Rack::MethodOverride
  enable :sessions
  set :session_secret, 'super_secret'

  register Sinatra::Flash

  attr_reader :name

  helpers do
    def current_user
      @current_user ||=User.get(session[:user_id])
    end
  end

  get '/' do
    erb :index
  end

  get '/sign_up' do
    erb :sign_up
  end

  get '/chitters' do
    erb :chitters
  end

  get '/peeps' do
    @peeps = Peep.all(order: :created_at.desc)
    erb :peeps
  end

  post '/peeps' do
    user = User.get(session[:user_id])
    @peep = user.peeps.create(message: params[:message], username: user.username)
    redirect to('/peeps')
  end

  post '/chitters' do
    @user = User.new(name: params[:name], username: params[:username], email: params[:email], password_digest: params[:password], password_confirmation: params[:password_confirmation])
    if @user.save
      session[:user_id] = @user.id
      redirect to('/chitters')
    else
      flash.now[:notices] = @user.errors.full_messages
      erb :sign_up
    end
  end

  get '/log_in' do
    erb :log_in
  end

  post '/sessions' do
    user = User.authenticate(params[:email], params[:password])
  if user
    session[:user_id] = user.id
    redirect to('/chitters')
  else
    flash.now[:notices] = ['The email or password is incorrect']
    erb :log_in
    end
  end

  delete '/sessions' do
    session[:user_id] = nil
    flash.keep[:notices] = 'goodbye!'
    redirect to '/'
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
