require 'sinatra/base'
require './lib/peep'

class Chitter < Sinatra::Base

  get '/' do
    'Chitter and Peeps'
  end

  get '/peeps' do
    p ENV #==> setting enviornment variable
    # @peeps = [
    #           "my first peep",
    #           "my second peep",
    #           "my third peep"
    #          ]
    @peeps = Peep.all
    # peeps.join
    erb:'peeps/index'
  end

  get '/peeps/new_peep' do
    erb :"peeps/new_peep"
  end

#   post '/bookmarks' do
#   # p "Form data submitted to the /bookmarks route!"
#   p params
# end
  run! if app_file == $0
end
