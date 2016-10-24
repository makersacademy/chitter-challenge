ENV["RACK_ENV"] ||=  "development"
require 'sinatra/base'
require "sinatra/flash"
require_relative 'data_mapper_setup'
require_relative "models/peep"
require_relative "models/user"

class Chitter < Sinatra::Base
  use Rack::MethodOverride
  register Sinatra::Flash
  enable :sessions
  set :session_secret, 'super secret'

  get '/' do
    erb :index
  end

  post '/log_in' do
    user = User.authenticate(params[:username], params[:password])
   if user
     session[:user_id] = user.id
     redirect '/chitter'
   else
     flash.now[:errors] = ['Your email or password is incorrect - try sign up!']
     erb :index
   end
 end

  get '/sign_up' do
    erb :sign_up
  end

  post '/add_user_data' do
    user = User.create(username: params[:username], password: params[:password])
    session[:user_id] = user.id
    redirect '/chitter'
  end

  get '/chitter' do
    @peeps = Peep.all
    @peeps = @peeps.reverse
    erb :chitter
  end

  post '/add_peep' do
    peep = Peep.create(content: params[:content])
    session[:user_id]
    peep.user = current_user
    peep.save
    redirect '/chitter'
  end

  delete '/log_out' do
    session[:user_id] = nil
    flash.now[:notice] = 'goodbye!'
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
