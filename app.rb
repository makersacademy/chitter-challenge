require 'sinatra/base'
require './lib/message.rb'


class Chitter < Sinatra::Base
  get '/chitter_feed' do
    @messages = Message.all
    erb :chitter_feed
  end

  get '/chitter/new' do
    erb :'/chitter/new'
  end

  post '/chitter/new' do
    Message.post(username: params[:username], message: params[:message])
    redirect '/chitter_feed'
  end

  run! if app_file == $0
end
