require 'sinatra/base'
require 'pg'

require './lib/peep'

class Chitter < Sinatra::Base
  enable :sessions

  get '/' do
    'Welcome to Chitter!'
  end

  get '/peeps' do
    @peeps = Peep.all_reverse_chronological_order
    erb :'peeps/index'
  end

  get '/peeps/new' do
    erb :'peeps/new'
  end

  post '/peeps' do
    Peep.create(params['message'])
    redirect '/peeps'
  end

  run! if app_file == $0
end
