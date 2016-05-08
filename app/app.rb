ENV["RACK_ENV"] ||= "development"

require 'sinatra/base'
require 'sinatra/flash'
require_relative 'models/user'
require_relative 'models/peep'
require_relative 'data_mapper_setup'

class Chitter < Sinatra::Base
  use Rack::MethodOverride
  enable :sessions
  set :session_secret, 'super secret'

  register Sinatra::Flash

  helpers do
    def current_user
      @current_user ||= User.get(session[:user_id])
    end
  end

  get '/' do
    redirect 'peeps'
  end

  #sign up
  get '/users/new' do
    @user = User.new
    erb :'users/new'
  end

  post '/users' do
    @user = User.new(email: params[:email],
                     name: params[:name],
                     username: params[:username],
                     password: params[:password],
                     password_confirmation: params[:password_confirmation])
    if @user.save
      session[:user_id] = @user.id
      redirect '/peeps'
    else
      flash.now[:errors] = @user.errors
      erb :'users/new'
    end
  end

  #log in
  get '/sessions/new' do
    erb :'sessions/new'
  end

  post '/sessions' do
    user = User.authenticate(params[:email], params[:password])
    if user
      session[:user_id] = user.id
      redirect '/peeps'
    else
      flash.now[:errors] = ['The email or password is incorrect']
      erb :'sessions/new'
    end
  end

  #log out
  delete '/sessions' do
    session[:user_id] = nil
    flash.keep[:notice] = 'Goodbye!'
    redirect '/peeps'
  end

  #user's homepage
  get '/peeps' do
    @peeps = Peep.all.sort {|peep1, peep2| peep2.created_at <=> peep1.created_at}
    erb :'peeps/peeps'
  end

  #posting a new peep
  post '/peeps' do
    peep = Peep.new(content: params[:content])
    current_user.peeps << peep
    peep.save
    redirect '/peeps'
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
