require 'sinatra/base'
require 'shotgun'

class ChitterApp < Sinatra::Base
  enable :sessions, :method_override

  get '/' do
    erb :index
  end
  run! if app_file == $0
