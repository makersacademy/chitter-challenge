require 'sinatra/base'
require 'sinatra/reloader'
require_relative './lib/peep'

class Chitter < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
  end

  get '/' do
    'Chitter'
  end

  get '/peeps' do
    @peeps = Peep.all
    erb :'/peeps/new'
  end

  get '/peeps/new' do
    erb :'/peeps/new'
  end

  post "/peeps" do
    Peep.add(name: params[:name], peep: params[:peep])
    redirect '/peeps'
  end

  run! if app_file == $0
end