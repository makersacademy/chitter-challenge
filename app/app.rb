ENV['RACK_ENV'] ||= 'development'

require 'sinatra/base'
require './app/data_mapper_setup'
require './app/models/peep'

class Chitter < Sinatra::Base

  get '/peep/new' do
    erb :'peeps/new'
  end

  post '/peeps' do
    peep = Peep.first_or_create(content: params[:content])
    redirect '/peeps'
  end

  get '/peeps' do
    @peeps = Peep.all
    erb :'peeps/index'
  end

end
