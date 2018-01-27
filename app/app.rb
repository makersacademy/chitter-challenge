require 'sinatra/base'

class Chitter < Sinatra::Base

  get "/" do
    "Hello world"
  end

  # get "/cheep/new" do
  #   "Hello world"
  # end

end
