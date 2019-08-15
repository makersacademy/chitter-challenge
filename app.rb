require 'sinatra/base'
require './lib/peep'

class Chitter < Sinatra::Base

  enable :sessions

  get '/' do
    @peeps = Peep.all
    erb :'peeps/index'
  end

  post '/' do
    Peep.create(content: params['content'])
    # content = params['content']
    # connection = PG.connect(dbname: 'peeps_test')
    # connection.exec("INSERT INTO peeps (peep) VALUES ('#{content}')")
    redirect '/'
  end

  # post '/new-peep-post' do
  #   erb :'peeps/index'
  # end



  run! if app_file == $0
end
