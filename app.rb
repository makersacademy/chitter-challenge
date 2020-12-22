require 'sinatra/base'
require './lib/peep.rb'

class Chitter < Sinatra::Base

  get '/' do
    erb(:index)
  end

  get '/peeps/new' do
    erb(:peeps_new)
  end

  get '/peeps' do
    Peep.add(params[:peep_content])
    @peep = Peep.all

    erb(:peeps)

  end

end
