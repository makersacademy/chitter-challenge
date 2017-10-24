ENV['RACK_ENV'] ||= 'development'
require 'sinatra/base'
require './app/models/peep'

class Chitter < Sinatra::Base

  get '/peeps' do
    @peeps = Peep.all
    erb :'peeps/index'
  end

  get '/peeps/new' do
    erb :'peeps/new'
  end

  post '/peeps' do
    Peep.create(contents: params[:contents])
    redirect '/peeps'
  end
end
