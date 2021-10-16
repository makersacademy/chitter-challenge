require 'sinatra'
require 'sinatra/base'
require 'sinatra/reloader'
require './lib/message'

class ChitterController < Sinatra::Base

  configure :development do
    register Sinatra::Reloader
  end

  get '/' do
    erb :index
  end

  get '/flow' do
    @message = Message.instance
    erb :"flow/index"
  end

  post '/flow' do
    Message.create(content)
    redirect '/flow'
  end

  get '/flow/new' do
    erb :"flow/new"
  end

  run! if app_file == $PROGRAM_NAME

end