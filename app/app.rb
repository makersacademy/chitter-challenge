ENV["RACK_ENV"] ||= "development"

require './app/data_mapper_setup.rb'
require 'sinatra/base'
require_relative 'data_mapper_setup.rb'

class Chitter < Sinatra::Base
  enable :sessions

  get '/' do
    erb :'sign_up'
  end

  get '/sign_up' do
    erb :'sign_up'
  end

  post '/sign_up' do
    User.new(email: params[:email], password:params[:password],
    password_again: params[:password_again], handle: params[:handle])
    redirect to('/new')
  end

  get '/new' do
    erb :'new'
  end

  run! if app_file == $0
end
