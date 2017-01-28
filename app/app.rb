require 'sinatra/base'
require 'sinatra/flash'

class Chitter < Sinatra::Base

  enable :sessions
  set    :session_secret, 'super secret'

  register Sinatra::Flash

  get '/' do
    erb :'index'
  end

  run! if app_file == $0
end
