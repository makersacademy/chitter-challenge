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
    
end