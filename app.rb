require 'sinatra/base'
require './lib/peep'

class ChitterManager < Sinatra::Base
  enable :sessions
  get '/' do
    #'Chitter Manager'
    #redirect '/peeps'
    erb :'peeps/index'
  end

  get '/peeps' do
    @peeps = Peep.all
    erb :'peeps/peeps'
  end

  get '/peeps/new' do
    erb :'/peeps/new'
  end

  post '/peeps/new' do
    Peep.add(text: params[:'peep text'])
    redirect '/peeps'
  end

  run! if app_file == $0
end
