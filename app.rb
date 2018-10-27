require 'sinatra/base'
require './lib/peep'

class ChitterManager < Sinatra::Base
  get '/' do
    'Chitter Manager'
  end

  get '/peeps' do
    @peeps = Peep.all
    erb :'peeps/index'
  end

  get '/peeps/new' do
    erb :'/peeps/new'
  end

  post '/peeps' do
    Peep.add(text: params['peep text'])
    redirect '/peeps'
  end

  run! if app_file == $0
end
