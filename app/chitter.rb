require 'sinatra/base'
require 'data_mapper'
require 'rack-flash'
require 'sinatra/partial'
require_relative 'data_mapper_setup'

class Chitter < Sinatra::Base

  register Sinatra::Partial
  set :partial_template_engine, :erb
  enable :sessions
  set :session_secret, 'super_secret'
  use Rack::Flash
  use Rack::MethodOverride

  get '/' do
    @peeps = Peep.all
    erb :index
  end

  post '/' do
    @peep = Peep.new(content: params[:msg],
                     user: User.first(id: session[:user_id]))
    if @peep.save
      redirect to('/')
    else
      flash.now[:errors] = ['Sorry! Please sign in to Peep!']
      erb :index
    end
  end

  get '/users/new' do
    @user = User.new
    erb :'users/new'
  end

  post '/users' do
    @user = User.new(name: params[:name],
                     username: params[:handle],
                     password: params[:password],
                     password_confirmation: params[:password_confirmation],
                     email: params[:email])
    if @user.save
      # session[:user_id] = @user.id
      flash[:notice] = "Welcome #{@user.name}, your account #{@user.handle} has been created"
      redirect to('/')
    else
      flash.now[:errors] = @user.errors.full_messages
      erb :'/users/new'
    end
  end

  get '/chit/new' do
    erb :'chit/new'
  end

  delete '/chit' do
    @user = session[:user_id]
    session[:user_id] = nil
    flash[:notice] = "#{User.first(id: @user).handle} is now logged out"
    redirect '/'
  end

  post '/chit' do
    email, password = params[:email], params[:password]
    user = User.authenticate(email, password)
    if user
      session[:user_id] = user.id
      flash[:notice] = "Welcome #{user.name}, your account #{user.handle} is ready to send a Peep!"
      redirect to('/')
    else
      flash[:errors] = ['The email or password is incorrect, no peeps for you!']
      erb :'chit/new'
    end
  end

  helpers do
    def maker
      @maker ||= User.get(session[:user_id]) if session[:user_id]
    end
  end

  # start the server if ruby file executed directly
  run! if app_file == $PROGRAM_NAME

end
