# file: app.rb
require 'sinatra/base'
require 'sinatra/reloader'
# require_relative 'lib/message_repository'

class Application < Sinatra::Base
  # This allows the app code to refresh
  # without having to restart the server.
  configure :development do
    register Sinatra::Reloader
  end
  post '/message' do
    new_message = Message.new
    @message = new_message
    new_message.time = params[:time].to_i
    new_message.date = params[:date]
    new_message.content = params[:content]

    return erb(new_message)
  end
  # Confirm that new messages have been added to the database
  get '/message' do
    return erb(:message)
  end
end 