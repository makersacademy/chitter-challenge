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
    @messages = Message.all
    erb :"flow/index"
  end

  post '/flow' do
    @message = Message.new(content: params[:message], id: params[:id], time: params[:time])
    $all_messages.add_message(@message)

    # connection = PG.connect(dbname: 'chitter')
    # connection.exec("INSERT INTO messages (message) VALUES (#{content});")

    redirect '/flow'
  end

  get '/flow/new' do
    erb :"flow/new"
  end

  run! if app_file == $PROGRAM_NAME

end