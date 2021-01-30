require 'sinatra'
require 'pg'
require './lib/peeps'

class Chitter < Sinatra::Base

  get '/peeps' do
    erb :show
  end

  get '/peeps/new' do
    erb :new
  end

  post '/peeps' do
    @peep = Peeps.create(peep: params[:new_peep])
    erb :show
  end

  # get '/peep/:id' do
  #   @peep = Peeps.find(id: params[:id])
  #   redirect('/peeps')
  # end

  run! if app_file == $0
end
