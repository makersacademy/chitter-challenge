require 'sinatra/base'
require './lib/peep'

class Chitter < Sinatra::Base

  get '/' do
    @peeps = Peep.all
    p @peeps
    erb:index
  end

  post '/' do
  redirect
  end


  run! if app_file == $0

end
