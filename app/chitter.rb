require 'sinatra/base'
require_relative "../data_mapper_setup"
require_relative "./models/user"
require_relative "./models/peep"
require 'sinatra/session'
require 'sinatra/flash'

class Chitter < Sinatra::Base

  enable :sessions
  set :session_secret, 'super secret'
  register Sinatra::Flash
  use Rack::MethodOverride

  get '/' do
    erb :index
  end

  get '/users/new' do

    @user = User.new
    erb :'users/new'
  end
  #
  post '/users' do
    @user = User.new(email: params[:email],
                     password:     params[:password],
                     first_name:   params[:first_name],
                     last_name:    params[:last_name],
                     username:     params[:username])
    if @user.save
      session[:user_id] = @user.id
      redirect to('/')
    else
      flash.now[:errors] = @user.errors.full_messages
      erb :'users/new'
    end
  end

  helpers do
    def current_user
      User.get(session[:user_id])
    end
  end

  get '/sessions/new' do
    # session.clear
    erb :'sessions/new'
  end

  post '/sessions' do
    user = User.authenticate(params[:email], params[:password])
    if user
      session[:user_id] = user.id
      redirect to('/')
    else
      flash.now[:errors] = ['The email or password is incorrect']
      erb :'sessions/new'
    end
  end

  delete '/sessions' do
    session[:user_id] = nil
    flash.now[:notice] = 'You have logged out'
    erb :'/sessions/new'
  end

  get '/peeps' do
    @peeps = Peep.all
    erb :'peeps/index'
  end

  get '/peeps/new_peep' do
    # @peep = Peep.new
    erb :'peeps/new_peep'
  end

  post '/peeps' do
    timestamp = Time.now.strftime('%Y-%m-%d_%H-%M-%S')
    @peep = Peep.new(user_id: params[:user_id],
                     text: params[:text],
                     timestamp: timestamp)
    if @peep != "" && !session[:user_id].nil?
      @peep.save
      redirect to('/peeps')
    elsif @peep != ""
      flash.now[:errors] = ['Please log in or register to create a peep']
    else
      flash.now[:errors] = @peep.errors.full_messages
      erb :'peeps/new_peep'
    end
  end

  # start the server if ruby file executed directly
  run! if app_file == $PROGRAM_NAME

end
