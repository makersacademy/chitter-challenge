ENV['RACK_ENV'] ||= "development"

require 'sinatra/base'
require_relative 'data_mapper_setup'

class Chitter < Sinatra::Base

  get '/' do
    redirect '/new/peeps'
  end

  get '/new/peeps' do
    erb(:add_peep)
  end

  post '/peeps' do
    Peep.create(content: params[:new_peep])
    redirect to '/peeps'
  end

  get '/peeps' do
    @peeps = Peep.all
    erb(:peeps)
  end

end
