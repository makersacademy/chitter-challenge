ENV['RACK_ENV'] ||= 'development'

require 'sinatra/base'
require './data_mapper_setup'

class Chitter < Sinatra::Base
  enable :sessions
  set :session_secret, 'super secret'

  get '/' do
    @peeps = Peep.all
    erb :index
  end

  get '/peep' do
    erb :peep
  end

  post '/' do
    Peep.create(name: params[:name], content: params[:peep], time_submitted: Time.now)
    redirect '/'
  end

  get '/signup' do
    erb :signup
  end

  post '/users' do
    user = User.create(username: params[:username], email: params[:email], password: params[:password])
    session[:user_id] = user.id
    redirect to('/')
  end

  helpers do
   def current_user
     @current_user ||= User.get(session[:user_id])
   end
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end