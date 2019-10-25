require 'sinatra/base'
require './lib/chitter_feed'

class Chitter < Sinatra::Base

  get '/' do
    redirect '/chitter_feed'
  end

  get '/chitter_feed' do
    @feed_items = ChitterFeed.content
    erb :feed
  end

  get '/chitter_feed/new' do
    erb :new
  end

  post '/chitter_feed' do
  content = params['content']
  connection = PG.connect(dbname: 'chitter_test')
  connection.exec("INSERT INTO feed (content) VALUES('#{content}')")
  redirect '/chitter_feed'
  end
end
