require 'sinatra/base'

class Chitter < Sinatra::Base
  enable :sessions, :method_override # for session variables & _method hack

  # start the server if ruby file executed directly
  run! if app_file == $0
end
