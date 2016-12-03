ENV['RACK_ENV'] ||= 'development'

require 'sinatra/base'
require 'sinatra/flash'
require_relative 'data_mapper_setup'
require_relative './models/user'
require_relative './models/peep'

class Chitter < Sinatra::Base

  enable  :sessions
  set :session_secret, 'super secret'

  use Rack::MethodOverride

  register Sinatra::Flash

  get '/' do
    @peeps = Peep.all(:order => [ :id.desc ])
    erb :'peeps/index'
  end

  get '/users/new' do
    erb :'users/new'
  end

  post '/users' do
    @user = User.new(email: params[:email], password:params[:password], username: params[:username], name: params[:name])
    if @user.save
      session[:user_id] = @user.id
      redirect '/'
    else
      flash.now[:errors] = @user.errors.full_messages
      erb:'users/new'
    end
  end

  get '/sessions/new' do
    erb :'sessions/new'
  end

  post '/sessions' do
    @user = User.authenticate(params[:email], params[:password])
    if @user
      session[:user_id] = @user.id
      redirect '/'
    else
      flash.now[:errors] = ["Email and/or password were incorrect"]
      erb :'sessions/new'
    end
  end

  delete '/sessions' do
    session[:user_id] = nil
    flash.keep[:notice] = "Thanks for using chitter! Come back soon 🙂"
    redirect '/'
  end

  post '/peeps' do
    Peep.create(content: params[:content], user_id: current_user.id)
    redirect '/'
  end

  get '/peeps/new' do
    if current_user == nil
      redirect '/sessions/new'
    else
      erb :'peeps/new'
    end
  end

  helpers do
    def current_user
      @current_user ||= User.get(session[:user_id])
    end
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
