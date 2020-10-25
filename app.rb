require 'sinatra/base'
require './lib/peeps'

class Chitter < Sinatra::Base

  get '/chitter' do
    @peeps = Peeps.all
    erb :chitter
  end

  post '/chitter' do
    Peeps.add(body: params['post'])
    redirect '/chitter'
  end

  get '/users/signup' do
    erb :'/users/signup'
  end

  post '/users/new' do
    @new_user = params['username']
    connection = PG.connect(dbname: 'chitter')
    result = connection.exec('SELECT * FROM users;')
    connection.exec("INSERT INTO users (username) VALUES('#{@new_user}')")
    redirect '/chitter'
  end


  #   get '/users/login' do
  #   erb :'/users/login'
  # end

  run! if app_file == $0
end
