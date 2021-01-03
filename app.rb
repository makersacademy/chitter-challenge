require 'sinatra/base'
require './lib/peep'

class Chitter < Sinatra::Base

  # get '/new' do
  #   erb :new
  # end

  get '/peeps' do
    @peeps = Peep.all
    # [
    #   "test peep",
    #   "another test peep",
    #   "a third test peep"
    # ]

    erb :'peeps/index'
  end

  run! if app_file == 0

end
