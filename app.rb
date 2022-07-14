require 'sinatra/base'
require 'sinatra/reloader'
require_relative 'lib/database_connection.rb'
require_relative 'lib/message_repository'

DatabaseConnection.connect

class Application < Sinatra::Base
  # This allows the app code to refresh
  # without having to restart the server.
  configure :development do
    register Sinatra::Reloader
    also_reload 
  end

  get '/' do
    repo = MessageRepository.new
    @messages = repo.messages_with_authors
    return erb(:index)
  end

  post '/' do
    new_message = Message.new
    new_message.message = params[:message]
    new_message.date = params[:date]
    new_message.author_id = params[:author_id]

    repo = MessageRepository.new
    repo.create(new_message)

    redirect '/'
  end

  get '/new-peep' do
    return erb(:new_peep)
  end

end