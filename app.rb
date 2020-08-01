require 'sinatra/base'
require './lib/peep'

class Chitter < Sinatra::Base

  get '/test' do
    'Testing Chitter App'
  end

  get '/peeps' do
    @peeps = Peep.all

    erb :'peeps/index'
  end

  post '/peeps' do
    Peep.create(message: params[:message])
    redirect '/peeps'
  end

  get '/peeps/new' do
    erb :'peeps/new'
  end

  get '/peeps/test' do
    @peeps = Peep.all
  end

  run! if app_file == $0
end
