ENV['RACK_ENV'] ||= 'development'

require 'sinatra/base'
require 'sinatra/flash'
require 'data_mapper'
require 'pry'
require_relative 'models/user.rb'
require_relative 'models/peep.rb'
require_relative 'data_mapper_setup.rb'

class Chitter < Sinatra::Base

  use Rack::MethodOverride
  register Sinatra::Flash

  enable :sessions
  set :session_secret, 'super secret'

  get '/' do
    @peeps = Peep.all.reverse
    erb :'peep/board'
  end

  get '/session/new' do
    erb :'session/new'
  end

  post '/existing_user' do
    user = User.authenticate(params[:user_name], params[:password])
      if user
        session[:user_id] = user.id
        redirect '/'
      else
        flash.next[:error_1] = "Your details are incorrect, please try again or sign up"
        redirect '/session/new'
      end
  end

  get '/user/new' do
    erb :'user/new'
  end

  post '/user/new' do
    @user = User.new(name: params[:name],
             user_name: params[:user_name],
             email: params[:email],
             password: params[:password],
             password_confirmation: params[:password_confirmation])
    if @user.save
      session[:user_id] = @user.id
      session[:user_name] = @user.user_name
      redirect '/peep/new'
    else
      flash.next[:error_2] = "Please try again"
      redirect '/user/new'
    end
  end

  get '/peep/new' do
    if session[:user_id] == nil
      flash.next[:error_3] = "Please Log in First"
      redirect '/session/new'
    else
      erb :'peep/new'
      end
  end

  post '/peep' do
    @peeps = Peep.create(peep: params[:peep], user_name: session[:user_name])
    redirect '/'
  end

  get '/peep/oldest_first' do
    @peeps = Peep.all
    erb :'peep/board'
  end

  delete '/session' do
    session[:user_id] = nil
    redirect to '/session/new'
  end

  helpers do
   def current_user
     @current_user ||= User.get(session[:user_id])
   end
  end


  # start the server if ruby file executed directly
  run! if app_file == $0
end
