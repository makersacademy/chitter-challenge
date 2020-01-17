require 'sinatra/base'

class Peep < Sinatra::Base

 get '/' do
   "Chitter"
 end

  run! if app_file == $0

end
