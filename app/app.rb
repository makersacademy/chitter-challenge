ENV["RACK_ENV"] ||= "development"

require 'sinatra/base'
require 'sinatra/flash'

require_relative 'datamapper_setup'

EMAIL_REGEX = /\A([\w+\-].?)+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i

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
    erb :index
  end

  get '/signup' do
    if session[:email].nil?
      erb :signup
    else
      @email = session[:email]
      erb :signup
    end
  end

  post '/registration' do
    user = User.new(name: params[:name],
                    username: params[:username],
                    email: params[:email],
                    password: params[:password],
                    password_confirmation: params[:confirm_password])
    if user.save
      session[:user_id] = user.id
      redirect '/chat'
    else
      flash[:mismatch] ='Password and confirmation password do not match' if params[:password] != params[:confirm_password]
      flash[:missing_email] = 'No email entered' if params[:email].empty?
      flash[:invalid_email] = 'Invalid email entered' if !(params[:email] =~ EMAIL_REGEX)
      flash[:duplicate_email] = 'This email is already in use'
      session[:email] = params[:email]
      redirect '/signup'
    end
  end

  get '/login' do
    erb :login
  end

  post '/sessions' do
    user = User.authenticate(params[:email], params[:password])
    if user
      session[:user_id] = user.id
      redirect '/chat'
    else
      flash[:fail_login] = 'The email or password is incorrect'
      erb :login
    end
  end

  get '/chat' do
    @user  = current_user
    @peeps = Peep.all.reverse
    erb :chat
  end

  post '/peeping' do
    Peep.create(content: params[:peep], user: current_user)
    redirect '/chat'
  end

  delete '/sessions' do
    session[:user_id] = nil
    flash.keep[:notice] = 'Bye! Come again soon.'
    redirect '/'
  end

  run! if app_file == $0
end
