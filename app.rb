require 'sinatra/base'
require_relative './lib/peep'

class Chitter < Sinatra::Base
  get '/' do
    'Welcome to Chitter. Please sign up'
  end

  get '/peeps' do
    @peeps = Peep.all
    erb :index
  end

  get '/peeps/new' do
    erb :newpeep
  end

  post '/peeps' do
    Peep.create(newpeep: params['newpeep'])
    redirect '/peeps'
  end

  run! if app_file == $0
end
