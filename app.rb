require 'sinatra'
require 'sinatra/reloader'

class Application < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
    also_reload "lib/peep_repository"
    also_reload "lib/user_repository"
  end

  get '/' do
    return erb(:index)
  end
end