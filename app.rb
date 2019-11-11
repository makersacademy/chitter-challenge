require 'sinatra/base'
require './lib/peep'

class ChitterApp < Sinatra::Base

  get '/' do
    "Log in to Chitter"
  end

  get '/peeps' do
    @peeps = Peep.all
    erb :'peeps/index'
  end

  get '/peeps/new' do
    erb :'peeps/new'
  end

  post '/peeps' do
    Peep.create(title: params['title'])
    redirect '/peeps'
  end

  run! if app_file == $0
end
