require 'sinatra/base'
require_relative 'lib/peep.rb'
require 'pg'

class Chitter < Sinatra::Base

  enable :sessions

  get '/chitter' do
    @peeps = Peep.all
    erb :index
  end

  post '/chitter' do
    Peep.create(params['content'])
    redirect '/chitter'
  end

  run! if app_file == $0

end
