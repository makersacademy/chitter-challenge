require 'sinatra'
require 'sinatra/flash'
require 'pg'
require './lib/peeps'
require './lib/user'

class Chitter < Sinatra::Base
  enable :sessions
  register Sinatra::Flash

  get '/' do
    erb :index
  end

  get '/user/new' do
    erb :new_user
  end

  post '/user' do
    user = User.create(email: params[:email], password: params[:password], name: params[:name], username: params[:username])
    session[:user_id] = user.id
    session[:username] = user.username
    redirect ('/peeps')
  end

  get '/peeps' do
    @user = User.find(id: session[:user_id]) if session[:user_id]
    @username = session[:username]
    @peeps = Peeps.all
    erb :show
  end

  get '/peeps/new' do
    # @user = User.find(id: session[:user_id]) if session[:user_id]
    #
    # if @user
      erb :show
    # else
    #   flash[:notice] = "You need to sign in/log in to post a peep!"
    #   redirect('/peeps')
    # end
  end

  post '/peeps' do
    @peep = Peeps.create(peep: params[:new_peep], user_id: session[:user_id])
    redirect ('/peeps')
  end

  get '/sessions/new' do
    erb :'sessions/new'
  end

  post '/sessions' do
    user = User.authenticate(email: params[:email], password: params[:password])

    if user
      session[:user_id] = user.id
      redirect ('/peeps')
    else
      flash[:notice] = "Incorrect email or password."
      redirect('/sessions/new')
    end
  end

  run! if app_file == $0
end
