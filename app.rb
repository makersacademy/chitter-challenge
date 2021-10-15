# frozen_string_literal: true

require 'sinatra/base'
require 'sinatra/reloader'

class Chitter < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
  end

  get '/' do
    erb :index
  end

  get '/peeps' do
    'This is a test peep'
  end

  run! if app_file == $PROGRAM_NAME

end
