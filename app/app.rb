require 'sinatra/base'
require 'sinatra/flash'
require_relative 'models/user'
require_relative 'models/peep'

ENV["RACK_ENV"] ||= "development"

class Chitter < Sinatra::Base
  use Rack::MethodOverride
  register Sinatra::Flash
  enable :sessions
  set :sessions_secret, 'super secret'

  get '/peeps' do
    @peeps = Peep.all.sort_by { |a, b| a.time <=> b.time }
    erb :'peeps/index'
  end

  get '/peeps/new' do
    erb :'peeps/new'
  end

  post '/peeps' do
    Peep.create(post: params[:peep], time: Time.now)
    redirect '/peeps'
  end

  get '/users/new' do
    erb :'users/new'
  end

  get '/sessions/new' do
    erb :'sessions/new'
  end

  get '/users/out' do
    erb :'users/out'
  end

  delete '/sessions' do
    session[:user_id] = nil
    flash.keep[:notice] = 'Cheerio!'
    redirect to '/sessions/new'
  end

  post '/sessions' do
    user = User.authenticate(params[:email],
                             params[:password])
    if user
      session[:user_id] = user.id
      redirect to('/sessions/new')
    else
      flash.now[:notice] = 'The email or password is incorrect'
      erb :'sessions/new'
    end
  end

  post '/users' do
    @user = User.create(email: params[:email],
                        password: params[:password],
                        username: params[:username],
                        name: params[:name])
    session[:user_id] = @user.id
    redirect to('/users/new')
  end

  helpers do
    def current_user
      @current_user ||= User.get(session[:user_id])
    end
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
