require 'sinatra/base'
require './lib/peeps'

class Chitter < Sinatra::Base

  get '/' do
    erb :index
  end

  post '/add' do
    Peeps.create(params[:peep])
    redirect '/peeps'
  end

  get '/peeps' do
    @peeps = Peeps.all.reverse
    erb :peeps
  end

run! if app_file == $0

end
