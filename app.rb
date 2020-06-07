require 'sinatra/base'
require './lib/peep'

class Chitter < Sinatra::Base

    enable :sessions 

  get '/' do 
    @peeps = Peep.all
    erb(:view_peeps)
  end 

  get '/' do 
    erb(:add_peep)
  end

  post '/' do 
    peep = params['peep']
    connection = PG.connect(dbname: 'chitter_test')
    connection.exec("INSERT INTO peep_manager (peep) VALUES('#{peep}')")
    redirect '/'
  end

    run! if app_file == $0
end
