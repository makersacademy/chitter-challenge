ENV["RACK_ENV"] ||= "development"
require 'sinatra/base'
require_relative 'data_mapper_setup'
require 'sinatra/flash'

class Chitter < Sinatra::Base
  use Rack::MethodOverride

  register Sinatra::Flash

  enable :sessions
  set :session_secret, 'super secret'

  helpers do
    def current_user
      @current_user ||= User.get(session[:user_id])
    end
  end

  get '/' do
    redirect '/users/new'
  end

  get '/users/new' do
    @user = User.new
    erb :'users/new'
  end

  post '/users' do
    @user = User.new(email: params[:email],
                        password: params[:password],
                        password_confirmation: params[:password_confirmation],
                        name: params[:name],
                        user_name: params[:user_name])
    if @user.save
      session[:user_id] = @user.id
      redirect to('/peeps')
    else
      flash.now[:notice] = 'Passwords do not match!'
      erb :'users/new'
    end
  end

  get '/peeps' do
    erb :peeps
  end

  post '/peeps' do
    @peep = Peep.new(params[:peep_text])
    # @peeps = []
    # @peeps << peep
    erb :peeps
  end

  post '/sessions' do
    user = User.authenticate(params[:email], params[:password])
    if user
      "it did authenticate"
      session[:user_id] = user.id
      redirect to('/peeps')
    else
      "it didn't authenticate"
    end
  end

  get '/sessions/new' do
    erb :'sessions/new'
  end

  delete '/sessions' do
    session[:user_id] = nil
    flash.keep[:notice] = "goodbye!"
    redirect to '/peeps'
  end

  run! if app_file == $0

end
