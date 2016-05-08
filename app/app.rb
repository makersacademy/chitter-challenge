ENV["RACK_ENV"] ||= "development"

require 'sinatra/base'
require 'sinatra/flash'
require_relative 'models/user'
require_relative 'models/peep'
require_relative 'data_mapper_setup'
require 'pusher'

class Chitter < Sinatra::Base

  use Rack::MethodOverride
  register Sinatra::Flash
  enable :sessions
  set :session_secret, 'super secret'

  pusher_client = Pusher::Client.new(app_id: '204658',
                                    key: '7cd62ab4902ea90bda04',
                                    secret: '4069235b1c1912703c84',
                                    cluster: 'eu',
                                    encrypted: true
                                    )

pusher_client.trigger('test_channel', 'my_event', {
                      message: 'hello world'
                      })

  helpers do
    def current_user
      @current_user ||= User.get(session[:user_id])
    end
  end

  get '/' do
    @peeps = Peep.all
    erb :index
  end

  get '/users/new' do
    @user = User.new
    erb :'users/new'
  end

  post '/users/new' do
    @user = User.create(name: params[:name],
                        username: params[:username],
                        email: params[:email],
                        password: params[:password],
                        password_confirmation: params[:password_confirmation])
    if @user.save
      session[:user_id] = @user.id
      redirect '/users/registered'
    else
      flash.now[:errors] = @user.errors.full_messages
      erb :'users/new'
    end

  end

  get '/peeps/new' do
    @peep = Peep.new
    erb :'peeps/new'
  end

  post '/peeps' do
    time = Time.now.strftime('%H:%M %d/%m/%Y')
    @peep = Peep.create(message: params[:message],
                        username: current_user.username,
                        time: time)
    @peep.save
    redirect to('/')
  end

  get '/users/registered' do
    erb :'users/registered'
  end

  get '/sessions/new' do
    erb :'sessions/new'
  end

  post '/sessions' do
    user = User.authenticate(params[:username], params[:password])
    if user
      session[:user_id] = user.id
      redirect to('/')
    else
      flash.now[:login_error] = ['The username or password is incorrect']
      erb :'sessions/new'
    end
  end

  delete '/sessions' do
    session[:user_id] = nil
    flash.keep[:goodbye] = 'See ya later!'
    redirect to '/'
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
