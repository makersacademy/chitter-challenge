require 'sinatra/base'
require 'pg'
require_relative './lib/chitter'

class ChitterManager < Sinatra::Base

  get '/peeps' do
    @peeps = Chitter.all
    erb(:chitter)
  end

  post '/peeps' do
    Chitter.add(params[:peep])
    redirect('/peeps')
  end

  run! if app_file == $0
end
