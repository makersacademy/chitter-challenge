require 'sinatra/base'
require 'data_mapper'
require 'rack-flash'

env = ENV['RACK_ENV'] || 'development'

DataMapper.setup(:default, "postgres://localhost/chittter_#{env}")

require './lib/user'
require './lib/peep'

DataMapper.finalize
DataMapper.auto_upgrade!

class Chittter < Sinatra::Base
  enable :sessions
  use Rack::Flash
  use Rack::MethodOverride

  def welcome
    @who_to_welcome = "Welcome, #{session[:username]}" if session[:username]
  end

  get '/' do
    welcome
    erb :index
  end

  get '/users/new' do
    erb :'users/new'
  end

  post '/users' do
    user = User.create(email: params[:email],
                password: params[:password],
                password_confirmation: params[:password_confirmation],
                name: params[:name],
                username: params[:username])
    if user.save
      session[:username] = params[:name]
      redirect to('/')
    else
      flash[:errors] = user.errors.full_messages
     # flash[:message] = 'email or password is incorrect'
      erb :'users/new'
    end
  end

  get '/sessions/new' do
    erb :'sessions/new'
  end

  post '/sessions' do
    email, password = params[:email], params[:password]
    user = User.authenticate(email, password)
    if user
      session[:username] = user.username
      redirect('/')
    else
      flash[:message] = 'email or password is incorrect'
      redirect('/sessions/new')
    end
  end

  delete '/sessions' do
    session[:username] = nil
    flash[:notice] = 'you have logged out successfully'
    redirect('/')
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
