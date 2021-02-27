require 'sinatra/base'
# require './lib/Peep'

class Chitter < Sinatra::Base

  get '/' do
    erb :index
  end

  post '/add' do
    @peep = params[:peep]
    erb :peeps
  end

  get '/peeps' do
    @peeps = Peeps.all
    erb :peeps
  end

run! if app_file == $0

end
