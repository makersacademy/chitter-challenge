require 'sinatra'
require 'sinatra/flash'
require 'uri'

class Chitter < Sinatra::Base
  get '/' do
    erb :index
  end

end