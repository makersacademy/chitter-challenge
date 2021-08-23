require 'sinatra'
require 'sinatra/reloader'
require_relative './lib/peeps'

class PeepsManager < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
  end

  get '/' do
    erb :'peeps/index'
  end

  get '/peeps' do
    @peeps = Peeps.all
    erb :'peeps/add'
  end

  get '/peeps/new' do
    erb :'peeps/new'
  end

  post '/peeps' do
    Peeps.create(peeps: params['peeps'])
    #connection = PG.connect(dbname: 'peeps_manager_test')
    #connection.exec("INSERT INTO peeps (peeps) VALUES('#{peeps}')")
    redirect '/peeps'
  end

  run! if app_file == $0
end