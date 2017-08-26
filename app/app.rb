ENV["RACK_ENV"] ||= "development"

require 'sinatra/base'
require 'sinatra'


class Chitter < Sinatra::Base

  get '/' do
    "Hello World"
  end
  

end
