require 'sinatra/base'
require './lib/message.rb'
require 'date'
require './lib/database_connection_setup.rb'


class Chitter < Sinatra::Base
  enable :sessions

  get '/' do
    @timeline = Message.all
    erb :index
  end

  post '/incoming' do
    Message.create(message: params['message'], time: Time.now)
    redirect '/'
  end

  run! if app_file == $0
end
