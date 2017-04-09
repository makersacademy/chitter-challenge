ENV["RACK_ENV"] ||= "development"
require 'sinatra/base'
require_relative 'data_mapper_setup'
require_relative 'models/bottle'
require_relative 'models/user'
require 'sinatra/flash'

class MessageInABottle < Sinatra::Base
  set :sessions, true
  set :session_secret, 'super secret'
  register Sinatra::Flash

  get '/' do
    'Hello, world!'
  end

  get '/user/new' do
    @user = User.new
    erb :'user/new'
  end

  post '/user' do
    @user = User.new(email: params[:email],
                     password: params[:password],
                     password_confirmation: params[:password_confirmation])
    if @user.save
      redirect to('bottle/new')
    else
      flash.now[:error] = "Password and confirmation password do not amtch"
      erb :'user/new'
    end

  end
  get '/bottle/new' do
    erb :'bottle/new'
  end

  post '/message' do
    Bottle.create(message: params[:message], time: Time.now)
    redirect '/stream'
  end

  get '/stream' do
    @bottles = Bottle.reverse_chronological_order
    erb :'/stream/index'
  end
end
