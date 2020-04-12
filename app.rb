require 'sinatra/base'
require './lib/peeps.rb'

class Chitter < Sinatra::Base

  Peeps.create

  get '/' do
    @peeps = Peeps.instance
    @messages = @peeps.messages
    erb :index
  end

  post '/' do 
    # peep = params[:peep]
    # connection = PG.connect(dbname: 'chitter')
    # connection.exec("INSERT INTO peeps (peep) VALUES('#{peep}')")
    @peeps = Peeps.instance
    @peeps.add(params[:peep])
    redirect('/')
  end

end
