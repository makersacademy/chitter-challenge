require 'sinatra/base'
require './lib/peep'

class ChitterManager < Sinatra::Base
  enable :sessions
  get '/' do
    @peeps = Peep.all
    erb :'peeps/index'
  end

#  get '/peeps' do
#    @peeps = Peep.all
#    erb :'peeps/peeps'
#  end

  get '/peeps/new' do
    erb :'/peeps/new'
  end

  post '/peeps/new' do
    Peep.add(text: params[:'peep text'], name: params[:'name'])
    redirect '/'
  end

  run! if app_file == $0
end
