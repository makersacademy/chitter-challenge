require 'sinatra/base'
require 'sinatra/reloader'
require_relative 'lib/chitter'

class ChitterChallenge < Sinatra::Base

  enable :sessions, :method_override

  configure :development do
    register Sinatra::Reloader
  end

  get '/' do
    @peeps = Chitter.all
    erb(:index)
  end

  run! if app_file == $0
end