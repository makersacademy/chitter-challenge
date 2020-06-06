require 'sinatra/base'
require './lib/peep'

class Chitter < Sinatra::Base

  get '/' do
    erb(:index)
  end

  get '/post-peep' do
    erb(:post_peep)
  end

  get '/view-peeps' do
    "View all peeps here!"
  end

  post '/save-peep' do
    Peep.post(peep: params[:peep])
    redirect '/view-peeps'
  end

  run! if app_file == $PROGRAM_NAME

end
