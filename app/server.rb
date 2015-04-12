require 'data_mapper'
require 'sinatra'

env = ENV['RACK_ENV'] || 'development'

DataMapper.setup(:default, "postgres://localhost/chitter_#{env}")

require_relative './models/post'
require_relative './models/user'
require_relative './helpers/user_helpers.rb'

DataMapper.finalize
DataMapper.auto_migrate!

class Chitter < Sinatra::Base
  include UserHelpers
  enable :sessions


  get '/' do
    @posts = Post.all
    erb :index
  end

  get '/users/new' do
    erb :'users/new'
  end

  post '/users' do
    @user = User.create(:name => params['name'], 
                         :email => params['email'],
                         :username => params['username'],
                         :password => params['password'])
    if @user.save
      session[:user_id] = @user.id
      redirect to('/')
    else
      # flash.now[:errors] = @user.errors.full_messages
      erb :'users/new'
    end
  end


end


