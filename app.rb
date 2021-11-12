require 'sinatra'
require 'sinatra/base'
require 'sinatra/reloader' if development?

class Chitter < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
  end

  get '/' do
    erb :index
  end

  get '/Peeps' do
    erb :view_peeps
  end

  run! if app_file == $PROGRAM_NAME
end
