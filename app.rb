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
    @messages = Message.all
    erb :"flow/index"
  end

  post '/flow' do
    Message.create(content: params[:message])
 
    redirect '/flow'
  end

  get '/flow/new' do
    erb :"flow/new"
  end

  run! if app_file == $PROGRAM_NAME

end