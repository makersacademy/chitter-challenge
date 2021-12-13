require 'pg'
require 'sinatra/base'
require 'sinatra/reloader'
require './lib/peeps'

class Chitter < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
  end

  enable :sessions

  get '/' do
    'Welcome to Chitter!'
  end

  get '/peeps/new' do
    erb :"peeps/new"
  end

  post '/peeps' do
    Peeps.add(peep: params[:peep], time_of_peep: params[:time_of_peep])
    redirect '/peeps'
  end

  get '/peeps' do
    @all_peeps = Peeps.list
    erb :"peeps/index"
  end

  run! if app_file == $0
end
