require 'data_mapper'
require 'rack-flash'
require 'sinatra'
require 'sinatra/partial'
require_relative 'helpers/application'
require_relative 'models/user.rb'
require_relative 'models/message.rb'

env = ENV['RACK_ENV'] || 'development'

DataMapper.setup(:default, "postgres://localhost/chitter_#{env}")

require_relative 'controllers/messages'
require_relative 'models/message'

class Chitter < Sinatra::Base

  set :views, Proc.new { File.join(root, "..", "app/views") }

  enable :sessions
  set :session_secret, 'super secret'

  include Helpers

  get '/' do
    @messages = Message.all
    erb :index

  end

  get '/messages/new' do
    erb :"messages/new"
  end

  post '/messages' do
    memo = params['memo']
    Message.create(memo: memo)
    redirect to('/')
  end

  get '/users/new' do
    erb :'users/new'
  end

  post '/users' do
    puts 'here'
    @user = User.new(email: params[:email],
                     password: params[:password])
    if @user.save
      session[:user_id] = @user.id
      redirect to('/')
    else
      flash.now[:errors] = @user.errors.full_messages
      erb :'users/new'
    end
  end

end

DataMapper.finalize
DataMapper.auto_upgrade!
