require 'sinatra/base'
require 'sinatra/flash'

class ChitterApp < Sinatra::Base

  enable :sessions
  register Sinatra::Flash






  
  run! if app_file == $0

end
