require 'sinatra/base'

class Chitter < Sinatra::Base
  enable :sessions, :method_override

  get '/' do
    'Chitter'
  end

  run! if app_file == $PROGRAM_NAME
end
