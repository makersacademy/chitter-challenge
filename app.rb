require 'sinatra/base'
require './lib/message.rb'

class Chitter < Sinatra::Base

  get '/' do
    erb :index
  end

  get '/chitter_feed' do
    @peep = Message.all
    erb :chitter_feed
  end

  get '/new_message' do
    erb :new_message
  end

  post '/new_message' do
    Message.add(params[:message])
    redirect '/chitter_feed'
  end

  run! if app_file == $0
end