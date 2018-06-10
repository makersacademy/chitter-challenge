require 'pg'
require 'sinatra/base'
require 'sinatra/flash'
require 'uri'
require './lib/peep'
require 'orderly'

class Chitter < Sinatra::Base
  register Sinatra::Flash
  enable :sessions

  get '/' do
    erb :index
  end

  post '/' do
    redirect '/'
  end

  post '/posts' do
    Peep.post(peep: params['peep'])
    redirect '/peeps'
  end

  get '/peeps' do
    @peeps = Peep.showpeeps
    erb :peeps
  end

  run! if app_file == $0

end
