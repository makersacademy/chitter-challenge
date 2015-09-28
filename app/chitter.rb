require 'sinatra/base'
require 'sinatra/flash'
require_relative 'data_mapper_setup.rb'
require_relative './helpers/user.rb'

class Chitter < Sinatra::Base
  enable :sessions
  set :session_secret, 'super secret'

  use Rack::MethodOverride
  register Sinatra::Flash

  include Helpers

  get '/' do
    erb :'index'
  end

  get '/users/new' do
    @user = User.new
    erb :'users/new'
  end

  post '/users' do
    @user = User.create(email:    params[:email],
                        username: params[:username],
                        password: params[:password],
                        password_confirmation: params[:password_confirmation])
    if @user.save
      session[:user_id] = @user.id
      redirect to('/')
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
      redirect to('/')
    else
      flash.now[:errors] = ['The email or password is incorrect']
      erb :'sessions/new'
    end
  end

  delete '/sessions' do
    flash.next[:notice] = 'goodbye!'
    session[:user_id] = nil
    redirect to('/')
  end

  get '/feed' do
    $peeps = Peep.all
    erb :'feed/index'
  end

  get '/feed/new' do
    erb :'feed/new'
  end

  post '/feed' do
    t   =  Time.now
    peep = Peep.new(username: session[:username],
                    content:  params[:content],
                    time:     t.strftime("%b %e, %l:%M %p"))
    peep.save
    redirect('/feed')
  end


  # start the server if ruby file executed directly
  run! if app_file == $0
end
