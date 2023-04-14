# file: app.rb
require './lib/message'
require 'sinatra/base'
require 'sinatra/reloader'
require './lib/database_connection'
require './lib/message_repository'

DatabaseConnection.connect

class Application < Sinatra::Base
  # This allows the app code to refresh
  # without having to restart the server.
  configure :development do
    register Sinatra::Reloader
  end
  post '/message' do
    new_message = Message.new
    @message = new_message
    new_message.time = params[:time]
    new_message.date = params[:date]
    new_message.content = params[:content]

    return erb(:message)
  end
  # Confirm that new messages have been added to the database
  get '/message' do
    repo = MessageRepository.new
    @message = repo.all[0]

    return erb(:message)
  end

  get '/message/order' do
    # It returns messages in reverse chronological order, newest first
    repo = MessageRepository.new
    @message = repo.all.sort_by(&:date)
    return erb(:message)
  end
end