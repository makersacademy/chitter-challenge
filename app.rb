require 'sinatra'
require 'sinatra/reloader'

class Chitter < Sinatra::Base
  configure :test do
    register Sinatra::Reloader
  end

  get '/' do
    erb(:index)
  end

  run! if app_file == $0

end
