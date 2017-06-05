ENV['RACK_ENV'] ||= 'development'

require 'sinatra/base'
require 'sinatra/flash'
require_relative 'data_mapper_setup'
TIME_FORMAT = '%e-%b-%Y %I:%M:%S %p'

class Chitter < Sinatra::Base
  enable :sessions
  register Sinatra::Flash
  use Rack::MethodOverride
  set :session_secret, 'super secret'
  set :public_folder, Proc.new { File.join(root, 'static') }

  helpers do
    def current_user
      @current_user ||= User.get(session[:user_id])
    end
  end

  get '/' do
    redirect '/peeps'
  end

  get '/peeps' do
    @peeps = Peep.all
    erb :'/peeps/index'
  end

  post '/peeps' do
    @peep = Peep.new(message: params[:message],
                    created_at: Time.now)
    if current_user
      @peep.user_id = session[:user_id]
      @peep.save
    else
      flash.now[:errors] = @peep.errors.full_messages
    end
      redirect to'/peeps'
  end

  get '/users/new' do
    @user = User.new
    erb :'users/new'
  end

  post '/users' do
    @user = User.new(email: params[:email],
              password: params[:password],
              name: params[:name],
              username: params[:username])

    if @user.save  #save returns true/false depending on whether the model is successfully saved to the database.
      session[:user_id] = @user.id
      redirect to('/peeps')
      # if it's not valid,
      # we'll render the sign up form again
    else
      flash.now[:errors] = @user.errors.full_messages
      erb :'users/new'
    end
  end

  get '/sessions/new' do
    erb :'sessions/new'
  end

  post '/sessions' do
    @user = User.authenticate(params[:email], params[:password])
    if @user
      session[:user_id] = @user.id
      redirect to('/peeps')
    else
      flash.now[:errors] = ['The email or password is incorrect']
      erb :'sessions/new'
    end
  end

  delete '/sessions' do
    flash.now[:notice] = ['Goodbye!']
  end

  run! if app_file == $0
end
