ENV['RACK_ENV'] ||= 'development'

require 'sinatra/base'
require_relative 'models/data_mapper_setup'
require_relative 'models/user'
require_relative 'models/peep'
require 'sinatra/flash'

class Chitter < Sinatra::Base

  enable :sessions
  set :session_secret, 'super secret'

  helpers do
    def current_user
      @current_user ||= User.get(session[:user_id])
    end
  end

  get '/' do
    @peeps = Peep.all.reverse
    @users = User.all
    erb :index
  end

  post '/peep/new' do
    Peep.create(user: User.first(id: session[:user_id]),
    timePosted: (Time.now),
    content: params[:content])
    redirect '/'
  end

  get '/signup' do
    erb :signup
  end

  post '/signup/new' do
    @user = User.new(name: params[:name],
    email: params[:email],
    username: params[:username],
    password: params[:password])
    if @user.save
      session[:user_id] = @user.id
    end
    redirect '/'
  end

  run! if app_file == $0
end
