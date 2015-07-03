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

  post '/users/new' do
    @user = User.create(username: params[:username], name: params[:name], email: params[:email], password: params[:password])
    session[:user_id] = @user.id
    erb :'users/new'
  end

  post '/users' do
    @user = User.authenticate(username: params[:username], password: params[:password])
    if @user
      session[:user_id] = @user.id unless session[:user_id]
      erb :'users/peeps'
    else
      flash[:error] = 'The email or password is incorrect'
      redirect '/'
    end
  end

  get '/users' do
    erb :'users/peeps'
  end

  post '/session' do
    session.clear
    erb :'users/goodbye'
  end

  post '/peeps' do
    peep = Peep.create(text: params[:peep], time_stamp: Time.now, user_id: current_user.id)
    current_user.peeps << peep
    @peeps = current_user.peeps.all(:order => :time_stamp.desc )
    erb :'users/peeps'
  end

  helpers do

    def current_user
      User.get(session[:user_id])
    end

  end

end
