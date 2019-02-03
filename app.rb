require 'sinatra/base'
require_relative 'lib/peep'
require_relative 'spec/web_helpers'

class Chitter < Sinatra::Base

  get '/' do
    erb(:index)
  end

  get '/peeps' do
    @peeps = Peep.all
    erb(:peeps)
  end

  run! if app_file == $0
end
