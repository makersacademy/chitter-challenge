require 'sinatra'
require 'data_mapper'
require 'rack-flash'

require_relative 'models/peep'
require_relative 'models/maker'
require_relative 'data_mapper_setup'
require_relative 'helpers/application'

enable :sessions
set :session_secret, 'super secret'
use Rack::Flash

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
    @maker = Maker.new
    erb :"makers/new"
  end

  get '/sessions/new' do
    erb :"sessions/new"
  end

  post '/sessions' do
    username, password = params[:username], params[:password]
    maker = Maker.authenticate(username, password)
    if maker
      session[:maker_id] = maker.id
      redirect to('/')
    else
      flash[:errors] = ["The username or password is incorrect"]
      erb :"sessions/new"
    end
  end


  post '/makers' do
    @maker = Maker.new( :name => params[:name],
                        :username => params[:username],
                        :email => params[:email],
                        :password => params[:password],
                        :password_confirmation => params[:password_confirmation])
    if @maker.save
      session[:maker_id] = @maker.id
      redirect to('/')
    else
      flash.now[:errors] = @maker.errors.full_messages
      erb :"makers/new"
  end




end
