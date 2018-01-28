ENV["RACK_ENV"] ||= "development"

require 'sinatra'
require './app/models/peep'

class Chitter < Sinatra::Base
  get '/' do
    @peeps = Peep.all
    erb :peeps
  end

  post '/' do
    Peep.create(body: params[:body], author: params[:author])
    redirect '/'
  end

  get '/new-peep' do

    erb :new_peep
  end
end
