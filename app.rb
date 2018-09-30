require 'sinatra/base'
require 'data_mapper'
require './controllers/controller_helper'
require './models/peep'

class Chitter < Sinatra::Base
  get '/' do
    redirect('/peeps')
  end

  get '/peeps' do
    set_up
    @peeps = Peep.all_sorted
    erb :index
  end

  post '/peeps' do
    Peep.add(params[:message])
    redirect('/peeps')
  end

  get '/peeps/:id' do
    @peep = Peep.get(params[:id])
    erb :peep
  end

  get '/user/login' do
  end

  get '/user/register' do
    erb :register
  end

  post '/user/register' do
    p params
  end

  run! if app_file == $0
end
