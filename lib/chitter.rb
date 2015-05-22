require 'sinatra/base'
require 'data_mapper'
require 'rack-flash'

# ----- DATAMAPPER SETUP BEGIN --------#

env = ENV['RACK_ENV'] || 'development'

DataMapper.setup(:default, "postgres://localhost/chitter_#{env}")

require './lib/user'

DataMapper.finalize

DataMapper.auto_upgrade!

# ------ DATAMAPPER SETUP END ---------#

class Chitter < Sinatra::Base
  enable :sessions

  use Rack::Flash

  get '/' do
    erb :index
  end

  get '/users/new' do
    erb :'/users/new'
  end

  post '/users/new' do
    User.create(name: params[:name],
             username: params[:username],
             email: params[:email],
             password: params[:password] )
  end

  get '/sessions/new' do
    erb :'/sessions/new'
  end

  post '/sessions' do
    @user = User.first(:email => params[:email])

    if @user
      session[:user_id] = @user.id
      redirect to('/')
    else
      flash[:notice] = "Sorry"
      erb :'/sessions/new'
    end
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
