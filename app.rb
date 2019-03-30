require 'sinatra/base'

class MessageList < Sinatra::Base
  get '/' do
    "Welcome to Chitter!"
  end

  get '/peeps' do
    @peeps = [
      "This is my first peep!",
      "This is my second peep!"
    ]
    erb :'index'
  end

  run! if app_file == $0
end
