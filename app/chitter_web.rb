require 'sinatra/base'
require_relative 'data_mapper_setup'
require 'sinatra/flash'

class Chitter < Sinatra::Base

  enable :sessions
  register Sinatra::Flash
  use Rack::MethodOverride #needed for delete
  set :session_secret, 'super secret'
  # set :views, proc { File.join(root, '..', 'views') }

  get '/' do
    erb :'index'
  end

end
