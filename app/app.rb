require 'sinatra'
require_relative '../lib/peep'
require_relative 'database_connection_setup'

class Chitter < Sinatra::Base

  enable :sessions

  get '/' do
    redirect '/peeps'
  end

  get '/peeps' do
    @peeps = Peep.all.order(created_at: :desc)
    erb :'peeps/index'
  end

  post '/peeps' do
    Peep.create(message: params['peep'])
    redirect '/peeps'
  end

end