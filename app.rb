require 'sinatra/base'
require 'sinatra/reloader'

class ChitterChallenge < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
  end

  get ('/') do
    'Welcome to Chitter'
  end

  get ('/peeps') do
    @peeps = Chitter.all
    erb :peeps
  end



  run! if app_file == $0
end