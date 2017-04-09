ENV["RACK_ENV"] ||= "development"
require 'sinatra/base'
require_relative 'data_mapper_setup'
require_relative 'models/bottle'

class MessageInABottle < Sinatra::Base
  set :sessions, true

  get '/' do
    'Hello, world!'
  end

  get '/bottle/new' do
    erb :'bottle/new'
  end

  post '/message' do
    Bottle.create(message: params[:message], time: Time.now)
    redirect '/stream'
  end

  get '/stream' do
    @bottles = Bottle.all
    erb :'/stream/index'
  end
end
