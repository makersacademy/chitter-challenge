require 'sinatra'
require 'sinatra/contrib'

class ChitterApp < Sinatra::Base

  get '/' do
    'hello'
  end

end