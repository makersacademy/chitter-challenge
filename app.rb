require 'sinatra/base'
require './lib/peep'

class Chitter < Sinatra::Base
  get '/' do
    'Hello World!'
  end

  get '/peeps' do
    @peeps = Peep.all
    erb :'peeps'
  end

  get '/peeps/new' do
    erb :'new'
  end

  post '/peeps/new' do
    Peep.create(params[:author], params[:content])
    redirect '/peeps'
  end

  run! if app_file == $0
end
