require 'sinatra/base'
require 'sinatra/reloader'
require './lib/chitter'
require './lib/message'

# Chitter Application
class ChitterApp < Sinatra::Base
  configure :development do
  # :nocov:
    register Sinatra::Reloader
  # :nocov:
  end

  get '/' do
    @chitters = Chitter.all
    erb :index
  end

  post '/submit_message' do
    Chitter.submit(params[:message])
    redirect '/'
  end

  run! if app_file == $PROGRAM_NAME
end
