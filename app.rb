require 'sinatra/base'
require 'uri'
require 'sinatra/flash'



class Chitter < Sinatra::Base
  enable :sessions, :method_override

  register Sinatra::Flash

  get '/' do
    'hello'
  end

  run! if app_file == $PROGRAM_NAME
end
