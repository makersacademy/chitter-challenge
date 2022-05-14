require 'sinatra'
require 'sinatra/reloader'

class Chitter < Sinatra::Base
  enable :sessions

  configure :development do
    register Sinatra::Reloader 
  end

  get '/' do
    'Hello World'
  end

  run! if app_file == $0

end