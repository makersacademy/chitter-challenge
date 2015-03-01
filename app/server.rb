require 'sinatra'
require 'data_mapper'

require_relative 'models/peep'
require_relative 'models/maker'
require_relative 'data_mapper_setup'
require_relative 'helpers/application'

enable :sessions
set :session_secret, 'super secret'

  get '/' do
    @peeps = Peep.all
    erb :index
  end

  post '/peeps' do
    message = params[:message]
    name = params[:name]
    username = params[:username]
    Peep.create(:message => message, :name => name, :username => username)
    redirect to ('/')
  end

  get '/makers/new' do
    erb :'makers/new'
  end

  post '/makers' do
    maker = Maker.create(:name => params[:name],
                         :username => params[:username],
                         :email => params[:email],
                         :password => params[:password])
    session[:maker_id] = maker.id
    redirect to('/')
  end

