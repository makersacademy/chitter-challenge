require 'sinatra/base'

class MessageList < Sinatra::Base
  get '/' do
    "Welcome to Chitter!"
  end

  get '/peeps' do
    "This is my first peep!"
  end

  run! if app_file == $0
end
