require 'sinatra'
require 'sinatra/base'
require 'sinatra/flash'
require './app/data_mapper_setup'

class Chitter < Sinatra::Base

  enable :sessions
  register Sinatra::Flash

  get '/' do
    if current_user
      redirect '/sessions/new'
    else
      erb :'users/sign_up'
    end
  end

  get '/:username' do
    @user = User.first(username: params[:username])
    if @user
      @peeps = @user.peeps.all(:order => :time_stamp.desc )
      erb :'sessions/peeps'
    else
      erb :'users/not_found'
    end
  end

  post '/users/new' do
    @user = User.new(username: params[:username], name: params[:name], email: params[:email], password: params[:password])
    if @user.save
      session[:user_id] = @user.id
      erb :'users/new'
    else
      flash[:errors] = @user.errors.full_messages
      redirect '/'
    end
  end

  post '/sessions/new' do
    if User.first(username: params[:username])
      @user = User.authenticate(username: params[:username], password: params[:password])
      if @user
        session[:user_id] = @user.id unless session[:user_id]
        @peeps = current_user.peeps.all(:order => :time_stamp.desc )
        erb :'sessions/peeps'
      else
        flash[:errors] = ['Incorrect password']
        redirect '/'
      end
    else
      flash[:errors] = ['No username exists, try signing up']
      redirect '/'
    end
  end

  get '/sessions/new' do
    @user = current_user
    @peeps = current_user.peeps.all(:order => :time_stamp.desc )
    erb :'sessions/peeps'
  end

  post '/sessions/end' do
    session.clear
    erb :'sessions/goodbye'
  end

  post '/peeps' do
    @user = current_user
    peep = Peep.create(text: params[:peep], time_stamp: Time.now, user_id: current_user.id)
    current_user.peeps << peep
    @peeps = current_user.peeps.all(:order => :time_stamp.desc )
    erb :'sessions/peeps'
  end

  helpers do

    def current_user
      User.get(session[:user_id])
    end

  end

end
