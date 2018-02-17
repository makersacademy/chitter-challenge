require 'sinatra/base'
require 'pg'
require_relative 'lib/peep'

class Chitter < Sinatra::Base

  enable :sessions

  get '/peeps/' do
    @peeps = Peep.all
    erb(:index)
  end

  get '/peeps/new' do
    @peeps = Peep.all
    erb(:index)
  end

  post '/peeps' do
    new_peep = params['new_peep']
    connection = PG.connect(dbname: 'chitter_test')
    connection.exec("INSERT INTO peeps (post) VALUES('#{new_peep}');")
    redirect '/peeps/new'
  end

  run! if app_file == $0

end
