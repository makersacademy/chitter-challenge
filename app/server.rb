require 'sinatra/base'
require 'data_mapper'
require_relative 'helper'

env = ENV['RACK_ENV'] || 'development'

DataMapper.setup(:default, "postgres://localhost/chitter_#{env}")

require_relative 'models/message'
require_relative 'models/user'

DataMapper.finalize

DataMapper.auto_upgrade!

class Chitter < Sinatra::Base

  enable :sessions
  set :session_secret, 'secret'

  get '/' do
    @messages = Message.all
    erb :index
  end

  post '/' do 
    erb :index
  end

  get '/user' do 
    @user = User.new
    erb :user
  end

  post '/user' do 
    @user = User.create(:name => params[:name], :email => params[:email], :password => params[:password])
    session[:user_id] = @user.id
    @user.save
    redirect to '/'
  end
  
  post '/messages' do 
    content = params[:content]
    Message.create(:content => content)
    redirect to '/'
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
