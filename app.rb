require 'sinatra/base'
require '././lib/message'
require '././lib/database_connection_setup'

class Chitter < Sinatra::Base
  enable :method_override

  get '/' do
    @messages = Message.all
    erb :index
  end

  get '/message' do
    erb :message
  end

  post '/message' do
    Message.create(message: params[:message], time: Time.now)
    redirect '/'
  end

  run! if app_file == $0
end
