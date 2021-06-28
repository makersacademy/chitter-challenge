# frozen_string_literal: true

require 'sinatra/base'
require 'sinatra/reloader'
require './lib/peep'

# :nodoc:
class Chitter < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
  end

  get '/' do
    'Welcome.'
  end

  get '/peep' do
    @peep = Peep.all
    erb :'peeps/peep'
  end

  run! if app_file == $0
end
