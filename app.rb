require 'sinatra/base'
require 'sinatra/reloader'

class Chitter
#     < Sinatra::Base
#   configure :development do
#     register Sinatra::Reloader
#   end

  get '/' do
    'chitter!'
  end 

  get '/peeps' do
    # @peeps = Peeps.all
    erb :'peeps/index'
  end 
  
  run! if app_file == $0
end
