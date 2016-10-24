require 'sinatra'

class TwitTwoo < Sinatra::Base
  get '/' do
    erb :index
  end
end