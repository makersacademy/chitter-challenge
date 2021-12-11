require 'sinatra/base'
require 'sinatra/reloader'
require './lib/peep'

class Chitter < Sinatra::Base

  configure :development do
    register Sinatra::Reloader 
  end

  get '/' do
    erb :homepage
  end

  post '/' do
    $peep = params[:peep] 
    # Peep.create -- - with the global variable this worked (but didn't save) but now trying to create a class method to do the same thing.
    redirect '/'
  end

run! if app_file == $0

end