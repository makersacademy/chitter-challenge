require 'sinatra/base'
require './lib/peep'
require './database_connection_setup'

class Chitter < Sinatra::Base 

  get '/' do
    redirect '/peeps'
  end

  get '/peeps' do
    @peeps = Peep.all
    erb :'peeps/index'
  end

  post 'peeps' do
    Peep.create(peep_content: params[:peep_content])

  run! if app_file == $0

end