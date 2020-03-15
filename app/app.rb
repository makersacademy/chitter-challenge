require "sinatra/activerecord"
require './spec/setup_database_test'
require './lib/message'
require './lib/user'

class ChitterManager < Sinatra::Base

  register Sinatra::ActiveRecordExtension

  enable :sessions

  configure :development do
    set :database, { adapter: 'postgresql',  encoding: 'unicode', database: 'chitter' }
  end

  configure :test do
    set :database, { adapter: 'postgresql',  encoding: 'unicode', database: 'chitter_test' }
  end

  get '/' do
    @messages = Message.order(time_created: :desc)
    # @messages.each do |message|
    #   @message_id = message.user_id
    # end
    @user = session[:user]
    erb :index
  end

  get '/new' do
    @user = session[:user]
    erb :new
  end

  post '/new' do
    @user = session[:user]
    Message.create(content: params[:content], time_created: Time.now, user_id: @user.id)
    redirect('/')
  end

  get '/login' do
    @user = session[:user]
    erb :login
  end

  post '/login' do
    @user = User.find_by(email: params[:email], password: params[:password])
    session[:user] = @user
    redirect('/')
  end

  get '/register' do
    @user = session[:user]
    erb :register
  end

  post '/register' do
    @user = User.create(name: params[:name], email: params[:email], password: params[:password], username: params[:username])
    session[:user] = @user
    redirect('/')
  end

  run! if app_file == $0
end
