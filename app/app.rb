ENV['RACK_ENV'] ||= 'development'

require 'sinatra/base'

require './app/models/peeps'
require './app/models/user'
require './app/data_mapper_setup'

class Chitter < Sinatra::Base
  enable :sessions
  set :session_secret, 'super secret'
  # register Sinatra::Flash

  get '/' do
    redirect '/peeps'
  end

  post '/peeps' do
    Peep.create(message: params[:message],
                time: "#{(Time.now + 1 * 60 * 60).hour}:#{Time.now.min}")
    redirect '/peeps'
  end

  get '/peeps/new' do
    erb :'peeps/new'
  end

  get '/peeps' do
    @peeps = Peep.all
    erb :'peeps/timeline'
  end

  get '/users/new' do
    @user = User.new
    erb :'user/new'
  end

  post '/users/new' do
    @user = User.create(username: params[:username],
                        email: params[:email],
                        password: params[:password],
                        password_confirmation: params[:password_confirmation])
    session[:user_id] = @user.id
    redirect '/peeps'
  end

  helpers do
    def current_user
      @current_user ||= User.get(session[:user_id])
    end
  end
  run! if app_file == $PROGRAM_NAME
end
