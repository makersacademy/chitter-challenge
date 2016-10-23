ENV['RACK_ENV'] ||= 'development'

require 'sinatra/base'
require_relative 'models/data_mapper_setup'
require_relative 'models/user'
require_relative 'models/peep'
require 'sinatra/flash'

class Chitter < Sinatra::Base

  enable :sessions
  set :session_secret, 'super secret'
  register Sinatra::Flash

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
    @user = User.new
    erb :signup
  end

  post '/signup/new' do
    @user = User.new(name: params[:name],
    email: params[:email],
    username: params[:username],
    password: params[:password],
    password_confirmation: params[:password_confirmation])
    if @user.save
      session[:user_id] = @user.id
      redirect '/'
    else
      flash.now[:notice] = "Password and confirmation password did not match"
      erb :signup
    end
  end

  run! if app_file == $0
end
