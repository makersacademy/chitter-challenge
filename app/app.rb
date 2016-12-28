ENV['RACK_ENV'] ||= 'development'

require 'sinatra/base'
require './app/models/user.rb'
require './app/models/peep.rb'
require './app/data_mapper_setup.rb'
require 'sinatra/flash'
require 'sinatra/partial'

class Chitter < Sinatra::Base


  enable :sessions
  register Sinatra::Flash
  register Sinatra::Partial
  use Rack::MethodOverride
  set :session_secret, 'super secret'
  set :partial_template_engine, :erb

  enable :partial_underscores

  helpers do
    def current_user
      @current_user ||= User.get(session[:user_id])
    end
  end

  before do
    @user = current_user
  end

  before do
    @peeps = Peep.all(:order => :created_at.desc)
  end

  get '/' do
    erb :index
  end

  post '/' do
    @user = User.new(name: params[:name],
    username: params[:username],
    email: params[:email],
    password: params[:password],
    password_confirmation: params[:confirm_password])
    if @user.save
      session[:user_id] = @user.id
      session[:username] = @user.username
      redirect to('/')
    else
      flash.now[:errors] = @user.errors.full_messages
      erb :'user/new'
    end
  end

  get '/signup' do
    erb :signup
  end

  post '/session' do
    user = User.authenticate(params[:username], params[:password])
    if user
      session[:user_id] = user.id
      redirect to('/')
    else
      flash.now[:errors] = ["The email or password is incorrect"]
      erb :index
    end
  end

  get '/peeps/new' do
    erb :'peeps/new'
  end

  post '/peeps' do
    the_peep = params[:peep]
    @user.peeps << Peep.create(content: the_peep)
    @user.save
    redirect to('/')
  end

  delete '/session' do
    session[:user_id] = nil
    flash.keep[:notice] = 'Goodbye!'
    redirect to('/')
  end


  # start the server if ruby file executed directly
  run! if app_file == $0
end
