require 'sinatra/base'
require 'sinatra/reloader'
require 'sinatra/activerecord'
require_relative './models/peep'

class Chitter < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
  end

  get '/' do
    erb :index
  end

  post '/' do
    redirect '/peeps'
  end

  get '/peeps' do
    @peeps = Peep.all
    erb :'peeps/index'
  end

  post '/peeps/new' do
    Peep.create(params)
    redirect '/peeps'
  end

  run! if app_file == $0
end
