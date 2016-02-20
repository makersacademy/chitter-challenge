ENV["RACK_ENV"] ||= "development"

require 'sinatra/base'
require_relative 'models/peep'
require 'sinatra/flash'

# require 'capybara/dsl'
# require 'selenium-webdriver'
#
# include Capybara::DSL
# Capybara.default_driver = :selenium

class Chitter < Sinatra::Base
  use Rack::MethodOverride
  register Sinatra::Flash

  enable :sessions
  set :session_secret, 'super secret'

  get '/peeps' do
    @peeps = Peep.all
    erb :'peeps/index'
  end

  post '/peeps' do
    Peep.create(name: current_user.name, username: current_user.username, text: params[:text], time: "#{Time.now.strftime('%H:%M %d-%b-%y')}")
    redirect to('/peeps')
  end

  get '/peeps/new' do
    erb :'peeps/new'
  end

  post '/peeps/new' do
    redirect to('/peeps/new')
  end

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
    redirect to('/peeps')
  else
    flash.now[:errors] = @user.errors.full_messages
    erb :'users/new'
  end
end

get '/sessions/new' do
  erb :'sessions/new'
end

post '/sessions' do
  user = User.authenticate(params[:email], params[:password])
  if user
    session[:user_id] = user.id
    redirect to('/peeps')
  else
    flash.now[:errors] = ['The email or password is incorrect']
    erb :'sessions/new'
  end
end

delete '/sessions' do
  session[:user_id] = nil
  flash.keep[:notice] = 'goodbye!'
  redirect to '/peeps'
end

helpers do
  def current_user
    @current_user ||= User.get(session[:user_id])
  end
end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
