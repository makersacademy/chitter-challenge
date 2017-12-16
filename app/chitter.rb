ENV['RACK_ENV'] = 'development'
require 'sinatra/base'
require_relative 'data_mapper_setup'

class Chitter < Sinatra::Base
  #enable :sessions

  get '/chat' do
    @msgs = Chat.new.msgs
    p @msgs
    erb :chat
  end

  post '/chat' do
    Chat.new.create_msg(params[:message])
    redirect '/chat'
  end

  run! if app_file == $0
end
