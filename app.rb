require 'sinatra'

class Chitter < Sinatra::Base

  get '/' do
    p 'Hello World!'
  end




end
