ENV["RACK_ENV"] ||= "development"

require 'sinatra/base'
require 'sinatra/flash'

require_relative 'datamapper_setup'

class Chitter < Sinatra::Base

  enable :sessions
  set    :session_secret, 'super secret'

  register Sinatra::Flash

  use Rack::MethodOverride

  helpers do
    def current_user
      @current_user ||= User.get(session[:user_id])
    end
  end

  get '/' do
    @peeps = Peep.all(limit: 4, order: [ :created_at.desc ])
    erb :'/index'
  end

  get '/users/new' do
    if session[:email].nil?
      erb :'/users/new'
    else
      @email = session[:email]
      erb :'/users/new'
    end
  end

  post '/users' do
    user = User.new(name: params[:name],
                    username: params[:username],
                    email: params[:email],
                    password: params[:password],
                    password_confirmation: params[:confirm_password])
    if user.save
      session[:user_id] = user.id
      redirect '/peeps'
    else
      flash[:errors] = user.errors.full_messages
      session[:email] = params[:email]
      redirect '/users/new'
    end
  end

  get '/sessions/new' do
    erb :'/sessions/new'
  end

  post '/sessions' do
    user = User.authenticate(params[:email], params[:password])
    if user
      session[:user_id] = user.id
      redirect '/peeps'
    else
      flash[:authenticate] = 'Your email or password is incorrect.'
      erb :'/sessions/new'
    end
  end

  get '/peeps' do
    @user  = current_user
    @peeps = Peep.all.reverse
    erb :peeps
  end

  post '/peeps/new' do
    Peep.create(content: params[:peep], user: current_user)
    redirect '/peeps'
  end

  delete '/sessions' do
    session[:user_id] = nil
    flash.keep[:notice] = 'Bye! Come again soon.'
    redirect '/'
  end

  run! if app_file == $0
end
