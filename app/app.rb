ENV["RACK_ENV"] ||= "development"

require 'sinatra/base'
require 'sinatra/flash'
require_relative 'models/peep'
require_relative 'data_mapper_setup'

class Chitter < Sinatra::Base
  register Sinatra::Flash
  enable :sessions
  set :session_secret, 'super secret'
  use Rack::MethodOverride


  get '/peeps' do
    @peeps = Peep.all
    erb :'peeps/index'
  end

  get '/peeps/new' do
    erb :'peeps/new'
  end

  post '/peeps/add' do
    redirect '/peeps/new'
  end

  post '/peeps' do
    Peep.create(peep_content: params[:peep_content], created_at: Time.now)
    redirect '/peeps'
  end

  get '/users/new' do
    @user = User.new
    erb :'users/new'
  end

  post '/users' do
    @user = User.create(email: params[:email], handle: params[:handle], password: params[:password], password_confirmation: params[:password_confirmation])
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
    user = User.authenticate(params[:email], params[:password])
 if user
   session[:user_id] = user.id
   redirect to('/peeps')
 else
   flash.now[:errors] = ['The email or password is incorrect']
   erb :'sessions/new'
 end
  end

  delete '/sessions' do
    session[:user_id] = nil
    flash.keep[:notice] = 'goodbye!'
    redirect to '/goodbye'
  end

  get '/goodbye' do
    erb :'sessions/goodbye'
  end

  helpers do
    def current_user
      @current_user ||= User.get(session[:user_id])
    end
  end


  # start the server if ruby file executed directly
  run! if app_file == $0
end
