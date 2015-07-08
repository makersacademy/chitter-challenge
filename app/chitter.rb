require 'sinatra/base'
require 'sinatra/flash'
require './app/models/user'
require './app/models/peep'
require_relative 'data_mapper_setup'

class Chitter < Sinatra::Base
  set :views, proc {File.join(root,'.', 'views')}
  
  enable :sessions
  set :session_secret, 'super secret'

  register Sinatra::Flash

  use Rack::MethodOverride

  get '/' do
    redirect '/peeps'    
  end

  get '/peeps' do
    @peeps = Peep.all(:order => [ :created_at.desc])
    erb :'peeps/index'
  end

  get '/peeps/new' do
    erb :'peeps/new'
  end

  post '/peeps' do
    Peep.create(title: params[:title], 
                message: params[:message], 
                created_at: Time.now)
    redirect to '/peeps'
  end

  get '/users/new' do
    @user = User.new
    erb :'users/new'
  end

  post '/users' do
    @user = User.new(name: params[:name],
                     username: params[:username],
                     email: params[:email],
                     password: params[:password],
                     password_confirmation: params[:password_confirmation])
    @user.id = session[:user_id] 
    if @user.save
      @user_id = session[:user_id]
      redirect to '/'
    else
      flash.now[:errors] = @user.errors.full_messages
      erb :'/users/new'
    end
  end

  get '/sessions/new' do
    erb :'sessions/new'
  end

  post '/sessions' do
    @user = User.authenticate(params[:email], 
                              params[:password])
    if @user
      @user.id = session[:user_id]
      redirect '/links'
    else
      flash.now[:errors] = ['The email or password is incorrect']
      erb :'sessions/new'
    end
  end

    delete '/sessions' do
      session.clear
      erb :'users/signout'
    end

    get '/sessions' do
      redirect '/'
    end


helpers do

  def current_user
   @user ||= User.get(session[:user_id])
  end

end

run! if app_file == $0

end