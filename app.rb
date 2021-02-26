require 'sinatra/base'
require 'pg'

class Chitter < Sinatra::Base
  get '/' do
    erb(:index)
  end

  get '/new-peep' do
    erb(:peep_form)
  end

  post '/' do
    "I'm flyyyyingg!!"
  end

  run! if app_file == Chitter
end
