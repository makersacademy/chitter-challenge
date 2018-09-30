require 'sinatra/base'

require_relative 'data_mapper_setup.rb'
require_relative 'lib/peep'

class ChitterApp < Sinatra::Base

  setup_databases

  get '/' do
    'Hello world'
  end

  get '/peeps' do
    @peeps = Peep.all.reverse
    erb :chitter_homepage
  end

  post '/peeps' do
    Peep.create(text: params["peep"])
    redirect '/peeps'
  end

  get '/peeps/new' do
    erb :peep
  end

  run! if app_file == $0
end
