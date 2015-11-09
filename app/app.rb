ENV['RACK_ENV'] ||= 'development'

require 'sinatra/base'
require_relative 'data_mapper_setup'
require 'sinatra/flash'

# require 'action_view'
# require 'action_view/helpers'
#
# include ActionView::Helpers::DateHelper

class Chitter < Sinatra::Base
  register Sinatra::Flash
  use Rack::MethodOverride
  enable :sessions
  set :session_secret, 'super secret'

  get '/' do
    erb :'links/join_login'
  end

  get '/join' do
    erb :'links/join'
  end

  post '/authentication' do
    user = User.create(username: params[:username],
                       password: params[:password],
                       confirm_password: params[:confirm_password])
    if user.save
      session[:user_id] = user.id
      redirect :'/home'
    else
      flash.now[:errors] = user.errors.full_messages
      erb :'links/join'
    end
  end

  get '/session/new' do
    erb :'links/log_in'
  end

  post '/sessions' do
    username = params[:username]
    password = params[:password]
    user = User.authenticate(username, password)
    if user
      session[:user_id] = user.id
      redirect to('/home')
    else
      flash.now[:notice] = 'Username or password is incorrect'
      erb :'/links/log_in'
    end
  end

  get '/home' do
    erb :'links/home'
  end

  post '/home/save_peeps' do
    user = User.get(session[:user_id])
    peep = Peep.new( text: params[:peep], time: Time.now.strftime("%d/%m/%Y %H:%M") )
    user.peeps << peep
    user.save
    redirect :'/home/peeps'
  end

  get '/home/peeps' do
    @peeps = Peep.all.reverse
    erb :'links/peeps'
  end

  post '/post_peeps' do
    if session[:user_id]
      redirect to('/home')
    else
      flash.now[:notice] = "You need to register if you want to peep"
      erb :'links/join_login'
    end
  end

  delete '/sessions' do
    session[:user_id] = nil
    flash.keep[:notice] = 'goodbye!'
    redirect to '/'
  end

  helpers do
    def current_user
      @current_user ||= User.get(session[:user_id])
    end
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
