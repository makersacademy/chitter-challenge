ENV['RACK_ENV'] ||= 'development'

require 'sinatra/base'
require 'data_mapper'
require_relative './models/peep'

class Chitter < Sinatra::Base


  get '/peeps/new' do
    erb :'peeps/new'
  end

  post '/peeps' do
    Peep.create(text: params[:peep])
    redirect '/peeps'
  end

  get '/peeps' do
    @peeps = Peep.all
    erb :'peeps/index'
  end


end