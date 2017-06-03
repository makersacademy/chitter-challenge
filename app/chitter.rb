ENV['RACK_ENV'] ||= 'development'

require 'sinatra'
require_relative 'data_mapper_setup'

class Chitter < Sinatra::Base
  enable :sessions

  get '/' do
    "Welcome to Chitter"
  end

  get '/chits' do
    @chits = Chit.all
    erb :'chits/index'
  end

  get '/chits/new' do
    erb :'chits/new'
  end

  post '/chits' do
    Chit.create(message: params[:message])
    redirect '/chits'
  end
end
