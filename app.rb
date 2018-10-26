require 'sinatra/base'
require './lib/message.rb'

class Chitter < Sinatra::Base
  enable :sessions

  get '/' do
    @timeline = Message.all
    erb :index
  end

  post '/incoming' do
    redirect '/'
  end

  run! if app_file == $0
end
