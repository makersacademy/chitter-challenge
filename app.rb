require 'sinatra/base'
require_relative './lib/peep'

class Chitter < Sinatra::Base
  enable :sessions, :method_override

  get '/' do
    erb :homepage
  end

  get '/peeps' do
    @peeps = Peep.all
    p @peeps
    erb :"peeps/index"
  end

  get '/peeps/new' do
    erb :"peeps/new"
  end

  post '/peeps' do
    title = params['title']
    peep = params['peep']
    connection = PG.connect(dbname: chitter)
    connection.exec("INSERT INTO peep_manager (title, peep) VALUES('#{title}', '#{peep}')")
  end

  run! if app_file == $0
end