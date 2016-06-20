ENV["RACK_ENV"] ||= "development"

require 'sinatra/base'
require 'sinatra/flash'

require_relative 'data_mapper_setup'
require_relative 'models/user'
require_relative 'models/peep'

class Chitter < Sinatra::Base

  register Sinatra::Flash
  use Rack::MethodOverride

  enable :sessions
  set :session_secret, 'super secret'

  get '/' do
    erb(:index)
  end

  get '/users/new' do
    erb(:'users/new')
  end

  post '/users/new' do
    @user = User.create(name: params[:name],
                email: params[:email],
                password: params[:password],
                password_confirmation: params[:password_confirmation])
    
    if @user.save
      session[:user_id] = @user.id
      redirect('/users')
    else
      flash.now[:errors] = @user.errors.full_messages
      erb(:'users/new')
    end
  end

  get '/users' do
    erb(:'users/index')
  end

  get '/sessions/new' do
    erb(:'sessions/new')
  end

  post '/sessions/new' do
    user = User.authenticate(params[:email], params[:password])
    if user
      session[:user_id] = user.id
      redirect to('/users')
    else
      flash.now[:errors] = ['The email or password is incorrect']
      erb(:'sessions/new')
    end
  end

  delete '/sessions/new' do
    session[:user_id] = nil
    flash.keep[:notice] = 'Goodbye!'
    redirect to('/')
  end

  get '/peep/new' do
    erb(:'peeps/new')
  end

  post '/peep/new' do
    peep = Peep.new(content: params[:peep])
    user = User.get(session[:user_id])
    peep.user = user
    peep.save
    redirect('/peeps')
  end

  get '/peeps' do
    @peeps = Peep.all
    erb(:'peeps/index')
  end

  helpers do
    def current_user
      @current_user ||= User.get(session[:user_id])
    end
  end

  run! if app_file == $0

end