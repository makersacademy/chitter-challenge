require 'sinatra/base'
require './lib/chitter'

class ChitterManager < Sinatra::Base

  enable :sessions

  get '/' do
    @chitter = Chitter.read
    erb :index
    'Chitter Site'
  end

#First user story
  post '/' do
    Chitter.create(peep: params['peep'])
    redirect '/'
  end

  run! if app_file == $0

end
