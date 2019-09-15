require 'sinatra/base'
require './lib/peep'

class Chitter_challenge < Sinatra::Base

  get '/' do
    redirect '/peeps'
  end

  get '/peeps' do
    @peeps = Peep.all.sort_by { |peep| peep.date }.reverse
    erb :peeps
  end

  post '/peeps' do
    Peep.create(peep: params[:peep])
    redirect '/peeps'
  end

  run! if app_file == $0
end
