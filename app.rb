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
    erb :'peeps/index'
  end

  get '/peeps/add_peep' do
    erb :'/peeps/add_peep'
  end

  post '/peeps' do
    Peep.create(message: params[:message])
    redirect('/peeps')
  end

  run! if app_file == $0
end