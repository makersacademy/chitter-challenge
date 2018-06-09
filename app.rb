require 'sinatra/base'
require './lib/peep'

class Chitter < Sinatra::Base
  enable :sessions

  get '/' do
    erb :index
  end

  post '/posts' do
    Peep.post(peep: params['peep'])
    redirect '/posts'
  end

  get '/posts' do
    @peeps = Peep.display
    erb :posts
  end

  run! if app_file == $0
end
