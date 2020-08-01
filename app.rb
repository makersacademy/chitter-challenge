require 'sinatra'
require 'rack-flash'
require_relative './models/database_start_script'

class ChitterApp < Sinatra::Base

  enable :sessions, :method_override
  use Rack::Flash

  get '/' do
    'Hello world'
  end


end
