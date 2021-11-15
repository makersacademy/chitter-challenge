require 'sinatra/base'
require 'sinatra/reloader'
require_relative './lib/peep'

class ChitterChallenge < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
  end

  get '/' do
    'Welcome to Chitter, You have signed up successfully!'
  end

  get '/peeps' do
    @peeps = Peep.all
    erb :'peeps/index'
  end 

  run! if app_file == $0
end