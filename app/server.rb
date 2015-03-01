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
      flash[:notice] = "Sorry, your passwords don't match"
      erb :"users/new"
    end
  end

