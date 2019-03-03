require 'sinatra/base'
require './lib/peep.rb'
require './db_connection_setup'

class Chitter < Sinatra::Base
  enable :sessions

  $peeps = ['Trump is a nob', 'Code is cool', 'Save the turtles']

  get '/chitter' do
    'Welcome to Chitter!'
    @peeps = Peep.all
    erb :index
  end

  get '/chitter/new' do
    erb :new
  end

  post '/chitter/save_new' do
    Peep.create(peep: params[:peep])
    redirect '/chitter'
  end

  run! if app_file == $0
end
