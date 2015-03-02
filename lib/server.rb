require 'data_mapper'
require 'sinatra/base'
require 'rack-flash'

env = ENV['RACK_ENV'] || 'development'

DataMapper.setup(:default, "postgres://localhost/chitter_challenge_#{env}")

require './lib/peep'
require './lib/user'

DataMapper.finalize

DataMapper.auto_upgrade!

class ChitterChallenge < Sinatra::Base

  use Rack::Flash
  use Rack::MethodOverride

  helpers do
    def current_user
      @current_user ||=User.get(session[:user_id]) if session[:user_id]
    end
  end

  enable :sessions
  set :session_secret, 'super secret'
  set :root, File.dirname(__FILE__)
  set :public_folder, Proc.new {File.join(root, '../public')}

  get '/' do
    @peeps = Peep.all
    erb :index
  end

  post '/peeps' do
    if current_user
      text = params["text"]
      current_user.peeps.create(:text => text)
      redirect to('/')
    else
      redirect to('/sessions/new')
    end
  end

  get '/users/new' do
    @user = User.new
    erb :"users/new"
  end

  post '/users' do
    @user = User.create(:email => params[:email],
                :password => params[:password],
                :password_confirmation => params[:password_confirmation],
                :username => params[:username])
    if @user.save
      session[:user_id] = @user.id
      redirect to('/')
    else
      flash.now[:errors] = @user.errors.full_messages
      erb :"users/new"
    end
  end

  get '/sessions/new' do
    erb :"sessions/new"
  end

  post '/sessions' do
    email, username, password = params[:email], params[:username], params[:password]
    user = User.authenticate(email, username, password)
    if user
      session[:user_id] = user.id
      redirect to('/')
    else
      flash.now[:errors] = ["The email or password is incorrect"]
      erb :"sessions/new"
    end
  end

  delete '/sessions' do
    session[:user_id] = nil
    redirect to('/')
  end
end
