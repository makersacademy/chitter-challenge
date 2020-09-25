require 'pg'
require 'sinatra'

class Chitter < Sinatra::Base
  enable :sessions, :method_override
  #register Sinatra::Flash

  get '/' do
    "Hello, Chitter!"
  end


end