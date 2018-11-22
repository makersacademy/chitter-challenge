require 'sinatra/base'
require './lib/peep'

class ChitterApp < Sinatra::Base

  get '/peeps/peeps_list' do
    @peeps = Peep.list
    erb(:'/peeps/peeps_list')
  end

end
