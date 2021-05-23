require 'sinatra/base'
require 'sinatra/reloader'
require_relative './lib/peep'

class Chitter < Sinatra::Base 
  configure :development do
    register Sinatra::Reloader
  end

  get '/' do
    erb :chitter_homepage
  end

  get '/peeps' do 
    @peeps = Peep.all
    erb :peeps
  end

  run! if app_file == $0
end
