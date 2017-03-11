ENV['RACK_ENV'] ||= 'development'

require 'sinatra/base'
require 'sinatra/flash'
require './app/data_mapper_setup'
require 'date'

class Chitter < Sinatra::Base

  enable :sessions, :method_override
  set :session_secret, 'secret'
  register Sinatra::Flash

  helpers do
    def current_user
      @current_user ||= User.first(id: session[:user_id])
    end
  end

  get '/' do
    'Hello World'
  end

  get '/users/new' do
    @user = User.new
    erb :'users/signup'
  end

  post '/users' do
    @user = User.create(email: params[:email], password: params[:password], password_confirmation: params[:password_confirmation], name: params[:name], username: params[:username])
    if @user.valid?
      session[:user_id] = @user.id
      redirect '/peeps'
    else
      flash[:message] = @user.errors.full_messages.flatten.join(',')
      redirect '/users/new'
    end
  end

  get '/peeps' do
    @peeps = Peep.all.sort_by{|peep| peep.created_at}.reverse
    erb :'peeps/index'
  end

  get '/session/new' do
    erb :'users/signin'
  end

  post '/session' do
    user = User.authenticate(params[:email], params[:password])
    if user
      session[:user_id] = user.id
      redirect '/peeps'
    else
      flash[:message] = "Yours crediential do not match"
      redirect '/session/new'
    end
  end

  delete '/session' do
    session[:user_id] = nil
    flash[:message] = "Thanks for using Chitter. Hope to see you soon"
    redirect '/peeps'
  end

  get '/peeps/new' do
    erb :'peeps/new'
  end

  post '/peeps/new' do
    peep = Peep.create(text: params[:text], created_at: DateTime.now, user_id: current_user.id)
    if peep.valid?
      redirect '/peeps'
    else
      flash[:message] = peep.errors.full_messages.join(',')
      redirect '/peeps/new'
    end
  end

  run if app_file == $0
end
