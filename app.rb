require 'sinatra/base'
require './lib/peep'

class Chitter < Sinatra::Base

    enable :sessions 

    get '/' do 
      @peeps = Peep.all
       erb(:view_peeps)
    end 

    run! if app_file == $0
end
