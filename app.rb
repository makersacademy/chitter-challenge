require 'sinatra/base'
require './lib/message.rb'

class Chitter < Sinatra::Base

  get '/' do
    erb :index
  end

  get '/home' do
    @messages = Message.all
    erb :home
  end

  post '/new_message' do
    Message.create(
      username: params[:username],
      msg: params[:message],
      created_on: DateTime.now.new_offset(0)
    )
    redirect '/home'
  end
end
