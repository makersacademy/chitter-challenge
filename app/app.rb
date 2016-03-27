ENV['RACK_ENV'] ||= 'development'

require 'sinatra/base'
require 'sinatra/flash'
require_relative 'models/data_mapper_setup'
require_relative 'helpers'

class Chitter < Sinatra::Base
  use Rack::MethodOverride
  enable :sessions
  set :session_secret, 'super secret'
  register Sinatra::Flash

  helpers Helpers

  get '/' do
    @peeps = Peep.all
    erb :'peeps/index'
  end

  get '/signup' do
    @user = User.new
    erb :'signup/signup'
  end

  post '/signup' do
    @user = User.new(name:params['name'], username:params['username'],email:params['email'], password:params['password'], password_confirmation:params['password_confirmation'])
    if @user.save
      session[:user_id] = @user.id
      redirect '/'
    else
      flash.now[:notice] = "Passwords did not match."
      erb :'signup/signup'
    end
  end

  get '/signin' do
    erb :'signin/signin'
  end

  post '/signin' do
    user = User.authenticate(params[:username], params[:password])
    if user
      session[:user_id] = user.id
      redirect '/'
    else
      flash.now[:notice] = "Invalid username or password"
      erb :'signin/signin'
    end
  end

  delete '/sessions' do
    session[:user_id] = nil
    redirect '/'
  end

  post '/postpeep' do
    peep = Peep.new(text:params[:new_peep], time:Time.new)
    p peep
    current_user.peeps << peep
    p current_user.peeps
    peep.save
    current_user.save
    p peep
    p current_user.peeps
    redirect '/'
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
