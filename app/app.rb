ENV['RACK_ENV']||= "development"

require 'dm-postgres-adapter'
require 'sinatra/base'
require 'sinatra/flash'
require_relative 'data_mapper_setup'
require 'bcrypt'
# require_relative 'models/user'

class Chitter < Sinatra::Base
  use Rack::MethodOverride
  enable :sessions
  set :session_secret, 'super secret'
  set :method_override, true
  register Sinatra::Flash


  helpers do
    def current_user
      @current_user ||= User.get(session[:user_id])
    end

    def get_username(peep)
      @username = User.get(peep.created_by)
    end
  end

  get '/' do
    @peeps = Peep.all(order: [:created_at.desc])
    @title = "Hello"
    erb(:home)
  end

  get '/sessions/new' do
    @title = 'Sign-in'
    erb(:'sessions/new')
  end

  post '/sessions' do
    @user = User.authenticate(params[:email], params[:password])
    if @user
      session[:user_id] = @user.id
      redirect to('/')
    else
      flash.now[:errors] = ['The email or password is incorrect']
      erb(:'sessions/new')
    end
  end

  delete '/sessions' do
      session[:user_id] = nil
      flash.keep[:notice] = 'Over and Out!'
      redirect to('/')
  end


  get '/users/new' do
    @title = 'Sign-up'
    @user = User.new
    erb(:'users/new')
  end

  post '/users' do
    @user = User.new(username: params[:username],
                     email: params[:email],
                     password: params[:password],
                     password_confirmation: params[:password_confirmation])
    if @user.save
      session[:user_id] = @user.id
      redirect to('/')
    else
      flash.now[:errors] = @user.errors.full_messages
      erb(:'/users/new')
    end
  end

  post '/peep/new' do
    current_user.peeps.create(peep: params[:peep],
                       created_at: DateTime.now)
    redirect to('/')
  end

  post '/peep/comment' do
    peep = Peeps.get(params[:id])
    comment = Comment.create(body: params[:peep],
                       created_at: DateTime.now)
    peep.comments << comment
    peep.save
    redirect to('/')
  end



end
