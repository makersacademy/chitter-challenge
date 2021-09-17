require 'sinatra/base'
require 'sinatra/reloader'

class ChitterChallenge < Sinatra::Base

  enable :sessions, :method_override

  configure :development do
    register Sinatra::Reloader
  end

  run! if app_file == $0
end