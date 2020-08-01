require 'sinatra/base'
require_relative './lib/peep.rb'
require './database_connection_setup'

class ChitterApp < Sinatra::Base

  get '/' do
    erb :index
  end

  get '/peeps' do
    @peeps = Peep.all
    erb :peeps
  end

  get '/peeps/new' do
    erb :'peeps/new'
  end

  post '/peeps' do
    Peep.create(content: params['content'])
    redirect '/peeps'
  end

end
