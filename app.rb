ENV['RACK_ENV'] ||= 'development'
require_relative './lib/peep'
require_relative './lib/user'
require_relative './lib/comment'
require 'sinatra/base'
require 'sinatra/reloader'
# require_relative './database_connection_setup.rb'

class Chitter < Sinatra::Base
  enable :sessions, :method_override
  configure :development do
    register Sinatra::Reloader
  end

  get '/' do
    @user = User.find(session[:user_id])
    @peeps = Peep.all
    erb :index
  end

  post '/peep' do
    # create method to updated to to take 'maker' argument
    Peep.create(params[:peep])
    redirect '/'
  end

  get '/users/new' do
    erb :"users/new"
  end

  post '/users' do
    user = User.create(email: params[:email], password: params[:password], name: params[:name], username: params[:username])
    session[:user_id] = user.id
    redirect '/'
  end

  get '/sessions/new' do
    erb :"sessions/new"
  end

  post '/sessions' do
    user = User.authenticate(email: params[:email], password: params[:password])
    if user
      session[:user_id] = user.id
      redirect('/')
    else
      # flash[:notice] = 'Please check your email or password'
      redirect('/sessions/new')
    end    
  end

  post '/sessions/destroy' do
    session.clear
    # flash[:notice] = 'You have signed out'
    redirect('/')
  end

  get '/peeps/:id/comments/new' do
    @peep_id = params[:id]
    erb :"comments/new"
  end

  post '/peeps/:id/comments' do
    # connection = PG.connect(dbname: 'chitter_test')
    # connection.exec_params(
    #   "INSERT INTO comments (comment, peep, maker) VALUES($1, $2, $3);",
    #   [params[:comment], params[:id], session[:user_id]]
    # )
    Comment.create(comment: params[:comment], peep: params[:id], maker: session[:user_id])
    redirect '/'
  end

  run! if app_file == $0
end