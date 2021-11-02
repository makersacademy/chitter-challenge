require 'sinatra/base'
require 'sinatra/reloader'
require_relative './lib/peep.rb'

class ChitterChallenge < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
  end

  get '/' do
    "All chitter peeps"
    # @peeps = Peep.all.reverse
    # erb :index
  end

  get '/peeps' do
    @peeps = Peep.all
    erb :'peeps/index'
  end

  get '/peeps/new' do
   erb :'peeps/new'
  end

  post '/peeps' do
    Peep.create(peep: params['peep']);
    redirect '/peeps'
  end

  run! if app_file == $0
end
