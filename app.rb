require 'sinatra/base'
require 'sinatra/reloader'

class ChitterChallenge < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
  end

  get '/' do
    'You have signed up successfully'
  end

  get '/peeps' do
    'This is my first peep'
  end 

  run! if app_file == $0
end