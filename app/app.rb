ENV['RACK_ENV'] ||= 'development'
require 'sinatra/base'

class Chitter < Sinatra::Base
  enable :sessions
  get "/" do
    "Hello world"
  end

  # get "/cheep/new" do
  #   "Hello world"
  # end

end
