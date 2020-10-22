require 'sinatra/base'

class Chitter < Sinatra::Base
  get '/' do 
    @sorted_peeps = Peep.all.sort_by { |peep| peep.posted_on }
    erb(:index)
  end

  run! if app_file == $0
end
