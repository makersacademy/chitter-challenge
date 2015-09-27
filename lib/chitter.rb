require 'sinatra/base'
require 'sinatra/flash'
require_relative 'data_mapper_setup'

class Chitter < Sinatra::Base
  enable :sessions
  register Sinatra::Flash
  use Rack::MethodOverride

  get '/' do
    erb :home
  end

  get '/peep/all' do
    @peeps = Peep.all
    erb :'peep/all'
  end

  get '/peep/new' do
    erb :'peep/new'
  end

  post '/peep/new' do
    peep = Peep.create(content: params[:content])
    redirect '/peep/all'
  end

  get '/user/new' do
    @user = User.new
    erb :'user/new'
  end

  post '/user/new' do
    @user = User.new(email: params[:email],
                    username: params[:username],
                    password: params[:password],
                    password_confirmation: params[:password_confirmation],
                    name: params[:name])
    if @user.save
      redirect '/session/new'
    else
      flash.now[:error] = @user.errors.full_messages
      erb :'user/new'
    end
  end

  get '/session/new' do
    erb :'session/new'
  end

  post '/session/new' do
    user = User.authenticate(params[:username], params[:password])
    if user
      session[:user_id] = user.id
      redirect '/peep/all'
    else
      flash.now[:error] = 'Wrong credentials. Please try again.'
      erb :'session/new'
    end
  end

  delete '/session' do
    session[:user_id] = nil
    redirect '/session/new'
  end

  def current_user
    current_user ||= User.first(id: session[:user_id])
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
