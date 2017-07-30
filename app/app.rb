ENV['RACK_ENV'] ||= 'development'

require 'sinatra/base'
require 'sinatra/flash'
require_relative 'data_mapper_setup'

class Chitter < Sinatra::Base
  use Rack::MethodOverride
  enable :sessions
  set :session_secret, 'super secret'
  register Sinatra::Flash

  helpers do
    def current_user
      @current_user ||= User.get(session[:current_user_id])
    end
  end

  get '/' do
    @peeps = Peep.all(:order => [ :created_at.desc ])
    erb :index
  end

  get '/peeps' do
    @user = current_user
    @peeps = Peep.all(:order => [ :created_at.desc ])
    erb :peeps
  end

  post '/peep' do
    peep = Peep.create(message: params[:peep], time: "#{Time.new.hour}:#{Time.new.min}")
    redirect ('/peeps')
  end

  get '/sign_up' do
    erb :sign_up
  end

  post '/sign_up' do
    @user = User.new(name: params[:name],
                      username: params[:username],
                      email: params[:email],
                      password: params[:password],
                      password_confirmation: params[:password_confirmation])
    if @user.save
      session[:current_user_id] = @user.id
      redirect ('/peeps')
    else
      flash.now[:errors] = @user.errors.full_messages
      erb :sign_up
    end
  end

  get '/sessions/new' do
    erb :'sessions/new'
  end

  post '/sessions' do
    user = User.authenticate(params[:email], params[:password])
    if user
      session[:user_id] = user.id
      redirect to('/peeps')
    else
      flash.now[:errors] = ['The email or password is incorrect']
      erb :'sessions/new'
    end
  end

  delete '/sessions' do
    session[:current_user_id] = nil
    flash.keep[:notice] = 'goodbye!'
    redirect to '/peeps'
  end

  run! if app_file == $0
end
