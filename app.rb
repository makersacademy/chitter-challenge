# frozen_string_literal: true

require 'sinatra/base'
require 'sinatra/reloader'

class Chitter < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
  end

  get '/' do
    erb :index, :layout => :layout
  end

  get '/peeps' do
    erb :peeps, :layout => :layout
  end

  run! if app_file == $PROGRAM_NAME

end
