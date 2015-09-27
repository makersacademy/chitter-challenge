require 'sinatra/base'
require_relative 'data_mapper_setup'
require_relative 'helper/current_user'
require 'sinatra/flash'

class Chitter < Sinatra::Base
  include Helpers

  use Rack::MethodOverride

  register Sinatra::Flash
  register Sinatra::Partial

  enable :sessions, :static
  enable :partial_underscores

  set :session_secret, 'super secret'
  set :partial_template_engine, :erb

  get '/' do
    erb :'index'
  end

  get '/users/new' do
    @user = User.new
    erb :'users/new'
  end

  post '/users' do
    @user = User.new(name: params[:name],
                     username: params[:username],
                     email: params[:email],
                     password: params[:password],
                     password_confirmation: params[:password_confirmation])
    if @user.save
      session[:user_id] = @user.id
      session[:username] = @user.username
      redirect to('/')
    else
      flash.now[:errors] = @user.errors.full_messages
      erb :'/users/new'
    end
  end

  get '/sessions/new' do
    @user = User.new
    erb :'sessions/new'
  end

  post '/sessions/new' do
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
    flash.now[:notice] = "Goodbye!"
    erb :'sessions/goodbye', :layout => false
  end

  get '/peeps' do
    @peeps = Peep.all
    erb :'peeps/peeps'
  end

  post '/peeps' do
    peep = Peep.new(username: session[:username],
                    peep: params[:peep],
                    created_at: Time.now)
    peep.user = current_user
    peep.save
    redirect to('/peeps')
  end

  get '/peeps/new' do
    @peeps = Peep.all
    erb :'peeps/new'
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
