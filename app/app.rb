ENV['RACK_ENV'] ||= 'development'
require 'sinatra/base'

class Chitter < Sinatra::Base
  enable :sessions
  get "/" do
    "Hello world"
  end

  get "/cheep/new" do
    erb :new_cheep
  end

  post "/cheep/new" do
    redirect 'cheep/new'
  end

  get "/cheep" do
    "hello"
  end

end
