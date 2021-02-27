require 'sinatra/base'
require './lib/peeps'

class Chitter < Sinatra::Base

  get '/' do
    erb :index
  end

  post '/add' do
    @peep = params[:peep]
    @peeps = Peeps.all
    erb :peeps
  end

  get '/peeps' do
    erb :peeps
  end

run! if app_file == $0

end
