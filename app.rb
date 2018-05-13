require 'sinatra/base'
require 'pg'
require_relative './lib/chitter'

class ChitterManager < Sinatra::Base

  get '/peeps' do
    @peeps = Chitter.all.reverse
    erb(:chitter)
  end

  post '/peeps' do
    Chitter.add(params[:peep], Time.now)
    redirect('/peeps')
  end

  run! if app_file == $0
end
