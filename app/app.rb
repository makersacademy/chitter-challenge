require 'sinatra'
require_relative '../lib/peep'
require_relative '../lib/database'

class Chitter < Sinatra::Base

  enable :sessions

  get '/' do
    redirect '/peeps'
  end

  get '/peeps' do
    @peeps = Peep.all
    erb :'peeps/index'
  end

  post '/peeps' do
    Peep.create(message: params['peep'])
    redirect '/peeps'
  end

end