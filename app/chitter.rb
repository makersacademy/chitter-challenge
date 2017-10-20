ENV['RACK_ENV'] ||= 'development'

require 'sinatra/base'
require 'data_mapper'
require_relative 'data_mapper_setup'

class Chitter < Sinatra::Base


  get '/peeps/new' do
    erb :'peeps/new'
  end

  post '/peeps' do
    Peep.create(text: params[:peep], posted_on: DateTime.now)
    redirect '/peeps'
  end

  get '/peeps' do
    @peeps = Peep.all
    erb :'peeps/index'
  end


end