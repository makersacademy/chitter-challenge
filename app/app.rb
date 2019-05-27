require 'sinatra/base'
require './lib/peep'

class Chitter < Sinatra::Base
  enable :sessions

  get '/' do
    erb :index
  end

  get '/peeps' do
    @peeps = Peep.all
    erb :peeps
  end

  post '/peeps' do
    Peep.create(peep: params[:peep])
    redirect '/peeps'
  end

  run! if app_file == $0

end
