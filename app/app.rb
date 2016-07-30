ENV['RACK_ENV'] ||= 'development'

require 'sinatra/base'
require 'sinatra/flash'
require_relative 'datamapper_setup'
require_relative 'models/user'
require_relative 'models/peep'

class Chitter < Sinatra::Base

  enable :sessions
  set :session_secret, 'super secret'

  use Rack::MethodOverride

  register Sinatra::Flash

  get '/' do
    erb :index
  end

  get '/users/new' do
    @users = User.new
    erb :'users/new'
  end

  post '/users' do
    @user = User.new(username: params[:username],
                    name: params[:name],
                    email: params[:email],
                    password: params[:password],
                    confirm_password: params[:confirm_password])
    if @user.save
      session[:user_id] = @user.id
      redirect to '/users/new' #/peeps
    else
      flash.now[:errors] = @user.errors.full_messages
      erb :'users/new'
    end
  end

  get '/sessions/new' do
    erb :'sessions/new'
  end

  post '/sessions' do
    user = User.authenticate(params[:username], params[:password])
    if user
      session[:user_id] = user.id
      redirect to '/users/new' #/peeps
    else
      flash.now[:errors] = ['The username or password is incorrect']
      erb :'sessions/new'
    end
  end

  get '/peeps' do
    @peeps = Peeps.all
    erb :'peeps/index'
  end

  get 'peeps/new' do
    erb :'peeps/new'
  end

  post '/peeps' do
    peep = Peep.create(title: params[:title], message: params[:message])
  end

  delete '/sessions' do
    session[:user_id] = nil
    flash.keep[:notice] = 'Goodbye!'
    redirect to '/users/new' #/peeps
  end

  helpers do
    def current_user
      @current_user ||= User.get(session[:user_id])
    end
  end


  # start the server if ruby file executed directly
  run! if app_file == $0
end
