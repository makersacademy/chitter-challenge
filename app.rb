require 'sinatra/base'
require './lib/peep.rb'

class Chitter < Sinatra::Base

  get '/' do

  end

  get '/feed' do
    @peeps = Peep.all
    erb :feed
  end

  post '/feed/send_peep' do
    peep = params[:peep_content]

    connection = PG.connect(dbname: 'chitter')
    result = connection.exec("INSERT INTO feed (peep) values ('#{peep}');")

    redirect '/feed'
  end

end
