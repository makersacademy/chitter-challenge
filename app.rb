require 'sinatra/base'
require './lib/message.rb'
# require 'pg'

class Chitter < Sinatra::Base
  get '/chitter_feed' do
    @messages = Message.all
    erb :chitter_feed
  end

  # get '/chitter/new' do
  #   erb :'/chitter/new'
  # end
  #
  # post '/chitter/new' do
  #   message = params[:message]
  #   # connection = PG.connect(dbname: 'chitter_manager_test')
  #   # connection.exec("INSERT INTO messages (message) VALUES('#{message}')")
  #   redirect '/chitter_feed'
  # end

  run! if app_file == $0
end
