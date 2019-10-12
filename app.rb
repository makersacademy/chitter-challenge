require 'sinatra/base'
require './lib/messages'

class Chitter < Sinatra::Base
  enable :session

  before do
    @messages = Messages
  end

  get '/' do
    @message = @messages.instance
    erb :index
  end

  post '/' do
    @messages.create(params[:message])
    redirect '/'
  end

  run! if app_file == $0
end
