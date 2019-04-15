require 'sinatra/base'
require './lib/peeps'

class Chitter < Sinatra::Base

  get '/' do
    'Welcome to Chitter!'
    @peeps = Peeps.all
  end

  get '/peeps/new' do
    erb :'peeps/new'
  end

  post '/peeps' do
    @peep = Peeps.create(peep: params[:peep])
    redirect '/peeps'
  end

  run! if app_file == $0
end
