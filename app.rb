require 'sinatra/base'
require './lib/peep'

class Chitter < Sinatra::Base

  get '/' do
    "Welcome to Chitter"
  end

  get '/peeps' do
    erb :peeps
  end

  run! if app_file == $PROGRAM_NAME
end
