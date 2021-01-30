require 'sinatra'
require 'pg'
require './lib/peeps'

class Chitter < Sinatra::Base

  get '/' do
    erb :index
  end

  get '/user/new' do
    erb :new_user
  end

  post '/user' do
    # connection = PG.connect(dbname: 'chitter_chatter')
    # $result = connection.exec("INSERT INTO users (email, password, name, username) VALUES('#{email}', '#{password}','#{name}', '#{username}') RETURNING id, email, name, username;")
    redirect ('/peeps')
  end

  get '/peeps' do
    @peeps = Peeps.all
    erb :show
  end

  get '/peeps/new' do
    erb :new
  end

  post '/peeps' do
    @peep = Peeps.create(peep: params[:new_peep])
    redirect ('/peeps')
  end

  run! if app_file == $0
end
