require 'sinatra/base'
require_relative 'data_mapper_setup'
require_relative 'helpers/helper'

class Chitter < Sinatra::Application

  enable :sessions
  set :session_secret, 'super_secret'
  register Sinatra::Flash
  use Rack::MethodOverride

  get '/' do
    @peeps = Peep.all
    @users = User.all
    erb :index
  end

  get '/users/new' do
    erb :'users/new'
  end

  post "/users" do
    @user = User.create(email: params[:email], password: params[:password],
    password_confirmation: params[:checkpassword])
    if @user.save
      session[:user_id] = @user.id
      redirect "/peeps"
    else
      flash.now[:errors] = @user.errors.full_messages
      erb :'users/new'
    end
  end

  get '/peeps' do
    @peeps = Peep.all(:order => [:created_at.desc])
    erb :'peeps/index'
  end

  post '/peeps' do
    peep = current_user.peeps.new(content: params[:content])
    if current_user.peeps.save
      redirect '/peeps'
    else
      flash.now[:errors] = peep.errors
      @peeps = Peep.all(:order => [:created_at.desc])
      erb :'peeps/index'
    end
  end

  get '/sessions/new' do
    erb :'sessions/new'
  end

  post '/sessions' do
    user = User.authenticate(params[:email], params[:password])
    if user
      session[:user_id] = user.id
      redirect '/peeps'
    else
      flash.now[:errors] = ['The email or password is incorrect']
      erb :'sessions/new'
    end
  end

  delete '/sessions' do
    email = current_user.email
    session[:user_id] = nil
    flash.keep[:notice] = "Goodbye #{email}"
    redirect '/peeps'
    erb :'peeps/index'
  end

  get '/comments/new' do
    @peep = Peep.get(params[:peep_id])
    erb :'comments/new'
  end

  post '/comments' do
    peep = Peep.get(params[:peep_id])
    response = peep.responses.new(content: params[:comment_content])
    if peep.responses.save
      redirect '/peeps'
    else
      flash.now[:errors] = response.errors
      @peep = Peep.get(params[:peep_id])
      erb :'comments/new'
    end
  end

end
