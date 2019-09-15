require 'sinatra/base'
require 'sinatra/flash'
require 'data_mapper'
require 'dm-migrations'
require_relative './lib/model/user'

DataMapper::Logger.new($stdout, :debug)
DataMapper.setup(:default, 'postgres://rafaela@127.0.0.1/chitter')
DataMapper.auto_migrate!

class Chitter < Sinatra::Application

  get '/' do
    erb :index
  end

  get '/register' do
    erb :register
  end

  post '/register/submit' do
    name = params[:name]
    email = params[:user_email]
    password = params[:password]
    user = User.create(:name => name, :email => email, :password => password)
    redirect '/'
  end

end
