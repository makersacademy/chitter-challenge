require 'sinatra/base'
require './app/models/peep'


class Chitter < Sinatra::Base
  get '/' do
    'Testing infrastructure working!'
  end

  get '/peeps' do
    @peeps = Peep.all
    erb :'peeps/index'
  end

  get '/peeps/new' do
    erb :'peeps/new'
  end

  post '/peeps' do
    p params
    Peep.create(name: params[:name], username: params[:username], peep: params[:peep])
    redirect '/peeps'
  end

  run! if app_file == $0
end
