require 'sinatra/base'

class ChitterApp < Sinatra::Base 

  get '/' do
    @peeps = Peep.list_ordered_peeps
    p @peeps
    erb :index
  end

  run! if app_file == $0
end
