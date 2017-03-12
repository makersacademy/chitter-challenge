ENV["RACK_ENV"] ||= "development"

require 'sinatra/base'
require 'sinatra/flash'
require './app/models/dm_config'

class Chitter < Sinatra::Base
  enable :sessions
  register Sinatra::Flash
  set :session_secret, 'super secret'
  use Rack::MethodOverride

  get '/' do
    erb :index
  end

  get '/signup' do
    @user = User.new
    erb :signup
  end

  post '/create_user' do
    @user = User.create(email: params[:email], password: params[:password], password_confirmation: params[:password_confirmation])

    if @user.save
      session[:user_id] = @user.id
      session[:user_email] = @user.email
      redirect '/confirmation'
    else
      flash.now[:errors] = @user.errors.full_messages
      erb :'signup'
    end
  end

  helpers do
    def current_user
      @current_user ||= User.get(session[:user_id])
    end
  end

  get '/confirmation' do
    erb :confirmation
  end

  post '/signin' do
    user = User.authenticate(params[:email], params[:password])
    if user
      session[:user_id] = user.id
      redirect '/peeps'
    else
      flash.now[:errors] = ['The email or password is incorrect']
      erb :index
    end
  end


  get '/peeps' do
    @peeps = Peep.all
    erb :peeps
  end

  get '/peeps/add' do
    erb :add
  end

  post '/peeps' do
      # Peep.create(content: params[:peep_content])
      peep = Peep.create(content: params[:peep_content])
      params[:hashtags].split.each do |h|
        peep.hashtags << Hashtag.first_or_create(name: h)
      end
      peep.save
      redirect '/peeps'
  end


  get '/hashtags/:name' do
    hashtag = Hashtag.first(name: params[:name])
    @peeps = hashtag ? hashtag.peeps : []
    erb :'peeps/index'
  end

  delete '/' do
    session[:user_id] = nil
    flash.keep[:notice] = 'Hasta luego'
    redirect to '/'
  end

end
