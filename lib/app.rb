require 'sinatra'
require 'pg'
require_relative 'peep_manager'

class Chitter < Sinatra::Base
  get '/' do
    erb :index
  end

  post '/peeps' do
    Peep.create(peep: params[:peep])
    redirect '/'
  end

  get '/peeps' do
    @peeps = Peep.all
    erb :peeps
  end

  run! if app_file == $0
end
