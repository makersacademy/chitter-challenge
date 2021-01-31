require 'sinatra'
require 'pg'
require './lib/peeps'
# require './lib/user'

class Chitter < Sinatra::Base

  get '/' do
    erb :index
  end

  get '/user/new' do
    erb :new_user
  end

  post '/user' do
    connection = PG.connect(dbname: 'chitter_chatter')
    result = connection.exec("INSERT INTO users (email, password, name, username) VALUES('#{params[:email]}', '#{params[:password]}','#{params[:name]}', '#{params[:username]}') RETURNING id, email, name, username;").first
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
    @peep = Peeps.create(peep: params[:new_peep], time: Time.now)
    redirect ('/peeps')
  end

  run! if app_file == $0
end
