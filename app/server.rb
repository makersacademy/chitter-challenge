require 'sinatra'
require 'data_mapper'

require_relative 'models/peep'
require_relative 'models/user'
require_relative 'helpers/application'
require_relative 'data_mapper_setup'

enable :sessions
set :session_secret, 'super secret'


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
    erb :"users/new"
  end

  post '/users' do
    user = User.create(:username => params["username"],
                :email => params["email"],
                :password => params["password"])
    session[:user_id] = user.id
    redirect to '/'
  end

