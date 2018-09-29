require 'sinatra/base'
require './lib/message'
class Twittarr < Sinatra::Base
  enable :sessions
  set :session_secret, 'arrrrgh'

  get '/' do
    @messages = Message.all
    erb :index
  end

  run! if app_file == $0
end
