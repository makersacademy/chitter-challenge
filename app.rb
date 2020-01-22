require 'sinatra/base'
require './lib/peep'
class Chitter < Sinatra::Base

  get '/' do
    erb :index
  end

  post '/peeps' do

    @peep = params['message']
    Peep.create(params)
    redirect '/peeps'
  end

  get '/peeps' do
    @peeps = Peep.all.reverse
    erb :peeps
  end

  run! if app_file == $0
end
