require 'sinatra'
require 'sinatra/base'
require 'sinatra/flash'
require './app/data_mapper_setup'

class Chitter < Sinatra::Base

  enable :sessions
  register Sinatra::Flash

  get '/' do
    erb :'users/sign_up'
  end

  get '/:username' do
    @user = User.first(username: params[:username])
    if @user
      @peeps = @user.peeps.all(:order => :time_stamp.desc )
      if !@peeps.empty?
        erb :'sessions/peeps'
      else
        erb :'users/no_peeps'
      end
    else
        erb :'users/not_found'
    end
  end

  post '/users/new' do
    @user = User.create(username: params[:username], name: params[:name], email: params[:email], password: params[:password])
    session[:user_id] = @user.id
    erb :'users/new'
  end

  post '/sessions' do
    @user = User.authenticate(username: params[:username], password: params[:password])
    if @user
      session[:user_id] = @user.id unless session[:user_id]
      @peeps = current_user.peeps.all(:order => :time_stamp.desc )
      erb :'sessions/peeps'
    else
      flash[:error] = 'The email or password is incorrect'
      redirect '/'
    end
  end

  get '/sessions' do
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
