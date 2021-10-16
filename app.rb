require 'sinatra'
require 'sinatra/base'
require 'sinatra/reloader'
require './lib/message'
require './lib/all_messages'

$all_messages = AllMessages.new

class ChitterController < Sinatra::Base

  configure :development do
    register Sinatra::Reloader
  end

  get '/' do
    erb :index
  end

  get '/flow' do
    # @message = Message.instance
    @all_messages = $all_messages
    erb :"flow/index"
  end

  post '/flow' do
    content = params[:message]
    @message = Message.new(content)
    $all_messages.add_message(@message)
    redirect '/flow'
  end

  get '/flow/new' do
    erb :"flow/new"
  end

  run! if app_file == $PROGRAM_NAME

end