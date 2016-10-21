require 'sinatra/base'
require_relative 'models/user'
require_relative 'models/datamapper_setup'

ENV['RACK_ENV'] ||= 'development'

DataMapper.finalize
DataMapper.auto_upgrade!

class Chitter < Sinatra::Base

  get '/' do
    "Welcome to Chitter"
  end

  get '/sign-up' do
    erb :sign_up
  end

  post '/new-user' do
    User.create(name: params[:name], username: params[:username], email: params[:email], password: params[:password])
    redirect '/home'
  end

  get '/home' do
    @username = User.first.username
    erb :home
  end

  run! if app_file == $0
end
