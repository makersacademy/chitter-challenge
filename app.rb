require 'sinatra/base'
require './lib/peep'

class ChitterChallenge < Sinatra::Base
  enable :sessions

  get '/' do
    erb :index
  end

  get '/peeps' do
    peep = params['peep']
    connection = PG.connect(dbname: 'peeps')
    connection.exec("INSERT INTO peeps (peep) VALUES('#{peep}')")
    redirect '/peeps'
  end

  # get '/peep' do
  #   @peep = session[:peep]
  #   erb :peeps
  # end
  #
  # get '/all_peeps' do
  #   erb :all_peeps
  # end

  run! if app_file == $0
end
