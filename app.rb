require 'sinatra/base'
require './lib/chit'

class Chitter < Sinatra::Base
  #
  get '/' do
    erb :frontpage
  end

  get '/chits' do
    @chits = Chit.all
    erb :'/chits/index'
  end

  get '/signup' do
    erb :'chits/sign_up'
  end

  post '/welcome' do
    @username = params[:username]
    erb :'chits/welcome'
  end

  get '/chits/add' do
    @chits = Chit.all
    erb :'chits/add'
  end

  post '/chits/add' do
    # database interaction has to happen in mode, so we undo this code
    # and refactor for independence
    # message = params['message']
    # connection = PG.connect(dbname: 'chit_manager_test')
    # connection.exec("INSERT INTO chits (message) VALUES('#{message}')")
    Chit.add(message: params[:message])
    redirect '/chits/add'
  end





  run! if app_file == $0


end