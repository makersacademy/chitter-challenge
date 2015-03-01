require 'sinatra'
require 'data_mapper'
require 'rack-flash'
require_relative 'models/peep'
require_relative 'models/user'
require_relative 'helpers/application'
require_relative 'data_mapper_setup'

enable :sessions
set :session_secret, 'super secret'
use Rack::Flash
use Rack::MethodOverride


  get '/' do
    @peeps = Peep.all
    erb :index
  end

  post '/peeps' do
    content = params["content"]
    user = params["user"]
    Peep.create(:content => content, :user => user)
    redirect to '/'
  end

  get '/users/new' do
    @user = User.new
    erb :"users/new"
  end

  post '/users' do
    @user = User.new(:username => params["username"],
                :email => params["email"],
                :password => params["password"],
                :password_confirmation => params["password_confirmation"])
    if @user.save
      session[:user_id] = @user.id
      redirect to '/'
    else
      flash[:errors] = @user.errors.full_messages
      erb :"users/new"
    end
  end

  get '/sessions/new' do
    erb :"sessions/new"
  end

  post '/sessions' do
    email, password = params[:email], params[:password]
    user = User.authenticate(email, password)
    if user
      session[:user_id] = user.id
      redirect '/'
    else
      flash[:errors] = ["The email or password is incorrect"]
      erb :"sessions/new"
    end
  end


