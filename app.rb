require 'sinatra/base'
require_relative 'data_mapper_setup'
require 'sinatra/flash'

class Chitter < Sinatra::Base
  enable :sessions, :method_override
  set :session_secret, 'super secret'
  register Sinatra::Flash

  get '/' do
    @peeps = Peep.all(:order => [:created_at.desc])
    erb :index
  end

  get '/peep' do
    erb :peep
  end

  post '/peeps' do
    @user = current_user
    Peep.create(message: params[:peep], user_id: @user.id)
    redirect '/'
  end

  get '/signup' do
    @user = User.new
    erb :sign_up
  end

  post '/signup' do
    @user = User.new(name: params[:name], username: params[:username],
                     email: params[:email], password: params[:password],
                     password_confirmation: params[:password_confirmation])

    if @user.save
      session[:user_id] = @user.id
      redirect '/'
    else
      flash.now[:alert] = @user.errors.full_messages
      erb :sign_up
    end
  end

  helpers do
    def current_user
      @current_user ||= User.get(session[:user_id])
    end
  end

  get '/login' do
    erb :log_in
  end

  post '/login' do
    user = User.authenticate(params[:email], params[:password])
    if user
      session[:user_id] = user.id
      redirect '/'
    else
      flash.now[:errors] = ['The email or password is incorrect']
      erb :log_in
    end
  end

  delete '/sessions' do
    session[:user_id] = nil
    flash.keep[:notice] = 'Goodbye!'
    redirect to '/'
  end

  run! if app_file == $0
end
