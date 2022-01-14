require 'sinatra'
require 'sinatra/reloader'
require 'pg'
require_relative './lib/peep'

class Chitter < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
  end

  get '/' do
    redirect('/peeps')
  end

  get '/peeps' do
    @peeps = Peep.all
    erb :'peeps_views/index'
  end

  get '/peeps/new-peep' do
    erb :'/peeps_views/new_peep'
  end

  post '/peeps' do
    Peep.create_peep(message: params[:message])
    redirect('/peeps')
  end

  run! if app_file == $0
end
