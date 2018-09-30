require 'sinatra/base'
require_relative './lib/message'

class ChitterManager < Sinatra::Base
  enable :sessions
  get '/' do
    @messages = Message.all
    erb :homepage
  end

  post '/post_message' do
    Message.create(name: params[:name], content: params[:content])
    redirect '/'
  end

  run! if app_file == $0
end
