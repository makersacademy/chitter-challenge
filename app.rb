require 'sinatra'
require 'pg'
require './lib/peeps'

class Chitter < Sinatra::Base

  get '/peeps' do
    @peeps = Peeps.all
    erb :show
  end

  get '/peeps/new' do
    erb :new
  end

  post '/peeps' do
    @peep = Peeps.create(peep: params[:new_peep])
    redirect ('/peeps')
  end

  # get '/peep/:id' do
  #   @peep = Peeps.find(id: params[:id])
  #   redirect('/peeps')
  # end

  run! if app_file == $0
end
