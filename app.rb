require 'sinatra/base'
require './lib/chitter'

class ChitterApp < Sinatra::Base

  get '/' do
    erb :index
  end

  get '/peeps' do
    @peeps = Chitter.all
    erb :peeps
  end

  get '/peep/new' do
    erb :'peep/new'
  end

  post '/peeps' do
    Chitter.create(peep: params[:peep])
    redirect '/peeps'
  end
  # start the server if the ruby file executed directly
  run! if app_file == $PROGRAM_NAME
end
