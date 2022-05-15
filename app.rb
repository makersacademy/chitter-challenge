require 'sinatra/base'
require 'sinatra/reloader'
require_relative './lib/peeps'

class Chitter < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
  end

  get '/' do
    redirect '/home'
  end

  get '/home' do
    @peeps = Peeps.all
    erb :home
  end

  post '/post_peep' do

    Peeps.new_peep(params['first_name'], params['handle'], params['peep'])
    redirect '/home'
  end

  run! if app_file == $0
end
