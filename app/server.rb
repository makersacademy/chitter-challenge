require 'data_mapper'
require 'rack-flash'
require 'sinatra'
require 'sinatra/partial'

require_relative 'helpers/application'
require_relative 'controllers/messages'
require_relative 'models/user'
require_relative 'models/message'

env = ENV['RACK_ENV'] || 'development'

DataMapper.setup(:default, "postgres://localhost/chitter_#{env}")

class Chitter < Sinatra::Base

  set :views, Proc.new { File.join(root, "..", "app/views") }

  enable :sessions
  set :session_secret, 'super secret'
  use Rack::Flash
  use Rack::MethodOverride

  include Helpers

  get '/' do
    @messages = Message.all
    erb :index
  end

  get '/messages/new' do
    erb :'messages/new'
  end

  post '/messages' do
    memo = params['memo']
    Message.create(memo: memo)
    redirect to('/')
  end

  # get '/sessions/new' do
  #   erb :'sessions/new'
  # end

  get '/users/new' do
    @user = User.new
    erb :'users/new'
  end

  post '/users/new' do
    puts 'here'
    @user = User.create(email: params[:email],
                        password: params[:password],
                        password_confirmation: params[:password_confirmation])
    if @user.save
      session[:user_id] = @user.id
      redirect to('/')
    else
      # flash[:errors] = ['Password does not match the confirmation']
      flash.now[:errors] = @user.errors.full_messages
      # flash.now[:errors] = 'Passwords do not match'
      erb :'users/new'
    end
  end

end

DataMapper.finalize
DataMapper.auto_upgrade!
