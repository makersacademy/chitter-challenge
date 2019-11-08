require 'sinatra'


class Chitter < Sinatra::Base

  get '/' do
    "Hello World"
  end
end
