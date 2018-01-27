require 'sinatra/base'
require_relative './models/peep.rb'

class Chitter < Sinatra::Base

  get '/peep/all' do
    @peeps = Peep.all
    erb(:'peep/all')
  end

  post '/peep/all' do
    Peep.create(message: params[:message])
    redirect '/peep/all'
  end

  get '/peep/new' do
    erb(:'peep/new')
  end

end
