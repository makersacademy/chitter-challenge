require 'sinatra/base'
require './lib/peeps'

class ChitterManager < Sinatra::Base

  get '/' do
    'Welcome to Chitter'
  end

  get '/peeps' do
    @peeps = Peeps.all
    erb :peeps
  end

  run! if app_file == $0
end