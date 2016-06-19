ENV["RACK_ENV"] ||= "development"

require 'sinatra/base'
require 'sinatra/flash'


require_relative 'data_mapper_setup'

class Chitter < Sinatra::Base

  use Rack::MethodOverride
  register Sinatra::Flash

  enable :sessions
  set :session_secret, 'super secret'

  TIME_FORMAT = '%H:%M %d/%m/%y'

  get '/' do
    redirect('/peeps')
  end

  get '/peeps' do
    @peeps = Peep.all.reverse
    erb(:'peeps/index')
  end

  get '/peeps/new' do
    if current_user
      erb(:'peeps/new')
    else
      redirect('/')
    end
  end

  post '/peeps' do
    peep = Peep.new(message: params[:message], time: Time.now.strftime(TIME_FORMAT))
    current_user.peeps << peep
    current_user.save
    redirect('/peeps')
  end

  get '/users/new' do
    @user = User.new
    erb(:'users/new')
  end

  post '/users' do
    @user = User.new(name: params[:name],
                     username: params[:username],
                     email: params[:email],
                     password: params[:password],
                     password_confirmation: params[:password_confirmation])
    if @user.save
      session[:user_id] = @user.id
      redirect('/')
    else
      flash.now[:errors] = @user.errors.full_messages
      erb(:'users/new')
    end
  end

  get '/sessions/new' do
    erb(:'sessions/new')
  end

  post '/sessions' do
    user = User.authenticate(params[:username], params[:password])
    if user
      session[:user_id] = user.id
      redirect to('/peeps')
    else
      flash.now[:errors] = ['The email or password is incorrect']
      erb(:'sessions/new')
    end
  end

  delete '/sessions' do
    session[:user_id] = nil
    flash.keep[:notice] = 'Goodbye'
    redirect('/')
  end

  helpers do
    def current_user
      @current_user ||= User.get(session[:user_id])
    end
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
