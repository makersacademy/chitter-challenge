ENV['RACK_ENV'] ||= 'development'
require 'sinatra/base'
require_relative './models/user'
require 'pry'
require 'sinatra/flash'

class Chitter < Sinatra::Base
  enable :sessions
  set :session_secret, 'super secret'
  set(:cookie_options) do
    { :expires => Time.now + 3600 }
  end
  register Sinatra::Flash
  use Rack::MethodOverride

  helpers do
    def current_user
      @current_user ||= User.get(session[:user_id])
    end
 end

  get '/' do
    erb :first_page
  end

  get '/sign_up' do
    erb :sign_up
  end

  get '/log_in/new' do
    erb :log_in
  end

  post '/log_in' do
    user = User.authenticate(params[:username],params[:password])
    if user
      session[:user_id] = user.id
      erb :user
    else
      flash[:errors] = ['The email or password is incorrect']
      redirect 'log_in/new'
    end
  end

  delete '/users' do
    session[:user_id] = nil
    flash[:errors] = ['Bye']
    redirect to '/'
  end

  post '/users' do
    user = User.new(email: params[:email], name: params[:name], password: params[:password], username: params[:username])
    if user.save
      session[:user_id] = user.id
      erb :user
    else
      flash[:errors] = user.errors.full_messages
      redirect '/sign_up'
    end
  end

  get '/peeps/new' do
    erb :new_peep
  end

  post '/peeps' do
    if session[:user_id] != nil
      current_user.peeps << Peep.create(body: params[:peep], name: current_user.name, username: current_user.username)
      @peep = Peep.all
      current_user.save
      erb :show_peep
    else
      flash[:errors] = ['You are not logged in']
      redirect '/peeps/new'
    end

  end

  get '/all_peeps' do
    erb :show_all_peeps
  end
  # start the server if ruby file executed directly
  run! if app_file == $0
end
