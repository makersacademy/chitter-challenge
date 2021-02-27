require 'sinatra/base'
require './get_connection.rb'
require 'sinatra/flash'

class Chitter < Sinatra::Base
  enable :sessions, :method_override
  register Sinatra::Flash

    get '/' do
      peeps!
    end

    run! if app_file == $0
end
