require "sinatra/activerecord"
require './spec/setup_database_test'
require './lib/message'
require './lib/user'

class ChitterManager < Sinatra::Base

  register Sinatra::ActiveRecordExtension

  enable :sessions

  configure :development do
    set :database, {adapter: 'postgresql',  encoding: 'unicode', database: 'chitter'}
  end

  configure :test do
    set :database, {adapter: 'postgresql',  encoding: 'unicode', database: 'chitter_test'}
  end

  get '/' do
    @messages = Message.order(time_created: :desc)
    @user = session[:user]
    erb :index
  end

  get '/new' do
    erb :new
  end

  post '/new' do
    Message.create(content: params[:content], time_created: Time.now)
    redirect('/')
  end

  get '/login' do
    erb :register
  end

  post '/login' do
    @user = User.create(name: params[:name], email: params[:email],password: params[:password], username: params[:username])
    session[:user] = @user
    redirect('/')
  end

  run! if app_file == $0
end
