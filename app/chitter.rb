require 'sinatra/base'
require './app/models/peep'
require './app/data_mapper_setup'
require 'data_mapper'
require 'sinatra/flash'

class Chitter < Sinatra::Base

use Rack::MethodOverride
  
set :views, proc { File.join(root, '..', 'views') }

enable :sessions
set :session_secret, 'super secret'

register Sinatra::Flash

  get '/' do
    erb :index
  end

  get '/peeps' do
    @peeps = Peep.all
    erb :'peeps/index'
  end

  post '/peeps' do
    Peep.create(content: params[:content], time: peep_time, user: current_user)
    redirect to('/peeps')
  end

  get '/peeps/new' do
    erb :'peeps/new'
  end

  get '/users/new' do
    @user = User.new
    erb :'users/new'
  end

  post '/users' do
    @user = User.new(email: params[:email],
                password: params[:password],
                password_confirmation: params[:password_confirmation],
                username: params[:username],  
                name: params[:name]
                )
    if @user.save
      session[:user_id] = @user.id
      redirect to('/peeps')
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
        redirect to('/peeps')
      else
        flash.now[:errors] = ['The username or password is incorrect']
        erb :'sessions/new'
      end
  end

  delete '/sessions' do
    session.clear
    flash[:notice] = 'Goodbye!'
    redirect '/sessions/new'
  end

  get '/password_reset' do
    erb :'users/password_reset'
  end

  post 'users/password_reset' do
    user = User.first(email: params[:email])
    user.password_token = generate_token
    user.save
    # SendResetEmail.call(user)
    erb :'users/recovery_sent'
  end

  helpers do

    def peep_time
      Time.now.strftime("%d/%m/%Y %H:%M")
    end

    def generate_token
      "1t2ok3e4n5"
    end

    def current_user
      user ||= User.get(session[:user_id])
    end
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
