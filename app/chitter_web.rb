require 'sinatra/base'
require 'sinatra/flash'
require_relative 'data_mapper_setup'

class Chitter < Sinatra::Base

  enable :sessions
  register Sinatra::Flash
  use Rack::MethodOverride #need for delete
  set :session_secret, 'super secret'

  get '/' do
    erb :'index'
  end
end
