ENV["RACK_ENV"] ||= 'development'

require 'sinatra/base'
require 'sinatra/flash'
require_relative 'data_mapper_setup'

class Chitter  < Sinatra::Base

  use Rack::MethodOverride
  register Sinatra::Flash

  enable :sessions
  set :session_secret, 'super secret'

  get '/' do
    redirect '/users/new'
  end

  get '/users/new' do
    @user = User.new
    erb :user
  end

  post '/users' do
    @user = User.new(email: params[:email],
                   password: params[:password],
                   password_confirmation: params[:password_confirmation],
                   name: params[:name],
                   user_name: params[:user_name] )
    if @user.save
        session[:user_id] = @user.id
        redirect '/peep/index'
    else
        flash.now[:errors] = @user.errors.full_messages
       erb :user
    end
  end

  get '/signin/new' do
    erb :signin
  end

  post '/signin' do

    user = User.authenticate(params[:email], params[:password])
    if user
      session[:user_id] = user.id
      redirect '/peep/index'
    else
      flash.now[:errors] = ['The email or password is incorrect']
      erb :signin
    end
  end

  get '/peep/index' do
    @peeps = Peep.all
    erb :index
  end

  get '/peep/new' do
    erb :peep
  end

  post '/peep' do
    peep = Peep.create(message: params[:text])
    redirect to 'peep/index'
  end

  delete '/sessions' do
    session[:user_id] = nil
    flash.keep[:notice] = 'goodbye!'
    redirect  '/'
  end

  helpers do
    def current_user
      @current_user ||= User.get(session[:user_id])
    end
  end

  # start the server if ruby file executed directly
  run! if app_file == $0

end
