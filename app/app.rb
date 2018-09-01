require 'sinatra'
require 'sinatra/activerecord'
require 'sinatra/flash'

class App < Sinatra::Base
  enable :sessions
  register Sinatra::Flash

  get "/" do
    erb :index
  end

  get "/write_message" do
    erb :write_message
  end

  run! if app_file == $0
end
