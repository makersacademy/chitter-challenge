require 'sinatra/base'

#this is the class comment - the main project class. 
class Chitter < Sinatra::Base
  get '/' do
    'Peeps view page'
  end
  run! if app_file == $0
end
