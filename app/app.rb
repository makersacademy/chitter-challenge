require 'sinatra/base'
require 'sinatra/flash'
require_relative '../data_mapper_setup'


class Chitter < Sinatra::Base
  enable :sessions
  set :session_secret, 'super secret'
  register Sinatra::Flash
  use Rack::MethodOverride

  get '/' do
  end



  run! if app_file == $0
end
