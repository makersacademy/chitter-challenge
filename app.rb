require 'sinatra/base'
require 'sinatra/reloader'

class App < Sinatra::Base
  enable :sessions

  # get '/register' do
  #   erb :index
  #   # register
  # end

  # post '/register' do

  #   redirect to '/login'
  # end

  # get '/login' do

  #   redirect to '/messages'
  # end

  # post '\login' do

  #   redirect to '/message'
  # end

  get '/message' do

    erb :message
  end

  post '/message' do

    redirect to :wall
  end

  get '/wall' do
    
    erb :wall
  end

  run! if app_file == $0
end
