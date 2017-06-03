ENV['RACK_ENV'] ||= "development"

require_relative 'datamapper_setup'
require 'sinatra/base'

class Chitter < Sinatra::Base
  enable :sessions

  get '/' do
    erb(:index)
  end

  get '/new_peep' do
    erb(:new_peep)
  end

  post '/update_peeps' do
    Peep.create(body: params[:peep_body])
    redirect '/peeps'
  end

  get '/peeps' do
    @peeps = Peep.all
    erb(:peeps)
  end

end
