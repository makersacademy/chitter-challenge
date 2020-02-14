require 'sinatra/base'

class Chitter < Sinatra::Base
  enable :sessions

    get'/' do
      "This is my homepage"
    end
    get '/messages' do
    erb :'index'
  end
    post '/messages/index' do
      redirect '/messages'
    end
end