require 'sinatra/base'
require 'sinatra/reloader'
require 'sinatra/flash'
require 'uri'

class Chitter < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
  end

  enable :sessions, :method_override
    register Sinatra::Flash 
    
  get '/' do
    "Welcome to Chitter"
  end
end