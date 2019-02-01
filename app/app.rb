require 'sinatra/base'
require_relative '../lib/peeps'

class Chitter < Sinatra::Base

  get '/' do
    erb(:index)
  end

  get '/peeps' do
    @peeps = Peeps.list
    erb(:peeps)
  end

  run! if app_file == $0
end
