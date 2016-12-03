ENV['RACK_ENV'] ||= 'development'

require 'sinatra/base'
require_relative 'data_mapper_setup'

class Chitter < Sinatra::Base

  get '/' do
    "Hello"
  end

  get '/users/new' do
    erb :'/users/new'
  end

  post '/users' do
    user = User.new(email: params[:email], name: params[:name], username: params[:username], password: params[:password])
    if user.save
      redirect '/peeps'
    end
  end

  get '/session/new' do
    erb :'/session/new'
  end

  post '/session' do
    user = User.authenticate(params[:email], params[:password])
    if user
      redirect '/peeps'
    end
  end

  get '/peeps' do

  end



  run! if app_file == $0

end
