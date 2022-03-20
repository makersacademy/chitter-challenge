require 'sinatra/base'
require 'sinatra/reloader'
require './lib/peep.rb'

class Chitter < Sinatra::Base

  configure :development do
    register Sinatra::Reloader
  end

  get '/' do
    @peeps = Peep.all
    p ENV
    erb :home_page
  end

  post '/new_peep' do
    Peep.create(peep_content: params[:peep_content])

    redirect :/
  end
  
  # dont delete this
  run! if app_file == $0
end