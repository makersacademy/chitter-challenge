ENV["RACK_ENV"] ||= "development"

require 'sinatra/base'
require_relative 'data_mapper_setup'

class Chitter < Sinatra::Base

  enable :sessions
  set :session_secret, 'super secret spy mode'

  get '/' do
    @peeps = Peep.all
    erb :index
  end

  get '/sign-up/new' do
    erb :sign_up
  end

  post '/sign-up' do
    @user = User.create(email: params[:email], name: params[:name], username: params[:username], password: params[:password])
    session[:user_id] = @user.id
    redirect '/'
  end

  helpers do
    def current_user
      @current_user ||= User.get(session[:user_id])
    end
  end

  get '/peep/new' do
    erb :peep
  end

  post '/peep' do
    Peep.create(user_peep: params[:user_peep])
    redirect '/'
  end

  get '/log-in/new' do
    erb :log_in
  end

  post 'logged-in' do
    #need to authenticate user
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
